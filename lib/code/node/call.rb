# frozen_string_literal: true

class Code
  class Node
    class Call < Node
      class Block < Node
        def initialize(parsed)
          return if parsed.blank?
          @parameters = parsed.delete(:parameters) { [] }.presence || []
          @parameters.map! { |parameter| FunctionParameter.new(parameter) }

          @body = Code.new(parsed.delete(:body).presence)
        end

        def evaluate(**_args)
          Object::Argument.new(
            Object::Function.new(parameters: @parameters, body: @body)
          )
        end
      end

      def initialize(parsed)
        return if parsed.blank?
        @name = parsed.delete(:name).presence
        @arguments = parsed.delete(:arguments).presence || []
        @arguments.map! { |argument| CallArgument.new(argument) }

        @block = Call::Block.new(parsed.delete(:block).presence) if parsed.key?(:block)
      end

      def evaluate(**args)
        arguments = []

        (@arguments || []).each do |argument|
          if argument.keyword?
            if arguments.last&.value.is_a?(Object::Dictionary)
              arguments.last.value.code_set(
                argument.name,
                argument.evaluate(**args).value
              )
            else
              arguments << Object::Argument.new(
                Object::Dictionary.new(
                  { argument.name => argument.evaluate(**args).value }
                )
              )
            end
          else
            arguments << argument.evaluate(**args)
          end
        end

        arguments << @block.evaluate(**args) if @block

        name = Object::String.new(@name)

        args.fetch(:object).call(operator: name, arguments:, **args)
      end

      def resolve(**_args)
        Object::String.new(@name)
      end
    end
  end
end
