# frozen_string_literal: true

class Code
  class Object
    class Function < Object
      attr_reader :code_parameters, :code_body, :definition_context, :parent

      def initialize(*args, parent: nil, methods: nil, **_kargs, &_block)
        @code_parameters =
          List
            .new(args.first)
            .raw
            .map { |parameter| Parameter.new(parameter) }
            .to_code

        @code_body = Code.new(args.second.presence)
        @definition_context = args.third if args.third.is_a?(Context)
        @parent = parent.to_code
        self.methods = methods.to_code
        self.methods = Dictionary.new if self.methods.nothing?

        self.raw = List.new([code_parameters, code_body])
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, List.new).to_code
        globals = multi_fetch(args, *GLOBALS)

        case code_operator.to_s
        when "", "call"
          sig(args) { signature_for_call }
          code_call(
            *code_arguments.raw,
            explicit_arguments: args.fetch(:explicit_arguments, true),
            **globals
          )
        when "extend"
          sig(args) { Function }
          code_extend(code_arguments.code_first)
        when /=$/
          sig(args) { Object }
          code_set(code_operator.to_s.chop, code_value)
        when ->(operator) { code_has_key?(operator).truthy? }
          result = code_fetch(code_operator)

          if result.is_a?(Function)
            result.call(**args, operator: nil, bound_self: self)
          else
            sig(args)
            result
          end
        else
          super
        end
      end

      def code_call(*arguments, explicit_arguments: true, bound_self: nil, **globals)
        code_arguments = arguments.to_code
        code_context = Context.new({}, definition_context || globals[:context])
        code_self = bound_self.to_code
        code_self = captured_self if code_self.nothing? && captured_self
        code_self = Dictionary.new if code_self.nil? || code_self.nothing?

        code_context.code_set("self", code_self)

        if parent.is_a?(Function)
          code_context.code_set(
            "super",
            Super.new(
              parent,
              code_arguments,
              code_self,
              definition_context || globals[:context],
              explicit_arguments: explicit_arguments
            )
          )
        end

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
                  code_dictionary.code_has_key?(
                    code_parameter.code_name
                  ).truthy?
                end
                &.code_get(code_parameter.code_name)
                .to_code
            else
              code_arguments.raw[index].to_code
            end

          code_argument = code_parameter.code_default if code_argument.nothing?

          code_context.code_set(code_parameter.code_name, code_argument)
        end

        code_body.code_evaluate(**globals, context: code_context)
      rescue Error::Return => e
        e.code_value
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

      def code_to_string
        String.new("<#{self.class.name} #{raw}>")
      end

      def code_extend(function)
        code_function = function.to_code

        Function.new(
          code_function.code_parameters,
          code_function.code_body.raw,
          code_function.definition_context,
          parent: self,
          methods: methods.code_deep_duplicate
        )
      end

      def code_fetch(key)
        methods.code_fetch(key)
      end

      def code_get(key)
        methods.code_get(key)
      end

      def code_has_key?(key)
        methods.code_has_key?(key)
      end

      def code_set(key, value)
        methods.code_set(key, value)
      end

      private

      def captured_self
        self_from(definition_context)
      end

      def self_from(context)
        return if context.blank?

        current = context

        while current
          return current.code_fetch("self") if current.code_has_key?("self").truthy?

          current = current.parent
        end

        nil
      end
    end
  end
end
