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
          left = Object::Nothing.new

          while (@right&.evaluate(**args) || Object::Nothing.new).truthy?
            left = @left&.evaluate(**args) || Object::Nothing.new
          end

          left
        when "until"
          left = Object::Nothing.new

          while (@right&.evaluate(**args) || Object::Nothing.new).falsy?
            left = @left&.evaluate(**args) || Object::Nothing.new
          end

          left
        when "rescue"
          begin
            @left&.evaluate(**args) || Object::Nothing.new
          rescue Error
            @right&.evaluate(**args) || Object::Nothing.new
          end
        when /=$/
          right = @right&.evaluate(**args) || Object::Nothing.new
          left = @left&.resolve(**args) || Object::Nothing.new

          left.call(
            operator: @operator,
            arguments: List.new(right),
            **args
          )
        else
          right = @right&.evaluate(**args) || Object::Nothing.new
          left = @left&.evaluate(**args) || Object::Nothing.new

          left.call(
            operator: @operator,
            arguments: List.new(right),
            **args
          )
        end
      end
    end
  end
end
