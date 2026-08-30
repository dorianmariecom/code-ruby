# frozen_string_literal: true

class Code
  class Object
    class Class < Object
      CLASS_DOCUMENTATION = {
        name: "Class",
        description:
          "wraps a value constructor and documents its class and instance functions.",
        examples: %w[Class Class.new(String) Class.documentation.name]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "documentation" => {
          name: "documentation",
          description: "returns documentation for this class.",
          examples: %w[
            Class.documentation.description
            List.documentation.name
            Dictionary.documentation.name
          ]
        },
        "functions" => {
          name: "functions",
          description:
            "returns documented class functions available on this class.",
          examples: %w[
            Class.functions.keys.include?(:new)
            List.functions.keys.include?(:new)
            Dictionary.functions.keys.include?(:from_entries)
          ]
        },
        "instance_functions" => {
          name: "instance_functions",
          description:
            "returns documented functions available on values built by this class.",
          examples: %w[
            Class.instance_functions.keys.include?(:documentation)
            List.instance_functions.keys.include?(:map)
            String.instance_functions.keys.include?(:upcase)
          ]
        },
        "class_functions" => {
          name: "class_functions",
          description:
            "returns documented class functions available on this class.",
          examples: %w[
            Class.class_functions.keys.include?(:new)
            List.class_functions.keys.include?(:new)
            Dictionary.class_functions.keys.include?(:from_entries)
          ]
        },
        "call" => {
          name: "call",
          description: "returns a new value by calling this class constructor.",
          examples: [
            "Class.call(String)",
            "List.call([1, 2])",
            "String.call(:hello)"
          ]
        },
        "extend" => {
          name: "extend",
          description:
            "returns a function that builds a value from this class before running the body.",
          examples: [
            "Widget = Dictionary.extend(() => { self.name = :widget self }) Widget().fetch(:name)",
            "Person = Dictionary.extend((name) => { self.name = name self }) Person(:Ada).fetch(:name)",
            "Counter = Dictionary.extend(() => { self.count = 0 self }) Counter().fetch(:count)"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      def initialize(*args, **_kargs, &)
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
        dynamic_result = code_dynamic_call(code_operator, **args)
        return dynamic_result if dynamic_result

        case code_operator.to_s
        when "documentation"
          sig(args)
          code_documentation
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
        when "call"
          sig(args) { Object.repeat }
          code_call(*args.fetch(:arguments, []).to_code.raw)
        when /=$/
          if raw_class_functions.code_has_key?(code_operator).truthy?
            raw.call(**args)
          else
            super
          end
        else
          raw.call(**args)
        end
      end

      def code_call(*, **_globals)
        raw.code_new(*)
      end

      def code_extend(function)
        code_function = function.to_code

        Function.new(
          code_function.code_parameters,
          code_function.code_body.raw,
          code_function.definition_context,
          code_function.definition_object,
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
        raw_class_functions
      end

      def code_documentation
        Object.documentation_for(raw)
      end

      def code_to_string
        String.new(raw.name.to_s.split("::")[2..].join("::"))
      end

      private

      def raw_class_functions
        Object.documented_functions_for(raw, :class)
      end
    end
  end
end
