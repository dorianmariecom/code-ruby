# frozen_string_literal: true

class Code
  class Object
    class Function < Object
      attr_reader :parameters, :body

      def initialize(*args, **_kargs, &_block)
        @parameters = List.new(args.first.presence || [])
        @parameters.raw.map! { |parameter| Parameter.new(parameter) }
        @body = Code.new(args.second.presence || Nothing.new)
        @raw = List.new(parameters, body)
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, List.new)
        globals = multi_fetch(args, *GLOBALS)

        case operator.to_s
        when "", "call"
          sig(args) { signature_for_call }
          code_call(*arguments.raw, **globals)
        else
          super
        end
      end

      def code_call(*arguments, **globals)
        context = Context.new({}, globals[:context])

        parameters.raw.each.with_index do |parameter, index|
          argument =
            if parameter.keyword?
              arguments
                .detect do |dictionary|
                  dictionary.code_has_value?(parameter.code_name)
                end
                &.code_get(parameter.code_name)
            else
              arguments[index]
            end
          argument = parameter.evaluate(**globals) if argument.nil?
          context.code_set(parameter.code_name, argument)
        end

        body.evaluate(**globals, context:)
      end

      def signature_for_call
        parameters
          .raw
          .inject([]) do |signature, parameter|
            if parameter.keyword?
              if signature.last.is_a?(::Hash)
                signature.last.code_set(parameter.code_name, Object)
                signature
              else
                signature + [{ parameter.code_name => Object }]
              end
            else
              signature + [Object]
            end
          end + [Object.repeat]
      end
    end
  end
end
