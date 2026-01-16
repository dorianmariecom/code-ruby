# frozen_string_literal: true

class Code
  class Parser
    class Nothing < Language
      def separator
        Name.new.separator
      end

      def nothing_keyword
        str("nothing") << separator.present
      end

      def root
        nothing_keyword.aka(:nothing) | Group
      end
    end
  end
end
