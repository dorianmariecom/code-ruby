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

      def separator
        Name.new.separator
      end

      def while_keyword
        str("while") << separator.present
      end

      def until_keyword
        str("until") << separator.present
      end

      def end_keyword
        str("end") << separator.present
      end

      def do_keyword
        str("do") << separator.present
      end

      def begin_keyword
        str("begin") << separator.present
      end

      def loop_keyword
        str("loop") << separator.present
      end

      def opening_curly_bracket
        str("{")
      end

      def closing_curly_bracket
        str("}")
      end

      def body
        (
          (begin_keyword | do_keyword).ignore << whitespace << code <<
            (whitespace? << end_keyword).maybe.ignore
        ) |
          (
            opening_curly_bracket.ignore << whitespace? << code <<
              (whitespace? << closing_curly_bracket).maybe.ignore
          ) | (code << (whitespace? << end_keyword).maybe.ignore)
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
