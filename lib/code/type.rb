# frozen_string_literal: true

class Code
  class Type
    def name
      raise NotImplementedError, "#{self.class}#name"
    end

    def valid?(argument)
      raise NotImplementedError, "#{self.class}#valid?"
    end

    def valid_for?(expected:, actual:)
      expected.is_a?(Type) ? expected.valid?(actual) : actual.is_a?(expected)
    end

    def min_arguments_of(clazz)
      clazz.is_a?(Type) ? clazz.min_arguments : 1
    end

    def max_arguments_of(clazz)
      clazz.is_a?(Type) ? clazz.max_arguments : 1
    end
  end
end
