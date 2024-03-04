# frozen_string_literal: true

class Code
  class Object
    class Function < Object
      attr_reader :parameters, :body

      def initialize(*args, **_kargs, &_block)
        parameters = args.first.presence || List.new
        parameters = parameters.raw if parameters.is_an?(Object)
        @parameters = List.new(parameters)
        @parameters.raw.map! { |parameter| Parameter.new(parameter) }
        @body = Code.new(args.second.presence || Nothing.new)
        super
      end

      def self.name
        "Function"
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, [])
        globals = multi_fetch(args, *GLOBALS)

        case operator.to_s
        when "", "call"
          sig(args) { signature_for_call }
          code_call(*arguments, **globals)
        else
          super
        end
      end

      def code_call(*arguments, **globals)
        context = Context.new({}, globals[:context])

        parameters.raw.each.with_index do |parameter, index|
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
          elsif parameter.regular?
            argument = arguments[index]&.value
            argument = parameter.evaluate(**globals) if argument.nil?
            context.code_set(parameter.name, argument)
          elsif parameter.keyword?
            argument =
              arguments
                .detect { |argument| argument.name == parameter.name }
                &.value
            argument = parameter.evaluate(**globals) if argument.nil?
            context.code_set(parameter.name, argument)
          end
        end

        body.evaluate(**globals, context:)
      end

      def inspect
        "function"
      end

      def signature_for_call
        parameters.raw.inject([]) do |signature, parameter|
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

      def as_json(...)
        raw.as_json(...)
      end
    end
  end
end
