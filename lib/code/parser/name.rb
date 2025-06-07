# frozen_string_literal: true

class Code
  class Parser
    class Name < Language
      def space
        str(" ")
      end

      def newline
        str("\n")
      end

      def comma
        str(",")
      end

      def equal
        str("=")
      end

      def colon
        str(":")
      end

      def opening_curly_bracket
        str("{")
      end

      def closing_curly_bracket
        str("}")
      end

      def opening_square_bracket
        str("[")
      end

      def closing_square_bracket
        str("]")
      end

      def opening_parenthesis
        str("(")
      end

      def closing_parenthesis
        str(")")
      end

      def single_quote
        str("'")
      end

      def double_quote
        str('"')
      end

      def dot
        str(".")
      end

      def pipe
        str("|")
      end

      def ampersand
        str("&")
      end

      def lesser
        str("<")
      end

      def greater
        str(">")
      end

      def asterisk
        str("*")
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

      def elsif_keyword
        str("elsif")
      end

      def else_keyword
        str("else")
      end

      def exclamation_mark
        str("!")
      end

      def question_mark
        str("?")
      end

      def reserved_character
        ampersand | equal | pipe | dot | colon | comma | space | newline |
          opening_curly_bracket | closing_curly_bracket | opening_parenthesis |
          closing_parenthesis | opening_square_bracket |
          closing_square_bracket | single_quote | double_quote | lesser |
          greater | asterisk
      end

      def character
        reserved_character.absent << any
      end

      def separator
        reserved_character | any.absent
      end

      def special_characters
        exclamation_mark | question_mark
      end

      def root
        (do_keyword << separator).absent << (
          begin_keyword << separator
        ).absent << (else_keyword << separator).absent <<
          (elsif_keyword << separator).absent <<
          (end_keyword << separator).absent <<
          special_characters.absent << character.repeat(1)
      end
    end
  end
end
