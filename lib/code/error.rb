# frozen_string_literal: true

class Code
  class Error < StandardError
    class ControlFlow < Error
      attr_reader :code_value

      def initialize(value = nil)
        @code_value = value.to_code
      end
    end

    class Break < ControlFlow; end

    class Next < ControlFlow; end

    class Continue < Next; end

    class Return < ControlFlow; end

    class Retry < ControlFlow; end
  end
end
