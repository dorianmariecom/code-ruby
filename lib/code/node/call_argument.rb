# frozen_string_literal: true

class Code
  class Node
    class CallArgument < Node
      def initialize(parsed)
        @value = Node::Code.new(parsed.delete(:value))
        @name = parsed.delete(:name)
      end

      def evaluate(**args)
        if @name
          Object::Argument.new(@value.evaluate(**args), name:)
        else
          Object::Argument.new(@value.evaluate(**args))
        end
      end

      def keyword?
        !!@name
      end

      def regular?
        !keyword?
      end

      def name
        Object::String.new(@name)
      end
    end
  end
end
