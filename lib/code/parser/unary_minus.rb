# frozen_string_literal: true

class Code
  class Parser
    class UnaryMinus < Language
      def unary_minus
        UnaryMinus
      end

      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
      end

      def minus
        str("-")
      end

      def operator
        minus
      end

      def root
        (operator.aka(:operator) << whitespace? << unary_minus.aka(:right)).aka(
          :unary_minus
        ) | Power
      end
    end
  end
end
