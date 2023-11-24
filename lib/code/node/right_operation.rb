# frozen_string_literal: true

class Code
  class Node
    class RightOperation < Node
      EQUAL = "="

      def initialize(parsed)
        @left = Statement.new(parsed.delete(:left))
        @operator = parsed.delete(:operator)
        @right = Statement.new(parsed.delete(:right))

        super(parsed)
      end

      def evaluate(**args)
        case @operator
        when "if"
          if @right.evaluate(**args).truthy?
            @left.evaluate(**args)
          else
            Object::Nothing.new
          end
        when "unless"
          if @right.evaluate(**args).truthy?
            Object::Nothing.new
          else
            @left.evaluate(**args)
          end
        when "while"
          left = Object::Nothing.new

          left = @left.evaluate(**args) while @right.evaluate(**args).truthy?

          left
        when "until"
          left = Object::Nothing.new

          left = @left.evaluate(**args) while @right.evaluate(**args).falsy?

          left
        when "rescue"
          begin
            @left.evaluate(**args)
          rescue Error
            @right.evaluate(**args)
          end
        when /=$/
          right = @right.evaluate(**args)
          left = @left.resolve(**args)

          left.call(
            operator: @operator,
            arguments: [Object::Argument.new(right)],
            **args
          )
        else
          right = @right.evaluate(**args)
          left = @left.evaluate(**args)

          left.call(
            operator: @operator,
            arguments: [Object::Argument.new(right)],
            **args
          )
        end
      end
    end
  end
end
