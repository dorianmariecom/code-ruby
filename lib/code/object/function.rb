# frozen_string_literal: true

class Code
  class Object
    class Function < Object
      attr_reader :code_parameters, :code_body

      def initialize(*args, **_kargs, &)
        @code_parameters =
          (args.first.presence || [])
            .map { |parameter| Parameter.new(parameter) }
            .to_ruby

        @code_body = Code.new(args.second.presence)

        @raw = List.new([code_parameters, code_body])
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, List.new).to_code
        globals = multi_fetch(args, *GLOBALS)

        case operator.to_s
        when "", "call"
          sig(args) { signature_for_call }
          code_call(*code_arguments.raw, **globals)
        else
          super
        end
      end

      def code_call(*arguments, **globals)
        code_arguments = arguments.to_code
        code_context = Context.new({}, globals[:context])

        code_parameters.raw.each.with_index do |code_parameter, index|
          code_argument =
            if code_parameter.keyword?
              code_arguments
                .raw
                .select { |code_argument| code_argument.is_a?(Dictionary) }
                .detect do |code_dictionary|
                  code_dictionary.code_has_value?(parameter.code_name).truthy?
                end
                &.code_get(parameter.code_name)
            else
              code_arguments.raw[index].to_code
            end

          if code_argument.nothing?
            code_argument = code_parameter.code_evaluate(**globals)
          end

          code_context.code_set(code_parameter.code_name, code_argument)
        end

        code_body.evaluate(**globals, context: code_context)
      end

      def signature_for_call
        code_parameters
          .raw
          .inject([]) do |signature, code_parameter|
            if code_parameter.keyword?
              if signature.last.is_a?(::Hash)
                signature.last[parameter.code_name] = Object
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
