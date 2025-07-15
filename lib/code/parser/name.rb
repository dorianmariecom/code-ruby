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

      def while_keyword
        str("while")
      end

      def until_keyword
        str("until")
      end

      def if_keyword
        str("if")
      end

      def unless_keyword
        str("unless")
      end

      def elsunless_keyword
        str("elsunless")
      end

      def true_keyword
        str("true")
      end

      def false_keyword
        str("false")
      end

      def nothing_keyword
        str("nothing")
      end

      def exclamation_mark
        str("!")
      end

      def question_mark
        str("?")
      end

      def special_name
        str("...") | str("..") | str(".") | str("**") | str("*") | str("&")
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

      def keyword
        do_keyword | begin_keyword | end_keyword | while_keyword |
          until_keyword | if_keyword | elsif_keyword | else_keyword |
          unless_keyword | elsunless_keyword | true_keyword | false_keyword |
          nothing_keyword
      end

      def root
        (
          (special_name << separator.ignore) |
            (
              (keyword << separator).absent << special_characters.absent <<
                character.repeat(1)
            )
        )
      end
    end
  end
end
