# frozen_string_literal: true

class Code
  class Node
    class Ternary < Node
      def initialize(parsed)
        @left = Node::Statement.new(parsed.delete(:left))
        @middle = Node::Statement.new(parsed.delete(:middle))
        @right = Node::Statement.new(parsed.delete(:right)) if parsed.key?(
          :right
        )
        super(parsed)
      end

      def evaluate(**args)
        if @left.evaluate(**args).truthy?
          @middle.evaluate(**args)
        elsif @right
          @right.evaluate(**args)
        else
          ::Code::Object::Nothing.new
        end
      end
    end
  end
end
