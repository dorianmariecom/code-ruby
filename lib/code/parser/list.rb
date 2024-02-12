# frozen_string_literal: true

class Code
  class Parser
    class List < Language
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

      def opening_square_bracket
        str("[")
      end

      def closing_square_bracket
        str("]")
      end

      def comma
        str(",")
      end

      def element
        (whitespace? << code_present << (whitespace? << comma).maybe) |
          (whitespace? << code << whitespace? << comma)
      end

      def root
        (
          opening_square_bracket.ignore << whitespace? << element.repeat <<
            (whitespace? << closing_square_bracket.ignore).maybe
        ).aka(:list) | String
      end
    end
  end
end
