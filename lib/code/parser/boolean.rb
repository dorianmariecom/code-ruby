# frozen_string_literal: true

class Code
  class Parser
    class Boolean < Language
      def separator
        Name.new.separator
      end

      def true_keyword
        str("true") << separator.present
      end

      def false_keyword
        str("false") << separator.present
      end

      def root
        (true_keyword | false_keyword).aka(:boolean) | Nothing
      end
    end
  end
end
