# frozen_string_literal: true

class Code
  class Parser
    class BitwiseAnd < LeftOperation
      def statement
        Shift
      end

      def whitespace?
        whitespace
      end

      def ampersand
        str("&")
      end

      def operator
        ampersand
      end
    end
  end
end
