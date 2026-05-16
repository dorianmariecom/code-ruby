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
      "f = (x) => {} f(1)"
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

    expect(result).to eq(
      Code.evaluate("1")
    )
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

    expect(result).to eq(
      Code.evaluate('["Import", "Migration", "Acme"]')
    )
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

  it "supports constructor methods on functions" do
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
end
