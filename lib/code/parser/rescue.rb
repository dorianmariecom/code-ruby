# frozen_string_literal: true

class Code
  class Parser
    class Rescue < RightOperation
      def statement
        Ternary
      end

      def rescue_keyword
        str("rescue")
      end

      def operator
        rescue_keyword
      end
    end
  end
end
