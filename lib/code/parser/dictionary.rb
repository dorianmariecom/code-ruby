# frozen_string_literal: true

class Code
  class Parser
    class Dictionary < Language
      def code_present
        Code.new.present
      end

      def statement
        Statement
      end

      def name
        Name
      end

      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
      end

      def opening_curly_bracket
        str("{")
      end

      def closing_curly_bracket
        str("}")
      end

      def comma
        str(",")
      end

      def colon
        str(":")
      end

      def equal
        str("=")
      end

      def greater
        str(">")
      end

      def key_value
        (name.aka(:name) << colon << code_present.aka(:code).maybe).aka(:name_code) |
          (
            statement.aka(:statement) << colon << code_present.aka(:code).maybe
          ).aka(:statement_code) |
          (
            statement.aka(:statement) << whitespace? << equal << greater <<
              code_present.aka(:code).maybe
          ).aka(:statement_code) | code_present.aka(:code)
      end

      def root
        (
          opening_curly_bracket.ignore << whitespace? <<
            (whitespace? << key_value << (whitespace? << comma).maybe).repeat <<
            (whitespace? << closing_curly_bracket.ignore).maybe
        ).aka(:dictionnary) | List
      end
    end
  end
end
