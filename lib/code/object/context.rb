# frozen_string_literal: true

class Code
  class Object
    class Context < Dictionary
      CLASS_DOCUMENTATION = {
        name: "Context",
        description:
          "stores scoped identifier values used while evaluating code.",
        examples: [
          "context",
          "Context.new(a: 1)",
          "Context.new({ a: 1 }, Context.new(b: 2)).lookup!(:b)"
        ]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "lookup!" => {
          name: "lookup!",
          description:
            "returns the context that defines an identifier or raises when it is missing.",
          examples: [
            "Context.new(a: 1).lookup!(:a)",
            "Context.new({ a: 1 }, Context.new(b: 2)).lookup!(:b)",
            "Context.new(a: 1).lookup!(:missing) rescue nothing"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      attr_accessor :parent

      def initialize(*args, **_kargs, &)
        super(args.first)
        @parent = args.second if args.second.is_a?(Dictionary)
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code

        case code_operator.to_s
        when "lookup!"
          sig(args) { Object }
          code_lookup!(args.fetch(:arguments, []).to_code.code_first)
        else
          super
        end
      end

      def code_lookup!(identifier)
        code_identifier = identifier.to_code

        if code_has_key?(code_identifier).truthy?
          self
        elsif parent?
          parent.code_lookup!(code_identifier)
        else
          raise Error, "#{code_identifier} is not defined"
        end
      end

      def code_assign(identifier, value)
        code_identifier = identifier.to_code
        context = self

        context = context.parent while context.parent? && context.code_has_key?(code_identifier).falsy?

        if context.code_has_key?(code_identifier).falsy?
          context = self
        end

        context.code_set(code_identifier, value)
      end

      def merge(other)
        Context.new(raw.merge(other.raw), parent || other.parent)
      end

      def code_deep_duplicate
        duplicate = Context.new
        raw.each do |key, value|
          duplicate.code_set(
            key.code_deep_duplicate,
            value.code_deep_duplicate
          )
        end
        duplicate.parent = parent
        duplicate
      end

      def parent?
        !!parent
      end
    end
  end
end
