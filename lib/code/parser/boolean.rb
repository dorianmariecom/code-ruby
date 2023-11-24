# frozen_string_literal: true

class Code
  class Parser
    class Boolean < Language
      def true_keyword
        str("true")
      end

      def false_keyword
        str("false")
      end

      def root
        (true_keyword | false_keyword).aka(:boolean) | Nothing
      end
    end
  end
end
