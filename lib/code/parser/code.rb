# frozen_string_literal: true

class Code
  class Parser
    class Code < Language
      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
      end

      def statement
        Statement
      end

      def present
        (whitespace? << statement << whitespace?).repeat(1)
      end

      def root
        present | whitespace?.then { [] }
      end
    end
  end
end
