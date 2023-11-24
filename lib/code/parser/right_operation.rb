# frozen_string_literal: true

class Code
  class Parser
    class RightOperation < Language
      def statement
        raise NotImplementedError
      end

      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
      end

      def operator
        raise NotImplementedError
      end

      def root
        (
          statement.aka(:left) << (
            whitespace? << operator.aka(:operator) << whitespace? <<
              self.class.aka(:right)
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
