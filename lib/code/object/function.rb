# frozen_string_literal: true

class Code
  class Object
    class Function < Object
      attr_accessor :documentation
      attr_reader :code_parameters, :code_body, :definition_context,
                  :instance_functions, :parent

      def initialize(*args, parent: nil, functions: nil, **_kargs, &_block)
        @code_parameters =
          List
            .new(args.first)
            .raw
            .map { |parameter| Parameter.new(parameter) }
            .to_code

        @code_body = Code.new(args.second.presence)
        @definition_context = args.third if args.third.is_a?(Context)
        @parent = parent.to_code
        self.functions = functions.to_code
        self.functions = Dictionary.new if self.functions.nothing?
        @instance_functions = Dictionary.new
        self.documentation = Dictionary.new(
          "name" => String.new(""),
          "description" => String.new(""),
          "examples" => List.new
        )

        self.raw = List.new([code_parameters, code_body])
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, List.new).to_code
        code_value = code_arguments.code_first
        globals = multi_fetch(args, *GLOBALS)

        case code_operator.to_s
        when "", "call"
          sig(args) { signature_for_call }
          code_call(
            *code_arguments.raw,
            explicit_arguments: args.fetch(:explicit_arguments, true),
            bound_self: args.fetch(:bound_self, nil),
            constructing_literal_classes:
              args.fetch(:constructing_literal_classes, nil),
            **globals
          )
        when "extend"
          sig(args) { Function }
          code_extend(code_arguments.code_first)
        when "documentation", "doc"
          if code_arguments.any?
            sig(args) { Dictionary }
            self.documentation = code_value.code_to_dictionary
          else
            sig(args)
            documentation
          end
        when "documentation=", "doc="
          sig(args) { Dictionary }
          self.documentation = code_value.code_to_dictionary
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

      def code_call(
        *arguments,
        explicit_arguments: true,
        bound_self: nil,
        constructing_literal_classes: nil,
        **globals
      )
        code_arguments = arguments.to_code
        code_context = Context.new({}, definition_context || globals[:context])
        code_self = bound_self.to_code
        if (code_self.nil? || code_self.nothing?) && parent.is_a?(Class)
          code_self = parent.code_call(*arguments, **globals)
        end
        code_self = Dictionary.new if code_self.nil? || code_self.nothing?
        code_parent = captured_self.to_code

        code_context.code_set("self", code_self)
        bind_parent(code_context, code_self, code_parent)

        if parent.is_a?(Function) || parent.is_a?(Class)
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

        captures_function_arguments =
          code_parameters.raw.any? { |parameter| parameter.block? || parameter.blocks? }
        reserved_function_arguments =
          captures_function_arguments ? code_arguments.raw.grep(Function) : []
        code_block_argument =
          if code_parameters.raw.any?(&:block?)
            code_arguments.raw.detect { |argument| argument.is_a?(Function) }
          end

        code_parameters.raw.each.with_index do |code_parameter, index|
          code_argument =
            if code_parameter.spread?
              code_arguments
            elsif code_parameter.regular_splat?
              Object::List.new(
                code_arguments.raw.reject do |argument|
                  argument.is_a?(Dictionary) ||
                    reserved_function_arguments.include?(argument)
                end
              )
            elsif code_parameter.keyword_splat?
              code_arguments.raw.grep(Dictionary).inject(Dictionary.new) do |memo, argument|
                memo.code_merge!(argument)
              end
            elsif code_parameter.block?
              code_block_argument.to_code
            elsif code_parameter.blocks?
              Object::List.new(
                code_arguments.raw.grep(Function).reject do |argument|
                  argument == code_block_argument
                end
              )
            elsif code_parameter.keyword?
              code_arguments
                .raw
                .grep(Dictionary)
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

          if code_argument.nothing?
            code_default = code_parameter.code_default
            code_argument =
              if code_default.is_a?(Code)
                code_default.code_evaluate(
                  **globals,
                  context: code_context
                )
              else
                code_default
              end
          end

          code_name = code_parameter.code_name
          code_context.code_set(code_name, code_argument) unless code_name.blank?
        end

        code_body.code_evaluate(
          **globals,
          constructing_literal_classes: constructing_literal_classes,
          context: code_context
        ).tap do
          persist_instance_functions(code_self)
        end
      rescue Error::Return => e
        persist_instance_functions(code_self)
        e.code_value
      end

      def signature_for_call
        code_parameters
          .raw
          .inject([]) do |signature, code_parameter|
            if code_parameter.spread? || code_parameter.regular_splat?
              signature + [Object.repeat]
            elsif code_parameter.blocks?
              signature + [Function.repeat]
            elsif code_parameter.block?
              signature + [Function.maybe]
            elsif code_parameter.keyword_splat?
              signature + [Dictionary.maybe]
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
        String.new(
          Format.format(
            [
              {
                function: {
                  parameters:
                    code_parameters.raw.map do |parameter|
                      parameter_to_raw(parameter)
                    end,
                  body: code_body.raw.to_raw
                }
              }
            ]
          )
        )
      end

      def code_extend(function)
        code_function = function.to_code

        Function.new(
          code_function.code_parameters,
          code_function.code_body.raw,
          code_function.definition_context,
          parent: self,
          functions: functions.code_deep_duplicate
        ).tap do |extended_function|
          extended_function.instance_functions.code_merge!(instance_functions)
        end
      end

      def code_functions
        code_class_functions
      end

      def code_instance_functions
        parent_functions =
          if parent.is_a?(Function)
            parent.code_instance_functions
          else
            Dictionary.new
          end

        parent_functions.code_merge(function_dictionary_for(instance_functions))
      end

      def code_class_functions
        function_dictionary_for(functions)
      end

      def code_fetch(key)
        functions.code_fetch(key)
      end

      def code_get(key)
        functions.code_get(key)
      end

      def code_has_key?(key)
        functions.code_has_key?(key)
      end

      def code_set(key, value)
        functions.code_set(key, value)
      end

      private

      def function_dictionary_for(dictionary)
        Dictionary.new(
          dictionary.raw.to_h do |key, value|
            name = key.to_s
            [
              name,
              Dictionary.new(
                "name" => String.new(name),
                "description" => String.new(function_description(value)),
                "examples" => List.new(function_examples(value))
              )
            ]
          end
        )
      end

      def function_description(value)
        code_value = value.to_code
        return "" unless code_value.is_a?(Function)

        code_value.documentation.code_get("description").to_s
      end

      def function_examples(value)
        code_value = value.to_code
        return [] unless code_value.is_a?(Function)

        code_value.documentation.code_get("examples").to_code.code_to_list.raw
      end

      def persist_instance_functions(code_self)
        return unless code_self.is_a?(Object)

        instance_functions.code_merge!(documentable_instance_functions(code_self))
      end

      def documentable_instance_functions(code_self)
        code_self.code_documentable_functions
      end

      def bind_parent(code_context, code_self, code_parent)
        return if code_parent.nothing?

        code_context.code_set("parent", code_parent)

        return unless code_self.is_a?(Dictionary)
        return if code_self == code_parent
        return if code_self.code_has_key?("parent").truthy?

        code_self.code_set("parent", code_parent)
      end

      def captured_self
        self_from(definition_context)
      end

      def self_from(context)
        return if context.blank?

        current = context

        while current
          if current.code_has_key?("self").truthy?
            return current.code_fetch("self")
          end

          current = current.parent
        end

        nil
      end

      def parameter_to_raw(parameter)
        code_parameter = parameter.to_code
        raw_parameter = {}
        code_name = code_parameter.code_name
        raw_parameter[:name] = code_name.to_s unless code_name.blank?

        if code_parameter.keyword?
          raw_parameter[:keyword] = ":"
        elsif code_parameter.keyword_splat?
          raw_parameter[:keyword_splat] = "**"
        elsif code_parameter.regular_splat?
          raw_parameter[:regular_splat] = "*"
        elsif code_parameter.block?
          raw_parameter[:block] = "&"
        elsif code_parameter.blocks?
          raw_parameter[:blocks] = "&&"
        elsif code_parameter.spread?
          raw_parameter[:spread] = "..."
        end

        unless code_parameter.code_default.nothing?
          raw_parameter[:default] = (
            if code_parameter.code_default.code_to_string.raw == "nothing"
              []
            else
              ::Code.parse(code_parameter.code_default.to_s)
            end
          )
        end

        raw_parameter
      end
    end
  end
end
