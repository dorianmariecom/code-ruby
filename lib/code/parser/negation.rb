# frozen_string_literal: true

class Code
  class Parser
    class Negation < Language
      def exclamation_mark
        str("!")
      end

      def tilde
        str("~")
      end

      def plus
        str("+")
      end

      def operator
        exclamation_mark | tilde | plus
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
