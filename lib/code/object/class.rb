# frozen_string_literal: true

class Code
  class Object
    class Class < Object
      INSTANCE_FUNCTIONS = {
        "call" => {
          name: "call",
          description: "builds a new value by calling the wrapped class.",
          examples: ["List.call([1, 2])", "String.call(:hello)", "Integer.call(1)"]
        },
        "extend" => {
          name: "extend",
          description: "returns a constructor function that extends the class.",
          examples: [
            "Widget = Dictionary.extend(() => { self.name = :widget })",
            "Person = Dictionary.extend((name) => { self.name = name })",
            "Counter = Dictionary.extend(() => { self.count = 0 })"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      def initialize(*args, **_kargs, &_block)
        self.raw =
          if args.first.is_a?(Class)
            args.first.raw
          elsif args.first.is_an?(Object)
            args.first.class
          elsif args.first && args.first.ancestors.include?(Object)
            args.first
          else
            Nothing
          end
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code

        case code_operator.to_s
        when "functions"
          sig(args)
          code_functions
        when "instance_functions"
          sig(args)
          code_instance_functions
        when "class_functions"
          sig(args)
          code_class_functions
        when "extend"
          sig(args) { Function }
          code_extend(args.fetch(:arguments).code_first)
        else
          raw.call(**args)
        end
      end

      def code_call(*arguments, **_globals)
        raw.code_new(*arguments)
      end

      def code_extend(function)
        code_function = function.to_code

        Function.new(
          code_function.code_parameters,
          code_function.code_body.raw,
          code_function.definition_context,
          parent: self
        )
      end

      def code_functions
        code_class_functions
      end

      def code_instance_functions
        Object.documented_functions_for(raw, :instance)
      end

      def code_class_functions
        Object.documented_functions_for(raw, :class)
      end

      def code_to_string
        String.new(raw.name.to_s.split("::")[2..].join("::"))
      end
    end
  end
end
