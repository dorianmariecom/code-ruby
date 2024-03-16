# frozen_string_literal: true

class Code
  class Node
    class Ternary < Node
      def initialize(parsed)
        return if parsed.blank?

        @left = Node::Statement.new(parsed.delete(:left).presence)
        @middle = Node::Statement.new(parsed.delete(:middle).presence)
        return unless parsed.key?(:right)

        @right = Node::Statement.new(parsed.delete(:right).presence)
      end

      def evaluate(**args)
        if (@left&.evaluate(**args) || Object::Nothing.new).truthy?
          @middle&.evaluate(**args) || Object::Nothing.new
        elsif @right
          @right.evaluate(**args)
        else
          ::Code::Object::Nothing.new
        end
      end
    end
  end
end
