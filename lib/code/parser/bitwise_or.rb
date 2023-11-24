# frozen_string_literal: true

class Code
  class Parser
    class BitwiseOr < LeftOperation
      def statement
        BitwiseAnd
      end

      def pipe
        str("|")
      end

      def caret
        str("^")
      end

      def operator
        pipe | caret
      end
    end
  end
end
