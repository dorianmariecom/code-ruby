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

      def slash
        str("/")
      end

      def percent
        str("%")
      end

      def operator
        asterisk | slash | percent
      end
    end
  end
end
