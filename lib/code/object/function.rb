# frozen_string_literal: true

class Code
  class Object
    class Function < ::Code::Object
      attr_reader :parameters, :body

      def initialize(parameters:, body:)
        @parameters = parameters
        @body = body
      end

      def self.name
        "Function"
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, [])
        globals = multi_fetch(args, *::Code::GLOBALS)

        case operator.to_s
        when "", "call"
          sig(args) { signature_for_call }
          code_call(*arguments, **globals)
        else
          super
        end
      end

      def code_call(*arguments, **globals)
        context = Context.new({}, parent: globals[:context])

        parameters.each.with_index do |parameter, index|
          if parameter.regular?
            if parameter.regular_splat?
              context.code_set(
                parameter.name,
                List.new(arguments.select(&:regular?).map(&:value))
              )
            elsif parameter.keyword_splat?
              context.code_set(
                parameter.name,
                Dictionary.new(
                  arguments.select(&:keyword?).map(&:name_value).to_h
                )
              )
            else
              argument = arguments[index]&.value
              argument = parameter.evaluate(**globals) if argument.nil?
              context.code_set(parameter.name, argument)
            end
          elsif parameter.keyword?
            argument =
              arguments
                .detect { |argument| argument.name == parameter.name }
                &.value
            argument = parameter.evaluate(**globals) if argument.nil?
            context.code_set(parameter.name, argument)
          else
            raise NotImplementedError
          end
        end

        body.evaluate(**globals, context:)
      end

      def inspect
        "function"
      end

      def signature_for_call
        parameters.inject([]) do |signature, parameter|
          if parameter.keyword?
            if signature.last.is_a?(::Hash)
              signature.last[parameter.name] = Object
              signature
            else
              signature + [{ parameter.name => Object }]
            end
          else
            signature + [Object]
          end
        end + [Object.repeat]
      end

      def to_s
        ""
      end
    end
  end
end
