# frozen_string_literal: true

class Code
  class Object
    class Boolean < ::Code::Object
      CLASS_DOCUMENTATION = {
        name: "Boolean",
        description: "represents true or false.",
        examples: %w[Boolean Boolean.new(true) Boolean.new(false)]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "&" => {
          name: "&",
          description: "returns true when both booleans are true.",
          examples: ["true & true", "true & false", "false & false"]
        },
        "bitwise_and" => {
          name: "bitwise_and",
          description: "returns true when both booleans are true.",
          examples: %w[
            true.bitwise_and(true)
            true.bitwise_and(false)
            false.bitwise_and(false)
          ]
        },
        "|" => {
          name: "|",
          description: "returns true when either boolean is true.",
          examples: ["true | false", "false | true", "false | false"]
        },
        "bitwise_or" => {
          name: "bitwise_or",
          description: "returns true when either boolean is true.",
          examples: %w[
            true.bitwise_or(false)
            false.bitwise_or(true)
            false.bitwise_or(false)
          ]
        },
        "^" => {
          name: "^",
          description: "returns true when exactly one boolean is true.",
          examples: ["true ^ false", "true ^ true", "false ^ false"]
        },
        "bitwise_xor" => {
          name: "bitwise_xor",
          description: "returns true when exactly one boolean is true.",
          examples: %w[
            true.bitwise_xor(false)
            true.bitwise_xor(true)
            false.bitwise_xor(false)
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      def initialize(*args, **_kargs, &)
        self.raw =
          (args.first.is_an?(Object) ? args.first.truthy? : !!args.first)
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "&", "bitwise_and"
          sig(args) { Boolean }
          code_bitwise_and(code_value)
        when "^", "bitwise_xor"
          sig(args) { Boolean }
          code_bitwise_xor(code_value)
        when "|", "bitwise_or"
          sig(args) { Boolean }
          code_bitwise_or(code_value)
        else
          super
        end
      end

      def code_bitwise_and(other)
        code_other = other.to_code

        Boolean.new(raw & code_other.raw)
      end

      def code_bitwise_or(other)
        code_other = other.to_code

        Boolean.new(raw | code_other.raw)
      end

      def code_bitwise_xor(other)
        code_other = other.to_code

        Boolean.new(raw ^ code_other.raw)
      end

      def truthy?
        raw
      end

      def present?
        raw.present?
      end
    end
  end
end
