# frozen_string_literal: true

class Code
  class Parser
    class IfModifier < RightOperation
      def statement
        OrKeyword
      end

      def whitespace
        Whitespace.new.without_newline
      end

      def if_keyword
        str("if")
      end

      def unless_keyword
        str("unless")
      end

      def while_keyword
        str("while")
      end

      def until_keyword
        str("until")
      end

      def operator
        if_keyword | unless_keyword | while_keyword | until_keyword
      end
    end
  end
end
