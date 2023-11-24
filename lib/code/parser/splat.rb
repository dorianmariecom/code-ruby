# frozen_string_literal: true

class Code
  class Parser
    class Splat < Language
      def statement
        Class
      end

      def splat
        Splat
      end

      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
      end

      def ampersand
        str("&")
      end

      def root
        (ampersand.aka(:operator) << whitespace? << splat.aka(:right)).aka(
          :splat
        ) | statement
      end
    end
  end
end
