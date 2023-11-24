# frozen_string_literal: true

class Code
  class Node
    def initialize(parsed)
      return unless parsed.any?

      raise NotImplementedError, "#{self.class.name}: #{parsed.inspect}"
    end

    def evaluate(**_args)
      raise NotImplementedError, "#{self.class.name}#evaluate"
    end

    def resolve(...)
      evaluate(...)
    end
  end
end
