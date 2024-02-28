# frozen_string_literal: true

class Code
  class Error < StandardError
    class ArityError < Error
    end

    class TypeError < Error
    end

    class TypeError < Error
    end

    class Undefined < Error
    end

    class UndefinedVariable < Error
    end

    class ArgumentError < Error
    end

    class IncompatibleContext < Error
    end

    class KeyNotFound < Error
    end

    class Break < Error
      attr_reader :value

      def initialize(value = nil)
        @value = value || Object::Nothing.new
      end
    end

    class Next < Error
      attr_reader :value

      def initialize(value = nil)
        @value = value || Object::Nothing.new
      end
    end
  end
end
