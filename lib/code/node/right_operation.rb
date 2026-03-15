# frozen_string_literal: true

class Code
  class Node
    class RightOperation < Node
      EQUAL = "="

      def initialize(parsed)
        return if parsed.blank?

        @left = Statement.new(parsed.delete(:left).presence)
        @operator = parsed.delete(:operator).presence
        @right = Statement.new(parsed.delete(:right).presence)
      end

      def evaluate(**args)
        case @operator
        when "if"
          if (@right&.evaluate(**args) || Object::Nothing.new).truthy?
            @left&.evaluate(**args) || Object::Nothing.new
          else
            Object::Nothing.new
          end
        when "unless"
          if (@right&.evaluate(**args) || Object::Nothing.new).truthy?
            Object::Nothing.new
          else
            @left.evaluate(**args)
          end
        when "while"
          evaluate_conditional_loop(condition_truthy: true, **args)
        when "until"
          evaluate_conditional_loop(condition_truthy: false, **args)
        when "rescue"
          begin
            @left&.evaluate(**args) || Object::Nothing.new
          rescue Error
            @right&.evaluate(**args) || Object::Nothing.new
          end
        when /=$/
          right = @right&.evaluate(**args) || Object::Nothing.new
          left = @left&.resolve(**args) || Object::Nothing.new

          if @operator != EQUAL && right.nothing?
            return @left&.evaluate(**args) || Object::Nothing.new
          end

          left.call(
            operator: @operator,
            arguments: Object::List.new([right]),
            **args
          )
        else
          right = @right&.evaluate(**args) || Object::Nothing.new
          left = @left&.evaluate(**args) || Object::Nothing.new

          left.call(
            operator: @operator,
            arguments: Object::List.new([right]),
            **args
          )
        end
      end

      private

      def evaluate_conditional_loop(condition_truthy:, **args)
        left = Object::Nothing.new

        while loop_condition_truthy?(condition_truthy, **args)
          begin
            left = @left&.evaluate(**args) || Object::Nothing.new
          rescue Error::Next, Error::Continue => e
            left = e.code_value
            next
          rescue Error::Retry
            retry
          rescue Error::Break => e
            return e.code_value
          end
        end

        left
      end

      def loop_condition_truthy?(condition_truthy, **args)
        condition = (@right&.evaluate(**args) || Object::Nothing.new).truthy?
        condition_truthy ? condition : !condition
      end
    end
  end
end
