# frozen_string_literal: true

class Code
  class Parser
    class AndOperator < LeftOperation
      def statement
        Equality
      end

      def ampersand
        str("&")
      end

      def operator
        ampersand << ampersand
      end
    end
  end
end
