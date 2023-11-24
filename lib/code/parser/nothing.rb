# frozen_string_literal: true

class Code
  class Parser
    class Nothing < Language
      def nothing_keyword
        str("nothing")
      end

      def root
        nothing_keyword.aka(:nothing) | Group
      end
    end
  end
end
