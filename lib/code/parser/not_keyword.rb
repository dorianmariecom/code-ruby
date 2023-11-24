# frozen_string_literal: true

class Code
  class Parser
    class NotKeyword < Language
      def not_class
        NotKeyword
      end

      def whitespace
        Whitespace
      end

      def not_keyword
        str("not")
      end

      def root
        (not_keyword.aka(:operator) << whitespace << not_class.aka(:right)).aka(
          :not
        ) | Equal
      end
    end
  end
end
