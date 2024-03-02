# frozen_string_literal: true

class Code
  class Node
    class Decimal < Node
      def initialize(parsed)
        return if parsed.blank?
        @decimal = parsed.delete(:decimal).presence

        if parsed.key?(:exponent)
          @exponent = Statement.new(parsed.delete(:exponent).presence)
        end
      end

      def evaluate(**args)
        if @exponent && @decimal
          Object::Decimal.new(
            @decimal,
            exponent: @exponent.evaluate(**args)
          )
        elsif @decimal
          Object::Decimal.new(@decimal)
        else
          Object::Nothing.new
        end
      end
    end
  end
end
