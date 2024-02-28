# frozen_string_literal: true

class Code
  class Node
    def initialize(parsed)
      return if parsed.nil? || parsed.empty?

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
