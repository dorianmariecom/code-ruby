# frozen_string_literal: true

class Code
  class Object
    class Function < Object
      attr_reader :code_parameters, :code_body

      def initialize(*args, **_kargs, &_block)
        @code_parameters =
          List
            .new(args.first)
            .raw
            .map { |parameter| Parameter.new(parameter) }
            .to_code

        @code_body = Code.new(args.second.presence)

        self.raw = List.new([code_parameters, code_body])
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, List.new).to_code
        globals = multi_fetch(args, *GLOBALS)

        case code_operator.to_s
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
            if code_parameter.spread?
              code_arguments
            elsif code_parameter.regular_splat?
              code_arguments
            elsif code_parameter.keyword_splat?
              code_arguments.raw.detect do |code_argument|
                code_argument.is_a?(Dictionary)
              end || Dictionary.new
            elsif code_parameter.block?
              code_arguments
                .raw
                .detect { |code_argument| code_argument.is_a?(Function) }
                .to_code
            elsif code_parameter.keyword?
              code_arguments
                .raw
                .select { |code_argument| code_argument.is_a?(Dictionary) }
                .detect do |code_dictionary|
                  code_dictionary.code_has_key?(code_parameter.code_name).truthy?
                end
                &.code_get(code_parameter.code_name)
                .to_code
            else
              code_arguments.raw[index].to_code
            end

          if code_argument.nothing?
            code_argument = code_parameter.code_default
          end

          code_context.code_set(code_parameter.code_name, code_argument)
        end

        code_body.code_evaluate(**globals, context: code_context)
      end

      def signature_for_call
        code_parameters
          .raw
          .inject([]) do |signature, code_parameter|
            if code_parameter.spread?
              signature + [Object.repeat]
            elsif code_parameter.block?
              signature + [Function]
            elsif code_parameter.keyword_splat?
              signature + [Dictionary.maybe]
            elsif code_parameter.regular_splat?
              signature + [Object.repeat]
            elsif code_parameter.keyword? && code_parameter.required?
              if signature.last.is_a?(::Hash)
                signature.last[code_parameter.code_name] = Object
                signature
              else
                signature + [{ code_parameter.code_name => Object }]
              end
            elsif code_parameter.keyword?
              if signature.last.is_a?(::Hash)
                signature.last[code_parameter.code_name] = Object.maybe
                signature
              else
                signature + [{ code_parameter.code_name => Object.maybe }]
              end
            elsif code_parameter.required?
              signature + [Object]
            else
              signature + [Object.maybe]
            end
          end + [Object.repeat]
      end
    end
  end
end
