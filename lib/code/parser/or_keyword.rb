# frozen_string_literal: true

class Code
  class Parser
    class OrKeyword < LeftOperation
      def statement
        NotKeyword
      end

      def separator
        Name.new.separator
      end

      def or_keyword
        str("or") << separator.present
      end

      def and_keyword
        str("and") << separator.present
      end

      def operator
        or_keyword | and_keyword
      end
    end
  end
end
