# frozen_string_literal: true

class Code
  class Node
    class While < Node
      WHILE_KEYWORD = "while"
      UNTIL_KEYWORD = "until"
      LOOP_KEYWORD = "loop"

      def initialize(parsed)
        return if parsed.blank?

        @operator = parsed.delete(:operator).presence
        @statement = Statement.new(parsed.delete(:statement)) if parsed.key?(
          :statement
        )
        @body = Code.new(parsed.delete(:body).presence)
      end

      def evaluate(**args)
        case @operator
        when WHILE_KEYWORD
          last = Object::Nothing.new

          last = @body&.evaluate(**args) || Object::Nothing.new while (
            @statement&.evaluate(**args) || Object::Nothing.new
          ).truthy?

          last
        when UNTIL_KEYWORD
          last = Object::Nothing.new

          last = @body&.evaluate(**args) || Object::Nothing.new while (
            @statement&.evaluate(**args) || Object::Nothing.new
          ).falsy?

          last
        when LOOP_KEYWORD
          loop { @body&.evaluate(**args) || Object::Nothing.new }
          Object::Nothing.new
        else
          Object::Nothing.new
        end
      rescue Error::Break => e
        e.code_value
      end
    end
  end
end
