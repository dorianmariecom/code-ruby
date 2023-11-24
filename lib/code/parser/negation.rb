# frozen_string_literal: true

class Code
  class Parser
    class Negation < Language
      def exclamation_point
        str("!")
      end

      def tilde
        str("~")
      end

      def plus
        str("+")
      end

      def operator
        exclamation_point | tilde | plus
      end

      def negation
        Negation
      end

      def root
        (operator.aka(:operator) << negation.aka(:right)).aka(:negation) |
          ChainedCall
      end
    end
  end
end
