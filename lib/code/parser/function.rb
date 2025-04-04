# frozen_string_literal: true

class Code
  class Parser
    class Function < Language
      def name
        Name
      end

      def code
        Code
      end

      def code_present
        Code.new.present
      end

      def whitespace
        Whitespace
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

      def end_keyword
        str("end")
      end

      def opening_parenthesis
        str("(")
      end

      def closing_parenthesis
        str(")")
      end

      def colon
        str(":")
      end

      def comma
        str(",")
      end

      def equal
        str("=")
      end

      def greater
        str(">")
      end

      def opening_curly_bracket
        str("{")
      end

      def closing_curly_bracket
        str("}")
      end

      def asterisk
        str("*")
      end

      def ampersand
        str("&")
      end

      def prefix
        (asterisk << asterisk).aka(:keyword_splat) |
          asterisk.aka(:regular_splat) | ampersand.aka(:block)
      end

      def keyword_parameter
        name.aka(:name) << whitespace? << colon.aka(:keyword) <<
          code_present.aka(:default).maybe
      end

      def regular_parameter
        prefix.maybe << name.aka(:name) << whitespace? <<
          (equal << whitespace? << code_present.aka(:default)).maybe
      end

      def parameter
        keyword_parameter | regular_parameter
      end

      def parameters
        opening_parenthesis.ignore << whitespace? <<
          (whitespace? << parameter << (whitespace? << comma).maybe).repeat <<
          (whitespace? << closing_parenthesis.ignore).maybe
      end

      def body
        ((begin_keyword | do_keyword) << code << end_keyword.maybe) |
          (opening_curly_bracket << code << closing_curly_bracket.maybe) | code
      end

      def root
        (
          parameters.aka(:parameters) << whitespace? << equal << greater <<
            whitespace? << body.aka(:body)
        ).aka(:function) | Dictionary
      end
    end
  end
end
