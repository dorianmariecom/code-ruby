# frozen_string_literal: true

class Code
  class Parser
    class SquareBracket < Language
      def statement
        UnaryMinus
      end

      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
      end

      def left_square_bracket
        str("[")
      end

      def right_square_bracket
        str("]")
      end

      def root
        (
          statement.aka(:left) << (
            left_square_bracket << whitespace? << Statement <<
            (whitespace? << right_square_bracket).maybe
          ).repeat(1).aka(:statements).maybe
        )
          .aka(:square_bracket)
          .then do |output|
            if output[:square_bracket][:statements]
              output
            else
              output[:square_bracket][:left]
            end
          end
      end
    end
  end
end
