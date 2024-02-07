# frozen_string_literal: true

class Code
  class Node
    class Decimal < Node
      def initialize(parsed)
        @decimal = parsed.delete(:decimal)

        @exponent = Node::Statement.new(parsed.delete(:exponent)) if parsed.key?(:exponent)

        super(parsed)
      end

      def evaluate(**args)
        if @exponent
          ::Code::Object::Decimal.new(
            @decimal,
            exponent: @exponent.evaluate(**args)
          )
        else
          ::Code::Object::Decimal.new(@decimal)
        end
      end
    end
  end
end
