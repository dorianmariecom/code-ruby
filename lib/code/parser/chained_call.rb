# frozen_string_literal: true

class Code
  class Parser
    class ChainedCall < LeftOperation
      def statement
        SquareBracket
      end

      def dot
        str(".")
      end

      def ampersand
        str("&")
      end

      def colon
        str(":")
      end

      def right_statement
        Rescue
      end

      def operator
        dot | (colon << colon) | (ampersand << dot)
      end
    end
  end
end
