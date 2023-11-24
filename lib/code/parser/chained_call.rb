# frozen_string_literal: true

class Code
  class Parser
    class ChainedCall < LeftOperation
      def statement
        SquareBracket
      end

      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
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

      def operator
        dot | (colon << colon) | (ampersand << dot)
      end
    end
  end
end
