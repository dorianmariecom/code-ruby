# frozen_string_literal: true

class Code
  class Node
    class Not < Node
      def initialize(parsed)
        return if parsed.blank?
        @operator = parsed.delete(:operator).presence
        @right = Node::Statement.new(parsed.delete(:right).presence)
      end

      def evaluate(**args)
        if @right
          @right.evaluate(**args).call(operator: @operator, **args)
        else
          Object::Nothing.new
        end
      end
    end
  end
end
