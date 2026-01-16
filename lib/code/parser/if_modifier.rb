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

      def separator
        Name.new.separator
      end

      def if_keyword
        str("if") << separator.present
      end

      def unless_keyword
        str("unless") << separator.present
      end

      def while_keyword
        str("while") << separator.present
      end

      def until_keyword
        str("until") << separator.present
      end

      def operator
        if_keyword | unless_keyword | while_keyword | until_keyword
      end
    end
  end
end
