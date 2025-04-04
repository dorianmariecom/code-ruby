# frozen_string_literal: true

class Code
  class Parser
    class While < Language
      def statement
        If
      end

      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
      end

      def code
        Code
      end

      def while_keyword
        str("while")
      end

      def until_keyword
        str("until")
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

      def loop_keyword
        str("loop")
      end

      def opening_curly_bracket
        str("{")
      end

      def closing_curly_bracket
        str("}")
      end

      def body
        ((do_keyword | begin_keyword) << code << end_keyword.maybe) |
          (opening_curly_bracket << code << closing_curly_bracket) | code
      end

      def root
        (
          (
            (
              (while_keyword | until_keyword).aka(:operator) << whitespace <<
                statement.aka(:statement)
            ) | (loop_keyword.aka(:operator) << whitespace)
          ) << body.aka(:body)
        ).aka(:while) | statement
      end
    end
  end
end
