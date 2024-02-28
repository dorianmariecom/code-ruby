# frozen_string_literal: true

class Code
  class Parser
    class Multiplication < LeftOperation
      def statement
        Negation
      end

      def asterisk
        str("*")
      end

      def multiplication_sign
        str("×")
      end

      def slash
        str("/")
      end

      def percent
        str("%")
      end

      def division_sign
        str("÷")
      end

      def right_statement
        Negation
      end

      def operator
        asterisk | slash | percent | multiplication_sign | division_sign
      end
    end
  end
end
