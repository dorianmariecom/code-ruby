# frozen_string_literal: true

class Code
  class Parser
    class Group < Language
      def code
        Code
      end

      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
      end

      def opening_parenthesis
        str("(")
      end

      def closing_parenthesis
        str(")")
      end

      def end_keyword
        str("end")
      end

      def do_keyword
        str("do")
      end

      def begin_keyword
        str("begin")
      end

      def root
        (
          opening_parenthesis << whitespace? << code <<
            (whitespace? << closing_parenthesis).maybe
        ).aka(:group) |
          (
            begin_keyword << whitespace << code <<
              (whitespace? << end_keyword).maybe
          ).aka(:group) |
          (
            do_keyword << whitespace << code <<
              (whitespace? << end_keyword).maybe
          ).aka(:group) | Call
      end
    end
  end
end
