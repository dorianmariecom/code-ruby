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
  end
end
