# frozen_string_literal: true

class Code
  class Object
    class Number < Object
      INSTANCE_FUNCTIONS = {
        "between?" => {
          name: "between?",
          description: "returns whether the number is between two bounds.",
          examples: ["2.between?(1, 3)", "1.5.between?(1, 2)", "4.between?(1, 3)"]
        },
        "clamp" => {
          name: "clamp",
          description: "returns the number constrained between two bounds.",
          examples: ["5.clamp(1, 3)", "0.clamp(1, 3)", "2.5.clamp(1, 3)"]
        },
        "divide" => {
          name: "divide",
          description: "returns integer division of the number by another number.",
          examples: ["5.divide(2)", "10.divide(3)", "9.5.divide(2)"]
        },
        "divide_modulo" => {
          name: "divide_modulo",
          description: "returns integer division and modulo as a list.",
          examples: ["5.divide_modulo(2)", "10.divide_modulo(3)", "9.5.divide_modulo(2)"]
        },
        "next" => {
          name: "next",
          description: "returns the next number.",
          examples: ["1.next", "1.5.next", "-1.next"]
        },
        "successor" => {
          name: "successor",
          description: "alias for next.",
          examples: ["1.successor", "1.5.successor", "-1.successor"]
        },
        "previous" => {
          name: "previous",
          description: "returns the previous number.",
          examples: ["1.previous", "1.5.previous", "-1.previous"]
        },
        "predecessor" => {
          name: "predecessor",
          description: "alias for previous.",
          examples: ["1.predecessor", "1.5.predecessor", "-1.predecessor"]
        },
        "remainder" => {
          name: "remainder",
          description: "returns the remainder after division by another number.",
          examples: ["5.remainder(2)", "10.remainder(3)", "9.5.remainder(2)"]
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
