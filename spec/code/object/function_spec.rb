# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Function do
  [
    ["even? = (i) => { i.even? } even?(2)", "true"],
    ["even? = (i:) => { i.even? } even?(i: 2)", "true"],
    ["add = (a, b) => { a + b } add(1, 2)", "3"],
    ["minus = (a:, b:) => { a - b } minus(b: 1, a: 2)", "1"]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end

  context "valid" do
    [
      "f = () => {} f",
      "f = (x) => {} f(1)",
      "f = (x:) => {} f(x: 1)"
    ].each do |input|
      it "#{input} is valid" do
        Code.evaluate(input)
      end
    end
  end

  context "invalid" do
    [
      "f = (x) => {} f()",
      "f = (x:) => {} f(1)",
      "f = (x:) => {} f(y: 1)"
    ].each do |input|
      it "#{input} is invalid" do
        expect { Code.evaluate(input) }.to raise_error(Code::Error)
      end
    end
  end

  it "evaluates omitted keyword argument defaults" do
    result = Code.evaluate(<<~CODE)
      f = (number: 1, text: "fallback", missing: nothing, headers: {}) => {
        [
          number,
          text,
          missing.nothing?,
          headers.merge({ authorization: "Bearer x" })
        ]
      }

      f()
    CODE

    expect(result).to eq(
      Code.evaluate('[1, "fallback", true, { authorization: "Bearer x" }]')
    )
  end

  it "evaluates keyword defaults in the call context" do
    expect(Code.evaluate("f = (a:, b: a + 1) => { b } f(a: 2)")).to eq(
      Code.evaluate("3")
    )
  end

  it "binds self when calling a function stored on a dictionary" do
    result = Code.evaluate(<<~CODE)
      object = {}
      object.value = 1
      object.fetch = () => {
        self.value
      }
      object.fetch()
    CODE

    expect(result).to eq(Code.evaluate("1"))
  end

  it "captures self for constructor-like functions that return self" do
    result = Code.evaluate(<<~CODE)
        User = (given_name:, family_name:, birth_date:) => {
          self.given_name = given_name.to_string.presence
          self.family_name = family_name.to_string.presence
          self.birth_date = birth_date.presence&.to_date
          self.full_name = () => {
            [self.given_name, self.family_name].compact.join(" ")
          }
          self.age = () => {
            return unless(self.birth_date)

            self.birth_date.year
          }

          return(self)
        }

        user = User(given_name: "Dorian", family_name: "Marie", birth_date: "1992-08-11")
        [user.given_name, user.family_name, user.full_name, user.age]
      CODE

    expect(result).to eq(
      Code::Object::List.new(
        [
          Code::Object::String.new("Dorian"),
          Code::Object::String.new("Marie"),
          Code::Object::String.new("Dorian Marie"),
          Code::Object::Integer.new(1992)
        ]
      )
    )
  end

  it "binds parent to the enclosing self for nested constructor functions" do
    result = Code.evaluate(<<~CODE)
        Account = (name:) => {
          self.name = name

          self.Project = (name:) => {
            self.name = name

            self.Task = (name:) => {
              self.name = name

              [
                self.name,
                parent.name,
                parent.parent.name
              ]
            }

            return(self)
          }

          return(self)
        }

        account = Account(name: "Acme")
        Project = account.get(:Project)
        project = Project(name: "Migration")
        Task = project.get(:Task)
        Task(name: "Import")
      CODE

    expect(result).to eq(Code.evaluate('["Import", "Migration", "Acme"]'))
  end

  it "allows parent chains deeper than two levels" do
    result = Code.evaluate(<<~CODE)
        A = (name:) => {
          self.name = name
          self.B = (name:) => {
            self.name = name
            self.C = (name:) => {
              self.name = name
              self.D = (name:) => {
                self.name = name
                parent.parent.parent.name
              }
              return(self)
            }
            return(self)
          }
          return(self)
        }

        a = A(name: "a")
        B = a.get(:B)
        b = B(name: "b")
        C = b.get(:C)
        c = C(name: "c")
        D = c.get(:D)
        D(name: "d")
      CODE

    expect(result).to eq(Code::Object::String.new("a"))
  end

  it "supports constructor functions on functions" do
    result = Code.evaluate(<<~CODE)
        User = (given_name:, family_name:) => {
          self.given_name = given_name
          self.family_name = family_name
          self.full_name = () => {
            [self.given_name, self.family_name].join(" ")
          }
          return(self)
        }

        User.all = () => {
          [
            User(given_name: "Dorian", family_name: "Marie"),
            User(given_name: "Ada", family_name: "Lovelace")
          ]
        }

        User.first = () => {
          User.all.first
        }

        User.first.full_name
      CODE

    expect(result).to eq(Code::Object::String.new("Dorian Marie"))
  end

  it "supports extending constructors and forwarding super arguments" do
    result = Code.evaluate(<<~CODE)
        Person = (given_name:, family_name:) => {
          self.given_name = given_name
          self.family_name = family_name
          self.full_name = () => {
            [self.given_name, self.family_name].join(" ")
          }
          return(self)
        }

        Employee = Person.extend((employee_id:, given_name:, family_name:) => {
          super
          self.employee_id = employee_id
          return(self)
        })

        employee = Employee(employee_id: "EMP-001", given_name: "Dorian", family_name: "Marie")
        [employee.employee_id, employee.full_name]
      CODE

    expect(result).to eq(
      Code::Object::List.new(
        [
          Code::Object::String.new("EMP-001"),
          Code::Object::String.new("Dorian Marie")
        ]
      )
    )
  end

  it "distinguishes super from super()" do
    result = Code.evaluate(<<~CODE)
        Person = (given_name:, family_name:) => {
          self.full_name = () => {
            [given_name, family_name].join(" ")
          }
          return(self)
        }

        Anonymous = Person.extend(() => {
          super()
          self.full_name = () => { "anonymous" }
          return(self)
        })

        [Anonymous().full_name, Person(given_name: "Ada", family_name: "Lovelace").full_name]
      CODE

    expect(result).to eq(
      Code::Object::List.new(
        [
          Code::Object::String.new("anonymous"),
          Code::Object::String.new("Ada Lovelace")
        ]
      )
    )
  end

  it "captures rest, positional, keyword, and block arguments" do
    result = Code.evaluate(<<~CODE)
        increment = (value) => { value + 1 }
        one = () => { 1 }
        two = () => { 2 }

        collect = (...rest, *arguments, **keyword_arguments, &block, &&blocks) => {
          [
            rest.size,
            arguments,
            keyword_arguments,
            block(2),
            blocks.size,
            blocks.first.call
          ]
        }

        collect(1, 2, topic: "docs", &increment, &&[one, two])
      CODE

    expect(result).to eq(
      Code::Object::List.new(
        [
          Code::Object::Integer.new(6),
          Code::Object::List.new(
            [Code::Object::Integer.new(1), Code::Object::Integer.new(2)]
          ),
          Code::Object::Dictionary.new(
            "topic" => Code::Object::String.new("docs")
          ),
          Code::Object::Integer.new(3),
          Code::Object::Integer.new(2),
          Code::Object::Integer.new(1)
        ]
      )
    )
  end

  it "does not bind conventional names for unnamed argument operators" do
    expect do Code.evaluate(<<~CODE) end.to raise_error(
        collect = (..., *, **) => {
          [rest, arguments, keyword_arguments]
        }

        collect(1, 2, topic: "docs")
      CODE
      Code::Error,
      /rest is not defined/
    )
  end

  it "forwards unnamed argument operators as empty without matching locals" do
    result = Code.evaluate(<<~CODE)
        capture_rest = (...rest) => { rest }
        capture_arguments = (*arguments) => { arguments }
        capture_keywords = (**keyword_arguments) => { keyword_arguments }
        capture_block = (&block) => { block.nothing? }
        capture_blocks = (&&blocks) => {
          blocks.map { |block| block.call }
        }

        caller = (..., *, **, &, &&) => {
          [
            capture_rest(...).size,
            capture_arguments(*),
            capture_keywords(**),
            capture_block(&),
            capture_blocks(&&)
          ]
        }

        one = () => { 1 }
        two = () => { 2 }
        three = () => { 3 }

        caller(1, 2, topic: "docs", &one, &&[two, three])
      CODE

    expect(result).to eq(Code.evaluate("[0, [], {}, true, []]"))
  end

  it "raises when unnamed argument operator captures are referenced by conventional name" do
    expect do Code.evaluate(<<~CODE) end.to raise_error(
        collect = (..., &, &&, *, **) => {
          [rest, block, blocks, arguments, keyword_arguments]
        }

        collect(..., &, &&, *, **)
      CODE
      Code::Error,
      /rest is not defined/
    )
  end

  it "treats forwarding operators without matching locals as empty" do
    result = Code.evaluate(<<~CODE)
        collect = (...rest, &block, &&blocks, *arguments, **keyword_arguments) => {
          [rest, block, blocks, arguments, keyword_arguments]
        }

        collect(..., &, &&, *, **)
      CODE

    expect(result).to eq(Code.evaluate("[[], nothing, [], [], {}]"))
  end

  it "keeps function values in regular splat arguments without block captures" do
    result = Code.evaluate(<<~CODE)
        callback = () => { 1 }
        collect = (*arguments) => { arguments.first.call }

        collect(callback)
      CODE

    expect(result).to eq(Code::Object::Integer.new(1))
  end

  it "forwards rest arguments to extended functions" do
    result = Code.evaluate(<<~CODE)
        Item = (name:, amount:) => {
          self.name = name
          self.amount = amount
          return(self)
        }

        DiscountedItem = Item.extend((...rest) => {
          super(...rest)
          self.amount = self.amount - 1
          return(self)
        })

        item = DiscountedItem(name: "sample", amount: 3)
        [item.name, item.amount]
      CODE

    expect(result).to eq(
      Code::Object::List.new(
        [Code::Object::String.new("sample"), Code::Object::Integer.new(2)]
      )
    )
  end

  it "extends built-in constructors and exposes instance function docs" do
    result = Code.evaluate(<<~CODE)
        List = List.extend((...) => {
          super(...)

          self.flat_compact = () => {
            parent.flatten.compact
          }

          return(self)
        })

        list = [1, [2, 3], [nothing], nothing]
        [
          list.flat_compact == [1, 2, 3],
          list.functions.keys.include?(:flat_compact),
          List().functions.keys.include?(:flat_compact),
          List().class_functions.keys.include?(:flat_compact),
          List().instance_functions.keys.include?(:flat_compact),
          List.functions.keys.include?(:flat_compact),
          List.class_functions.keys.include?(:flat_compact),
          List.instance_functions.keys.include?(:flat_compact)
        ]
      CODE

    expect(result).to eq(
      Code::Object::List.new([true, true, true, true, true, false, false, true])
    )
  end

  it "documents user-defined instance and class functions" do
    result = Code.evaluate(<<~CODE)
        Widget = () => {
          describe = () => { "widget" }
          describe.documentation({
            description: "returns a label",
            examples: ["Widget().describe"]
          })
          self.describe = describe
          return(self)
        }

        build = () => {
          Widget()
        }

        build.documentation({
          description: "builds a widget",
          examples: ["Widget.build"]
        })

        Widget.build = build

        widget = Widget()

        [
          widget.instance_functions.fetch(:describe).description,
          widget.instance_functions.fetch(:describe).examples.first,
          Widget.class_functions.fetch(:build).description,
          Widget.class_functions.fetch(:build).examples.first
        ]
      CODE

    expect(result).to eq(
      Code::Object::List.new(
        [
          Code::Object::String.new("returns a label"),
          Code::Object::String.new("Widget().describe"),
          Code::Object::String.new("builds a widget"),
          Code::Object::String.new("Widget.build")
        ]
      )
    )
  end

  it "inherits documented instance functions through extensions" do
    result = Code.evaluate(<<~CODE)
        Base = () => {
          self.base_label = () => { "base" }
          return(self)
        }

        Base().base_label

        Child = Base.extend(() => {
          super()
          self.child_label = () => { "child" }
          return(self)
        })

        Child().child_label

        [
          Base.instance_functions.keys.include?(:base_label),
          Child.instance_functions.keys.include?(:base_label),
          Child.instance_functions.keys.include?(:child_label)
        ]
      CODE

    expect(result).to eq(Code::Object::List.new([true, true, true]))
  end
end
