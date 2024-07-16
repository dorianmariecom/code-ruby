# frozen_string_literal: true

class Code
  class Parser
    class Greater < LeftOperation
      def statement
        BitwiseOr
      end

      def right_statement
        Greater
      end

      def greater
        str(">")
      end

      def lesser
        str("<")
      end

      def equal
        str("=")
      end

      def operator
        (greater << equal) | (lesser << equal << greater.absent) |
          (greater << equal.absent) | lesser
      end
    end
  end
end
