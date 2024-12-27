# frozen_string_literal: true

class Code
  class Error < StandardError
    class Break < Error
      attr_reader :code_value

      def initialize(value = nil)
        @code_value = value.to_code
      end
    end

    class Next < Error
      attr_reader :code_value

      def initialize(value = nil)
        @code_value = value.to_code
      end
    end
  end
end
