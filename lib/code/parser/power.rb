# frozen_string_literal: true

class Code
  class Parser
    class Power < RightOperation
      def statement
        Function
      end

      def asterisk
        str("*")
      end

      def operator
        asterisk << asterisk
      end
    end
  end
end
