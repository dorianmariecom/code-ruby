# frozen_string_literal: true

class Code
  class Object
    class Number < Object
      CLASS_DOCUMENTATION = {
        name: "Number",
        description:
          "represents numeric behavior shared by integers and decimals.",
        examples: [
          "Number.documentation.name",
          "Number.instance_functions.keys.include?(:between?)",
          "1.5.clamp(0, 1)"
        ]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "between?" => {
          name: "between?",
          description: "returns whether the number is within inclusive bounds.",
          examples: [
            "2.between?(1, 3)",
            "1.5.between?(1, 2)",
            "4.between?(1, 3)"
          ]
        },
        "clamp" => {
          name: "clamp",
          description: "returns the number limited to inclusive bounds.",
          examples: ["5.clamp(1, 3)", "0.clamp(1, 3)", "2.5.clamp(1, 3)"]
        },
        "divide" => {
          name: "divide",
          description:
            "returns floor division of the number by another number.",
          examples: %w[5.divide(2) 10.divide(3) 9.5.divide(2)]
        },
        "divide_modulo" => {
          name: "divide_modulo",
          description: "returns floor division and modulo as a list.",
          examples: %w[
            5.divide_modulo(2)
            10.divide_modulo(3)
            9.5.divide_modulo(2)
          ]
        },
        "next" => {
          name: "next",
          description: "returns the number plus one.",
          examples: %w[1.next 1.5.next -1.next]
        },
        "successor" => {
          name: "successor",
          description: "returns the number plus one, matching next.",
          examples: %w[1.successor 1.5.successor -1.successor]
        },
        "previous" => {
          name: "previous",
          description: "returns the number minus one.",
          examples: %w[1.previous 1.5.previous -1.previous]
        },
        "predecessor" => {
          name: "predecessor",
          description: "returns the number minus one, matching previous.",
          examples: %w[1.predecessor 1.5.predecessor -1.predecessor]
        },
        "remainder" => {
          name: "remainder",
          description: "returns the remainder from division by another number.",
          examples: %w[5.remainder(2) 10.remainder(3) 9.5.remainder(2)]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      def code_between?(min, max)
        code_min = min.to_code
        code_max = max.to_code

        Boolean.new(raw.between?(code_min.raw, code_max.raw))
      end

      def code_clamp(min, max)
        code_min = min.to_code
        code_max = max.to_code

        self.class.new(raw.clamp(code_min.raw, code_max.raw))
      end

      def code_divide(other)
        code_other = other.to_code

        Integer.new(raw.div(code_other.raw))
      end

      def code_divide_modulo(other)
        code_other = other.to_code

        List.new(raw.divmod(code_other.raw))
      end

      def code_next
        code_plus(Integer.new(1))
      end

      def code_previous
        code_minus(Integer.new(1))
      end

      def code_remainder(other)
        code_other = other.to_code

        self.class.new(raw.remainder(code_other.raw))
      end

      def code_successor
        code_next
      end

      def code_predecessor
        code_previous
      end
    end
  end
end
