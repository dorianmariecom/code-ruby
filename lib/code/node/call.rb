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

        def evaluate(**args)
          Object::Function.new(@parameters, @body, args.fetch(:context))
        end
      end

      def initialize(parsed)
        return if parsed.blank?

        @name = parsed.delete(:name).presence
        @explicit_arguments = parsed.key?(:arguments)
        @arguments = parsed.delete(:arguments).presence || []
        @arguments = [@arguments] unless @arguments.is_a?(Array)
        @arguments.map! { |argument| CallArgument.new(argument) }

        return unless parsed.key?(:block)

        @block = Call::Block.new(parsed.delete(:block).presence)
      end

      def evaluate(**args)
        arguments = []

        (@arguments || []).each do |argument|
          if argument.expansion?
            append_expanded_argument(arguments, argument, **args)
          elsif argument.keyword?
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

        object = args.fetch(:object)
        dynamic_result = object.code_dynamic_call(
          name,
          operator: name,
          arguments: Object::List.new(arguments),
          explicit_arguments: @explicit_arguments,
          **args
        )
        return dynamic_result if dynamic_result

        object.call(
          operator: name,
          arguments: Object::List.new(arguments),
          explicit_arguments: @explicit_arguments,
          **args
        )
      end

      def resolve(**_args)
        Object::String.new(@name)
      end

      private

      def append_expanded_argument(arguments, argument, **args)
        value =
          if argument.value?
            argument.evaluate(**args)
          else
            default_forwarded_argument(argument.operator, args.fetch(:context))
          end
        return if value.nil?

        case argument.operator
        when "*", "&&"
          value.to_code.code_to_list.raw.each { |item| arguments << item }
        when "**"
          dictionary = value.to_code.code_to_dictionary
          if arguments.last.is_a?(Object::Dictionary)
            arguments.last.code_merge!(dictionary)
          else
            arguments << dictionary
          end
        when "&"
          code_value = value.to_code
          arguments << if code_value.is_a?(Object::Function) ||
              code_value.nothing?
            code_value
          else
            code_value.call(operator: "&", **args)
          end
        when "..."
          expanded_arguments(value, args.fetch(:context)).each do |item|
            arguments << item
          end
        end
      end

      def default_forwarded_argument(operator, context)
        case operator
        when "*"
          context_fetch(context, "arguments") || Object::List.new
        when "**"
          context_fetch(context, "keyword_arguments")
        when "&"
          context_fetch(context, "block")
        when "&&"
          context_fetch(context, "blocks") || Object::List.new
        when "..."
          context_fetch(context, "rest") || Object::List.new
        end
      end

      def context_fetch(context, name)
        context.code_lookup!(name).code_fetch(name)
      rescue Error
        nil
      end

      def expanded_arguments(value, context)
        if value.nothing?
          context.code_lookup!("rest").code_fetch("rest").code_to_list.raw
        else
          value.to_code.code_to_list.raw
        end
      end
    end
  end
end
