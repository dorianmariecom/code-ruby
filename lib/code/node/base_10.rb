# frozen_string_literal: true

class Code
  class Node
    class Base10 < Node
      def initialize(parsed)
        return if parsed.blank?
        @whole = parsed.delete(:whole).presence

        if parsed.key?(:exponent)
          @exponent = Node::Statement.new(parsed.delete(:exponent).presence)
        end
      end

      def evaluate(**args)
        if @exponent && @whole
          exponent = @exponent.evaluate(**args)
          if exponent.is_a?(Object::Integer)
            Object::Integer.new(@whole, exponent:)
          else
            Object::Decimal.new(@whole, exponent:)
          end
        elsif @whole
          Object::Integer.new(@whole.to_i)
        else
          Object::Nothing.new
        end
      end
    end
  end
end
