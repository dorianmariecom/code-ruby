# frozen_string_literal: true

class Code
  class Parser
    class Group < Language
      def code
        Code
      end

      def opening_parenthesis
        str("(")
      end

      def closing_parenthesis
        str(")")
      end

      def root
        (opening_parenthesis << code << closing_parenthesis.maybe).aka(:group) |
          Call
      end
    end
  end
end
