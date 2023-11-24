# frozen_string_literal: true

class Code
  class Parser
    class OrKeyword < LeftOperation
      def statement
        NotKeyword
      end

      def or_keyword
        str("or")
      end

      def and_keyword
        str("and")
      end

      def operator
        or_keyword | and_keyword
      end
    end
  end
end
