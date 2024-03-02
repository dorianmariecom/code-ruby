# frozen_string_literal: true

class Code
  class Parser
    class RightOperation < Language
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
          statement.aka(:left) << (
            whitespace? << operator.aka(:operator) << whitespace? <<
              right_statement.aka(:right)
          ).maybe
        )
          .aka(:right_operation)
          .then do |output|
            if output[:right_operation][:right]
              output
            else
              output[:right_operation][:left]
            end
          end
      end
    end
  end
end
