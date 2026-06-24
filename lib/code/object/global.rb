# frozen_string_literal: true

class Code
  class Object
    class Global < Object
      CLASS_DOCUMENTATION = {
        name: "Global",
        description:
          "dispatches top-level functions, constructors, and control flow helpers.",
        examples: [
          "globals.keys.include?(:puts)",
          "classes.keys.include?(:List)",
          "evaluate(\"1 + 2\")"
        ]
      }.freeze
      GETTING_STARTED_EXAMPLES = [
        {
          name: "expression",
          description: "evaluate an expression and print the result.",
          source: "1 + 2",
          expected: "3",
          command: "bin/code '1 + 2'"
        },
        {
          name: "list",
          description: "transform every item in a list with a block.",
          source: "[1, 2, 3].map { |number| number * 2 }",
          expected: "[2, 4, 6]",
          command: "bin/code '[1, 2, 3].map { |number| number * 2 }'"
        },
        {
          name: "dictionary",
          description:
            "store named values in a dictionary and read them by key.",
          source: "user = { name: :Dorian, age: 31 } user.name",
          expected: ":Dorian",
          command: "bin/code 'user = { name: :Dorian, age: 31 } user.name'"
        },
        {
          name: "function",
          description: "define a function and call it with an argument.",
          source: "double = (number) => { number * 2 } double(21)",
          expected: "42",
          command: "bin/code 'double = (number) => { number * 2 } double(21)'"
        },
        {
          name: "documentation",
          description: "query built-in documentation from the language.",
          source: "globals.fetch(:puts).examples.first",
          expected: "\"puts(:hello)\"",
          command: "bin/code 'globals.fetch(:puts).examples.first'"
        }
      ].freeze
      GETTING_STARTED = {
        title: "Getting started with Code",
        description: "a short guide with steps and runnable examples.",
        steps: [
          {
            title: "Install dependencies",
            action: "run bundle install from the repository root.",
            command: "bundle install"
          },
          {
            title: "Run one expression",
            action: "pass Code source to bin/code and read the printed result.",
            example: GETTING_STARTED_EXAMPLES.fetch(0)
          },
          {
            title: "Format source",
            action: "use -f before a snippet or file to print formatted Code.",
            command: "bin/code -f '{a:1}'",
            expected: "{ a: 1 }"
          },
          {
            title: "Work with data",
            action: "use lists, dictionaries, and functions together.",
            examples: GETTING_STARTED_EXAMPLES[1, 3]
          },
          {
            title: "Find built-in functions",
            action:
              "use globals, functions, instance_functions, and class_functions from inside Code.",
            example: GETTING_STARTED_EXAMPLES.fetch(4)
          }
        ],
        examples: GETTING_STARTED_EXAMPLES,
        next_steps: [
          "run bin/code 'getting_started'",
          "run bin/code 'globals.keys'",
          "run bin/code 'List.instance_functions.keys'"
        ]
      }.freeze
      FUNCTIONS = {
        "Base64" => {
          name: "Base64",
          description:
            "returns the Base64 class when called without arguments, otherwise calls Base64.new.",
          examples: %w[Base64 Base64.new Base64.new(nothing)]
        },
        "Boolean" => {
          name: "Boolean",
          description:
            "returns the Boolean class when called without arguments, otherwise calls Boolean.new.",
          examples: %w[Boolean Boolean.new Boolean.new(nothing)]
        },
        "Class" => {
          name: "Class",
          description:
            "returns the Class class when called without arguments, otherwise calls Class.new.",
          examples: %w[Class Class.new Class.new(nothing)]
        },
        "Code" => {
          name: "Code",
          description:
            "returns the Code class when called without arguments, otherwise calls Code.new.",
          examples: %w[Code Code.new Code.new(nothing)]
        },
        "Context" => {
          name: "Context",
          description:
            "returns the Context class when called without arguments, otherwise calls Context.new.",
          examples: %w[Context Context.new Context.new(nothing)]
        },
        "Cryptography" => {
          name: "Cryptography",
          description:
            "returns the Cryptography class when called without arguments, otherwise calls Cryptography.new.",
          examples: %w[Cryptography Cryptography.new Cryptography.new(nothing)]
        },
        "Date" => {
          name: "Date",
          description:
            "returns the Date class when called without arguments, otherwise calls Date.new.",
          examples: %w[Date Date.new Date.new(nothing)]
        },
        "Decimal" => {
          name: "Decimal",
          description:
            "returns the Decimal class when called without arguments, otherwise calls Decimal.new.",
          examples: %w[Decimal Decimal.new Decimal.new(nothing)]
        },
        "Dictionary" => {
          name: "Dictionary",
          description:
            "returns the Dictionary class when called without arguments, otherwise calls Dictionary.new.",
          examples: %w[Dictionary Dictionary.new Dictionary.new(nothing)]
        },
        "Duration" => {
          name: "Duration",
          description:
            "returns the Duration class when called without arguments, otherwise calls Duration.new.",
          examples: %w[Duration Duration.new Duration.new(nothing)]
        },
        "Function" => {
          name: "Function",
          description:
            "returns the Function class when called without arguments, otherwise calls Function.new.",
          examples: %w[Function Function.new Function.new(nothing)]
        },
        "Html" => {
          name: "Html",
          description:
            "returns the Html class when called without arguments, otherwise calls Html.new.",
          examples: %w[Html Html.new Html.new(nothing)]
        },
        "Http" => {
          name: "Http",
          description:
            "returns the Http class when called without arguments, otherwise calls Http.new.",
          examples: %w[Http Http.new Http.new(nothing)]
        },
        "Ics" => {
          name: "Ics",
          description:
            "returns the Ics class when called without arguments, otherwise calls Ics.new.",
          examples: %w[Ics Ics.new Ics.new(nothing)]
        },
        "IdentifierList" => {
          name: "IdentifierList",
          description:
            "returns the IdentifierList class when called without arguments, otherwise calls IdentifierList.new.",
          examples: %w[
            IdentifierList
            IdentifierList.new
            IdentifierList.new(nothing)
          ]
        },
        "Integer" => {
          name: "Integer",
          description:
            "returns the Integer class when called without arguments, otherwise calls Integer.new.",
          examples: %w[Integer Integer.new Integer.new(nothing)]
        },
        "Json" => {
          name: "Json",
          description:
            "returns the Json class when called without arguments, otherwise calls Json.new.",
          examples: %w[Json Json.new Json.new(nothing)]
        },
        "List" => {
          name: "List",
          description:
            "returns the List class when called without arguments, otherwise calls List.new.",
          examples: %w[List List.new List.new(nothing)]
        },
        "Nothing" => {
          name: "Nothing",
          description:
            "returns the Nothing class when called without arguments, otherwise calls Nothing.new.",
          examples: %w[Nothing Nothing.new Nothing.new(nothing)]
        },
        "Number" => {
          name: "Number",
          description:
            "returns the Number class when called without arguments, otherwise calls Number.new.",
          examples: %w[Number Number.new Number.new(nothing)]
        },
        "Object" => {
          name: "Object",
          description:
            "returns the Object class when called without arguments, otherwise calls Object.new.",
          examples: %w[Object Object.new Object.new(nothing)]
        },
        "Parameter" => {
          name: "Parameter",
          description:
            "returns the Parameter class when called without arguments, otherwise calls Parameter.new.",
          examples: %w[Parameter Parameter.new Parameter.new(nothing)]
        },
        "Regex" => {
          name: "Regex",
          description:
            "returns the Regex class when called without arguments, otherwise calls Regex.new.",
          examples: [
            "Regex",
            "Regex.new(\"a|b|c\")",
            "Regex(\"^hello\", ignore_case: true)"
          ]
        },
        "Range" => {
          name: "Range",
          description:
            "returns the Range class when called without arguments, otherwise calls Range.new.",
          examples: %w[Range Range.new Range.new(nothing)]
        },
        "Smtp" => {
          name: "Smtp",
          description:
            "returns the Smtp class when called without arguments, otherwise calls Smtp.new.",
          examples: %w[Smtp Smtp.new Smtp.new(nothing)]
        },
        "String" => {
          name: "String",
          description:
            "returns the String class when called without arguments, otherwise calls String.new.",
          examples: %w[String String.new String.new(nothing)]
        },
        "Time" => {
          name: "Time",
          description:
            "returns the Time class when called without arguments, otherwise calls Time.new.",
          examples: %w[Time Time.new Time.new(nothing)]
        },
        "Url" => {
          name: "Url",
          description:
            "returns the Url class when called without arguments, otherwise calls Url.new.",
          examples: %w[Url Url.new Url.new(nothing)]
        },
        "classes" => {
          name: "classes",
          description:
            "returns documentation for built-in classes exposed by globals.",
          examples: %w[
            classes
            classes.keys.include?(:List)
            classes.fetch(:String).description
          ]
        },
        "break" => {
          name: "break",
          description: "exits the current loop and returns an optional value.",
          examples: [
            "[1].each { break }",
            "[1].each { break 1 }",
            "while true { break :done }"
          ]
        },
        "continue" => {
          name: "continue",
          description: "skips the rest of the current loop iteration.",
          examples: [
            "[1].each { continue }",
            "[1, 2].each { |value| continue if value == 1 }",
            "while false { continue }"
          ]
        },
        "context" => {
          name: "context",
          description: "returns the current evaluation context dictionary.",
          examples: %w[context context.keys context.has_key?(:context)]
        },
        "evaluate" => {
          name: "evaluate",
          description:
            "evaluates a string as Code source and returns its result.",
          examples: [
            "evaluate(\"1 + 2\")",
            "evaluate(\":hello\")",
            "evaluate(\"[1, 2].size\")"
          ]
        },
        "getting_started" => {
          name: "getting_started",
          description:
            "returns a short guide with runnable examples and commands.",
          examples: %w[
            getting_started.title
            getting_started.steps.first.command
            getting_started.examples.map(&:name)
          ]
        },
        "globals" => {
          name: "globals",
          description:
            "returns documentation for top-level functions and constructors.",
          examples: %w[
            globals
            globals.keys.include?(:List)
            globals.fetch(:puts).description
          ]
        },
        "next" => {
          name: "next",
          description:
            "exits the current block iteration and returns an optional value.",
          examples: [
            "[1].map { next }",
            "[1].map { next 2 }",
            "[1, 2].map { next it if it > 1 }"
          ]
        },
        "p" => {
          name: "p",
          description: "writes inspected values to output and returns nothing.",
          examples: ["p(:hello)", "p(1, 2)", "p([1, 2])"]
        },
        "print" => {
          name: "print",
          description: "writes values to output without adding a newline.",
          examples: ["print(:hello)", "print(1, 2)", "print(\"hello\")"]
        },
        "puts" => {
          name: "puts",
          description:
            "writes values to output with newlines and returns nothing.",
          examples: ["puts(:hello)", "puts(1, 2)", "puts(\"hello\")"]
        },
        "read" => {
          name: "read",
          description: "reads one line from input.",
          examples: ["read", "name = read", "read.to_string"]
        },
        "redo" => {
          name: "redo",
          description: "retries the current loop iteration.",
          examples: [
            "[1].each { redo if false }",
            "while false { redo }",
            "[1, 2].each { |value| redo if value == 0 }"
          ]
        },
        "retry" => {
          name: "retry",
          description: "retries the current loop iteration.",
          examples: [
            "[1].each { retry if false }",
            "while false { retry }",
            "[1, 2].each { |value| retry if value == 0 }"
          ]
        },
        "return" => {
          name: "return",
          description:
            "exits the current function and returns an optional value.",
          examples: [
            "() => { return }",
            "() => { return 1 }",
            "f = () => { return :done } f()"
          ]
        }
      }.freeze

      def self.functions
        Object.sorted_dictionary(FUNCTIONS)
      end

      def self.classes
        Object.sorted_dictionary(
          documented_classes.to_h do |name, klass|
            [name, Object.documentation_for(klass)]
          end
        )
      end

      def self.documented_classes
        {
          "Base64" => Object::Base64,
          "Boolean" => Boolean,
          "Class" => Class,
          "Code" => Code,
          "Context" => Context,
          "Cryptography" => Cryptography,
          "Date" => Date,
          "Decimal" => Decimal,
          "Dictionary" => Dictionary,
          "Duration" => Duration,
          "Function" => Function,
          "Html" => Html,
          "Http" => Http,
          "Ics" => Ics,
          "IdentifierList" => IdentifierList,
          "Integer" => Integer,
          "Json" => Json,
          "List" => List,
          "Nothing" => Nothing,
          "Number" => Number,
          "Object" => Object,
          "Parameter" => Parameter,
          "Regex" => Regex,
          "Range" => Range,
          "Smtp" => Smtp,
          "String" => String,
          "Time" => Time,
          "Url" => Url
        }
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        output = args.fetch(:output)
        input = args.fetch(:input)
        code_context = args.fetch(:context).to_code
        code_value = code_arguments.code_first
        globals = multi_fetch(args, *GLOBALS)

        if code_context.code_has_key?(code_operator).truthy?
          code_result = code_context.code_fetch(code_operator)

          if code_result.is_a?(Super) ||
               (
                 code_result.is_a?(Function) &&
                   args.fetch(:explicit_arguments, false)
               )
            return code_result.call(**args, operator: nil)
          end

          sig(args)
          return code_result
        end

        case code_operator.to_s
        when "Boolean"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Boolean.new(*code_arguments.raw)
          else
            Class.new(Boolean)
          end
        when "break"
          sig(args) { Object.repeat }
          raise Error::Break, code_value || Nothing.new
        when "continue"
          sig(args) { Object.repeat }
          raise Error::Continue, code_value || Nothing.new
        when "next"
          sig(args) { Object.repeat }
          raise Error::Next, code_value || Nothing.new
        when "redo", "retry"
          sig(args) { Object.repeat }
          raise Error::Retry, code_value || Nothing.new
        when "return"
          sig(args) { Object.repeat }
          raise Error::Return, code_value || Nothing.new
        when "Class"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Class.new(*code_arguments.raw)
          else
            Class.new(Class)
          end
        when "Date"
          sig(args) { Object.repeat }
          code_arguments.any? ? Date.new(*code_arguments.raw) : Class.new(Date)
        when "Decimal"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Decimal.new(*code_arguments.raw)
          else
            Class.new(Decimal)
          end
        when "Dictionary"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Dictionary.new(*code_arguments.raw)
          else
            Class.new(Dictionary)
          end
        when "Duration"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Duration.new(*code_arguments.raw)
          else
            Class.new(Duration)
          end
        when "Function"
          sig(args)
          if code_arguments.any?
            Function.new(*code_arguments.raw)
          else
            Class.new(Function)
          end
        when "globals"
          sig(args)
          self.class.functions
        when "classes"
          sig(args)
          self.class.classes
        when "Integer"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Integer.new(*code_arguments.raw)
          else
            Class.new(Integer)
          end
        when "List"
          sig(args) { Object.repeat }
          code_arguments.any? ? List.new(*code_arguments.raw) : Class.new(List)
        when "Nothing"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Nothing.new(*code_arguments.raw)
          else
            Class.new(Nothing)
          end
        when "context"
          sig(args)
          code_context
        when "Object"
          sig(args)
          if code_arguments.any?
            Object.new(*code_arguments.raw)
          else
            Class.new(Object)
          end
        when "Range"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Range.new(*code_arguments.raw)
          else
            Class.new(Range)
          end
        when "Regex"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Regex.new(*code_arguments.raw)
          else
            Class.new(Regex)
          end
        when "String"
          sig(args) { Object.repeat }
          if code_arguments.any?
            String.new(*code_arguments.raw)
          else
            Class.new(String)
          end
        when "Time"
          sig(args) { Object.repeat }
          code_arguments.any? ? Time.new(*code_arguments.raw) : Class.new(Time)
        when "Context"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Context.new(*code_arguments.raw)
          else
            Class.new(Context)
          end
        when "Code"
          sig(args) { Object.repeat }
          code_arguments.any? ? Code.new(*code_arguments.raw) : Class.new(Code)
        when "Parameter"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Parameter.new(*code_arguments.raw)
          else
            Class.new(Parameter)
          end
        when "IdentifierList"
          sig(args) { Object.repeat }
          if code_arguments.any?
            IdentifierList.new(*code_arguments.raw)
          else
            Class.new(IdentifierList)
          end
        when "Html"
          sig(args) { Object.repeat }
          code_arguments.any? ? Html.new(*code_arguments.raw) : Class.new(Html)
        when "Http"
          sig(args) { Object.repeat }
          code_arguments.any? ? Http.new(*code_arguments.raw) : Class.new(Http)
        when "Smtp"
          sig(args) { Object.repeat }
          code_arguments.any? ? Smtp.new(*code_arguments.raw) : Class.new(Smtp)
        when "Base64"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Base64.new(*code_arguments.raw)
          else
            Class.new(Base64)
          end
        when "Cryptography"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Cryptography.new(*code_arguments.raw)
          else
            Class.new(Cryptography)
          end
        when "Json"
          sig(args) { Object.repeat }
          code_arguments.any? ? Json.new(*code_arguments.raw) : Class.new(Json)
        when "Ics"
          sig(args) { Object.repeat }
          code_arguments.any? ? Ics.new(*code_arguments.raw) : Class.new(Ics)
        when "evaluate"
          sig(args) { Object }
          Code.code_evaluate(code_value.code_to_string, **globals)
        when "getting_started"
          sig(args)
          GETTING_STARTED.to_code
        when "p"
          sig(args) { Object.repeat }
          output.puts(*code_arguments.raw.map(&:inspect))
          Nothing.new
        when "print"
          sig(args) { Object.repeat }
          output.print(*code_arguments.raw)
          Nothing.new
        when "read"
          sig(args) { Object.repeat }
          input.gets.to_code
        when "puts"
          sig(args) { Object.repeat }
          output.puts(*code_arguments.raw)
          Nothing.new
        when "Number"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Number.new(*code_arguments.raw)
          else
            Class.new(Number)
          end
        when "Url"
          sig(args) { Object.repeat }
          code_arguments.any? ? Url.new(*code_arguments.raw) : Class.new(Url)
        else
          code_context = code_context.code_lookup!(code_operator)
          code_result = code_context.code_fetch(code_operator)

          if code_result.is_a?(Super) ||
               (
                 code_result.is_a?(Function) &&
                   args.fetch(:explicit_arguments, false)
               )
            code_result.call(**args, operator: nil)
          else
            sig(args)
            code_result
          end
        end
      end
    end
  end
end
