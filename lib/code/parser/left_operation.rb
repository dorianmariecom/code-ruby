# frozen_string_literal: true

class Code
  class Parser
    class LeftOperation < Language
      def statement
        Statement
      end

      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
      end

      def operator
        str("")
      end

      def right_statement
        Statement
      end

      def root
        (
          statement.aka(:first) << (
            whitespace? << operator.aka(:operator) << whitespace? <<
              right_statement.aka(:statement)
          ).repeat(1).aka(:others).maybe
        )
          .aka(:left_operation)
          .then do |output|
            if output[:left_operation][:others]
              output
            else
              output[:left_operation][:first]
            end
          end
      end
    end
  end
end
