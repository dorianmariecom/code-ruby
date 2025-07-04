# frozen_string_literal: true

class Code
  class Parser
    class If < Language
      def statement
        IfModifier
      end

      def if_class
        If
      end

      def whitespace
        Whitespace
      end

      def code
        Code
      end

      def whitespace?
        whitespace.maybe
      end

      def do_keyword
        str("do")
      end

      def begin_keyword
        str("begin")
      end

      def opening_curly_bracket
        str("{")
      end

      def closing_curly_bracket
        str("{")
      end

      def if_keyword
        str("if")
      end

      def unless_keyword
        str("unless")
      end

      def elsif_keyword
        str("elsif")
      end

      def elsunless_keyword
        str("elsunless")
      end

      def else_keyword
        str("else")
      end

      def end_keyword
        str("end")
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
          (if_keyword | unless_keyword).aka(:first_operator) << whitespace <<
            statement.aka(:first_statement) << body.aka(:first_body) <<
            (
              (
                (elsif_keyword | elsunless_keyword).aka(
                  :operator
                ) << whitespace << statement.aka(:statement) << body.aka(:body)
              ) |
                (
                  else_keyword << whitespace <<
                    (if_keyword | unless_keyword).aka(:operator) <<
                    whitespace << statement.aka(:statement) << body.aka(:body)
                ) | (else_keyword.aka(:operator) << body.aka(:body))
            ).repeat(1).aka(:elses).maybe << end_keyword.maybe
        ).aka(:if) | statement
      end
    end
  end
end
