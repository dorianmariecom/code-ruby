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
          Object::Function.new(@parameters, @body)
        end
      end

      def initialize(parsed)
        return if parsed.blank?

        @name = parsed.delete(:name).presence
        @arguments = parsed.delete(:arguments).presence || []
        @arguments.map! { |argument| CallArgument.new(argument) }

        return unless parsed.key?(:block)

        @block = Call::Block.new(parsed.delete(:block).presence)
      end

      def evaluate(**args)
        arguments = []

        (@arguments || []).each do |argument|
          if argument.keyword?
            if arguments.last.is_a?(Object::Dictionary)
              arguments.last.code_merge!(argument.evaluate(**args))
            else
              arguments << argument.evaluate(**args)
            end
          else
            arguments << argument.evaluate(**args)
          end
        end

        arguments << @block.evaluate(**args) if @block

        name = Object::String.new(@name)

        args.fetch(:object).call(
          operator: name,
          arguments: Object::List.new(arguments),
          **args
        )
      end

      def resolve(**_args)
        Object::String.new(@name)
      end
    end
  end
end
