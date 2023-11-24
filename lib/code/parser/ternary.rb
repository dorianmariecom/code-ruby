# frozen_string_literal: true

class Code
  class Parser
    class Ternary < Language
      def statement
        Range
      end

      def ternary
        Ternary
      end

      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
      end

      def question_mark
        str("?")
      end

      def colon
        str(":")
      end

      def root
        (
          statement.aka(:left) << (
            whitespace? << question_mark << whitespace? <<
              ternary.aka(:middle) <<
              (whitespace? << colon << whitespace? << ternary.aka(:right)).maybe
          ).maybe
        )
          .aka(:ternary)
          .then do |output|
            output[:ternary][:middle] ? output : output[:ternary][:left]
          end
      end
    end
  end
end
