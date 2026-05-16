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
        @parameters = parsed.delete(:parameters) { [] }.presence || []
        @parameters.map! { |parameter| FunctionParameter.new(parameter) }
        @body = Code.new(parsed.delete(:body).presence)
      end

      def evaluate(**args)
        case @operator
        when WHILE_KEYWORD
          evaluate_conditional_loop(condition_truthy: true, **args)
        when UNTIL_KEYWORD
          evaluate_conditional_loop(condition_truthy: false, **args)
        when LOOP_KEYWORD
          evaluate_infinite_loop(**args)
        else
          Object::Nothing.new
        end
      end

      private

      def evaluate_conditional_loop(condition_truthy:, **args)
        last = Object::Nothing.new

        while loop_condition_truthy?(condition_truthy, **args)
          begin
            last = @body&.evaluate(**args) || Object::Nothing.new
          rescue Error::Next, Error::Continue => e
            last = e.code_value
            next
          rescue Error::Retry
            retry
          rescue Error::Break => e
            return e.code_value
          end
        end

        last
      end

      def evaluate_infinite_loop(**args)
        last = Object::Nothing.new
        index = 0

        loop do
          bind_loop_parameters(index, **args)
          last = @body&.evaluate(**args) || Object::Nothing.new
          index += 1
        rescue Error::Next, Error::Continue => e
          last = e.code_value
          index += 1
          next
        rescue Error::Retry
          retry
        rescue Error::Break => e
          return e.code_value
        end

        last
      end

      def loop_condition_truthy?(condition_truthy, **args)
        condition =
          (@statement&.evaluate(**args) || Object::Nothing.new).truthy?

        condition_truthy ? condition : !condition
      end

      def bind_loop_parameters(index, **args)
        return if @parameters.blank?

        @parameters.each.with_index do |parameter, parameter_index|
          value =
            if parameter_index.zero?
              Object::Integer.new(index)
            else
              Object::Nothing.new
            end

          args.fetch(:context).code_set(parameter.name, value)
        end
      end
    end
  end
end
