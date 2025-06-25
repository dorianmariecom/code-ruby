# frozen_string_literal: true

class Code
  class Parser
    class Call < Language
      def name
        Name
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

      def code_present
        Code.new.present
      end

      def colon
        str(":")
      end

      def comma
        str(",")
      end

      def pipe
        str("|")
      end

      def equal
        str("=")
      end

      def opening_curly_bracket
        str("{")
      end

      def closing_curly_bracket
        str("}")
      end

      def opening_parenthesis
        str("(")
      end

      def closing_parenthesis
        str(")")
      end

      def do_keyword
        str("do")
      end

      def begin_keyword
        str("do")
      end

      def end_keyword
        str("end")
      end

      def asterisk
        str("*")
      end

      def ampersand
        str("&")
      end

      def spread_operator
        str("...") | str("..") | str(".")
      end

      def keyword_argument
        name.aka(:name) << whitespace? << colon << code.aka(:value)
      end

      def regular_argument
        code_present.aka(:value)
      end

      def argument
        keyword_argument | regular_argument
      end

      def arguments
        opening_parenthesis.ignore << whitespace? <<
          (
            whitespace? << argument <<
              (whitespace? << comma << whitespace?).maybe
          ).repeat << whitespace? << closing_parenthesis.ignore.maybe
      end

      def prefix
        (asterisk << asterisk).aka(:keyword_splat) |
          asterisk.aka(:regular_splat) | ampersand.aka(:block) |
          spread_operator.aka(:spread)
      end

      def keyword_parameter
        name.aka(:name) << whitespace? << colon.aka(:keyword) <<
          code_present.aka(:default).maybe
      end

      def regular_parameter
        ((prefix.maybe << name.aka(:name)) | prefix) << whitespace? <<
          (equal << whitespace? << code_present.aka(:default)).maybe
      end

      def parameter
        keyword_parameter | regular_parameter
      end

      def parameters
        pipe.ignore << whitespace? <<
          (
            whitespace? << parameter <<
              (whitespace? << comma << whitespace?).maybe
          ).repeat << (whitespace? << pipe.ignore).maybe
      end

      def block
        (
          (do_keyword | begin_keyword).ignore << whitespace <<
            parameters.aka(:parameters).maybe << whitespace? <<
            code.aka(:body) << (whitespace? << end_keyword).maybe.ignore
        ) |
          (
            opening_curly_bracket.ignore << whitespace? <<
              parameters.aka(:parameters).maybe << whitespace? <<
              code.aka(:body) <<
              (whitespace? << closing_curly_bracket).maybe.ignore
          )
      end

      def root
        (
          name.aka(:name) << (whitespace? << arguments.aka(:arguments)).maybe <<
            (whitespace? << block.aka(:block)).maybe
        ).aka(:call)
      end
    end
  end
end
