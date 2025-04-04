# frozen_string_literal: true

class Code
  class Parser
    class Class < Language
      def statement
        While
      end

      def root
        statement
      end
    end
  end
end
