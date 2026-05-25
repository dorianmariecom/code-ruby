# frozen_string_literal: true

class Code
  class Node
    class CallArgument < Node
      def initialize(parsed)
        return if parsed.blank?

        @has_value = parsed[:value].present?
        @value = Node::Code.new(parsed.delete(:value).presence)
        @name = parsed.delete(:name).presence
        @operator = parsed.delete(:operator).presence
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

      def operator
        @operator.to_s
      end

      def expansion?
        operator.present?
      end

      def keyword?
        !!@name
      end

      def value?
        !!@has_value
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
