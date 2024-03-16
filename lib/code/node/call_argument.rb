# frozen_string_literal: true

class Code
  class Node
    class CallArgument < Node
      def initialize(parsed)
        return if parsed.blank?

        @value = Node::Code.new(parsed.delete(:value).presence)
        @name = parsed.delete(:name).presence
      end

      def evaluate(**args)
        if @name
          Object::Dictionary.new(
            name => @value&.evaluate(**args) || Object::Nothing.new
          )
        else
          @value&.evaluate(**args) || Object::Nothing.new
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
