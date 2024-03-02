# frozen_string_literal: true

class Code
  class Node
    def evaluate(**_args)
      Object::Nothing.new
    end

    def resolve(...)
      evaluate(...)
    end
  end
end
