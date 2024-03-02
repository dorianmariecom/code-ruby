# frozen_string_literal: true

class Code
  class Node
    class While < Node
      WHILE_KEYWORD = "while"
      UNTIL_KEYWORD = "until"
      LOOP_KEYWORD = "loop"

      def initialize(parsed)
        @operator = parsed.delete(:operator)
        @statement = Statement.new(parsed.delete(:statement)) if parsed[
          :statement
        ]
        @body = Code.new(parsed.delete(:body))
        super(parsed)
      end

      def evaluate(**args)
        case @operator
        when WHILE_KEYWORD
          last = Object::Nothing.new

          last = @body.evaluate(**args) while @statement.evaluate(
            **args
          ).truthy?

          last
        when UNTIL_KEYWORD
          last = Object::Nothing.new

          last = @body.evaluate(**args) while @statement.evaluate(**args).falsy?

          last
        when LOOP_KEYWORD
          loop { @body.evaluate(**args) }
          raise NotImplementedError
        else
          raise NotImplementedError, @operator
        end
      rescue Error::Break => e
        e.value || Object::Nothing.new
      end
    end
  end
end
