# frozen_string_literal: true

class Code
  class Parser
    class Equality < LeftOperation
      def statement
        Greater
      end

      def equal
        str("=")
      end

      def greater
        str(">")
      end

      def lesser
        str("<")
      end

      def exclamation_mark
        str("!")
      end

      def tilde
        str("~")
      end

      def right_statement
        Greater
      end

      def operator
        (exclamation_mark << equal << equal) | (equal << equal << equal) |
          (equal << equal) | (lesser << equal << greater) |
          (exclamation_mark << equal) | (equal << tilde) | (tilde << equal) |
          (exclamation_mark << tilde)
      end
    end
  end
end
