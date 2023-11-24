# frozen_string_literal: true

class Code
  class Parser
    class OrOperator < LeftOperation
      def statement
        AndOperator
      end

      def pipe
        str("|")
      end

      def operator
        pipe << pipe
      end
    end
  end
end
