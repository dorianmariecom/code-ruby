# frozen_string_literal: true

class Code
  class Parser
    class Addition < LeftOperation
      def statement
        Multiplication
      end

      def plus
        str("+")
      end

      def minus
        str("-")
      end

      def operator
        plus | minus
      end
    end
  end
end
