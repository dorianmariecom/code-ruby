# frozen_string_literal: true

class Code
  class Object
    class Dictionary < ::Code::Object
      delegate :code_eight?, to: :code_size
      delegate :code_five?, to: :code_size
      delegate :code_four?, to: :code_size
      delegate :code_nine?, to: :code_size
      delegate :code_one?, to: :code_size
      delegate :code_seven?, to: :code_size
      delegate :code_six?, to: :code_size
      delegate :code_ten?, to: :code_size
      delegate :code_three?, to: :code_size
      delegate :code_two?, to: :code_size
      delegate :code_zero?, to: :code_size

      def initialize(*args, **kargs, &_block)
        @raw =
          args
            .map do |arg|
              if arg.is_an?(::Hash)
                arg.transform_keys(&:to_code).transform_values(&:to_code)
              elsif arg.is_a?(Dictionary)
                arg.raw.transform_keys(&:to_code).transform_values(&:to_code)
              elsif arg.is_a?(Node::FunctionParameter)
                arg.to_h.transform_keys(&:to_code).transform_values(&:to_code)
              else
                {}
              end
            end
            .reduce({}, &:merge)
            .merge(kargs.transform_keys(&:to_code).transform_values(&:to_code))
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, List.new).to_code
        globals = multi_fetch(args, *GLOBALS)
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "<", "inferior"
          sig(args) { Dictionary }
          code_inferior(code_value)
        when "<=", "inferior_or_equal"
          sig(args) { Dictionary }
          code_inferior_or_equal(code_value)
        when "<=>", "compare"
          sig(args) { Dictionary }
          code_compare(code_value)
        when ">", "superior"
          sig(args) { Dictionary }
          code_superior(code_value)
        when ">=", "superior_or_equal"
          sig(args) { Dictionary }
          code_superior_or_equal(code_value)
        when "[]", "at", "get"
          sig(args) { Object }
          code_get(code_value)
        when "any?"
          sig(args) { Function | Class }
          code_any?(code_value, **globals)
        when "clear"
          sig(args)
          code_clear
        when "compact!"
          sig(args)
          code_compact!
        when "compact"
          sig(args)
          code_compact
        when "delete"
          sig(args) { Object.repeat(1) }
          code_delete(*code_arguments.raw, **globals)
        when "delete_if"
          sig(args) { Function | Class }
          code_delete_if(code_value, **globals)
        when "delete_unless"
          sig(args) { Function | Class }
          code_delete_unless(code_value, **globals)
        when "dig"
          sig(args) { Object.repeat(1) }
          code_dig(*code_arguments.raw)
        when "each"
          sig(args) { Function }
          code_each(code_value, **globals)
        when "eight?"
          sig(args)
          code_eight?
        when "empty?"
          sig(args)
          code_empty?
        when "except"
          sig(args) { Object.repeat(1) }
          code_except(*code_arguments.raw)
        when "fetch"
          sig(args) { Object.repeat(1) }
          code_fetch(*code_arguments.raw, **globals)
        when "fetch_values"
          sig(args) { Object.repeat(1) }
          code_fetch_values(*code_arguments.raw)
        when "five?"
          sig(args)
          code_five?
        when "flatten"
          sig(args) { Integer.maybe }
          code_flatten(code_value)
        when "four?"
          sig(args)
          code_four?
        when "has_key?"
          sig(args) { Object }
          code_has_key?(code_value)
        when "has_value?"
          sig(args) { Object }
          code_has_value?(code_value)
        when "invert"
          sig(args)
          code_invert
        when "keep_if"
          sig(args) { Function | Class }
          code_keep_if(code_value, **globals)
        when "keep_unless"
          sig(args) { Function | Class }
          code_keep_unless(code_value, **globals)
        when "key"
          sig(args) { [Object, Function.maybe] }
          code_key(*code_arguments.raw, **globals)
        when "keys"
          sig(args)
          code_keys
        when "merge"
          sig(args) { [Dictionary.repeat, Function.maybe] }
          code_merge(*code_arguments.raw, **globals)
        when "merge!"
          sig(args) { [Dictionary.repeat, Function.maybe] }
          code_merge!(*code_arguments.raw, **globals)
        when "nine?"
          sig(args)
          code_nine?
        when "one?"
          sig(args)
          code_one?
        when "select!", "filter!"
          sig(args) { Function | Class }
          code_select!(code_value, **globals)
        when "select", "filter"
          sig(args) { Function | Class }
          code_select(code_value, **globals)
        when "seven?"
          sig(args)
          code_seven?
        when "six?"
          sig(args)
          code_six?
        when "size"
          sig(args)
          code_size
        when "ten?"
          sig(args)
          code_ten?
        when "three?"
          sig(args)
          code_three?
        when "to_list"
          sig(args)
          code_to_list
        when "transform_values"
          sig(args) { Function }
          code_transform_values(code_value, **globals)
        when "to_query"
          sig(args) { String.maybe }
          code_to_query(code_value)
        when "two?"
          sig(args)
          code_two?
        when "values"
          sig(args)
          code_values
        when "zero?"
          sig(args)
          code_zero?
        when ->(code_operator) { code_has_key?(code_operator).truthy? }
          result = code_fetch(code_operator)

          if result.is_a?(Function)
            result.call(**args, operator: nil)
          else
            sig(args)
            result
          end
        else
          super
        end
      end

      def code_any?(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          Boolean.new(raw.any? { |_, value| value.is_a?(code_argument.raw) })
        else
          index = 0

          Boolean.new(
            raw.any? do |key, value|
              code_argument
                .call(
                  arguments: List.new([key, value, self, Integer.new(index)]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
            end
          )
        end
      end

      def code_clear
        @raw = {}
        self
      end

      def code_compact
        Dictionary.new(raw.dup.delete_if { |_, value| value.falsy? })
      end

      def code_compact!
        raw.delete_if { |_, value| value.falsy? }
        self
      end

      def code_compare(other)
        code_other = other.to_code
        Integer.new(raw <=> code_other.raw)
      end

      def code_delete(*arguments, index: 0, **globals)
        arguments = arguments.to_code.raw
        code_index = index.to_code

        code_default =
          (
            arguments.last if arguments.last.is_a?(Function) && arguments.many?
          ).to_code

        arguments = arguments[...-1] unless code_default.nothing?
        code_first = arguments.first.to_code

        if arguments.one?
          raw.delete(code_first) do
            if code_default.nothing?
              Nothing.new
            else
              code_default.call(
                arguments: List.new([code_first, self, code_index]),
                **globals
              )
            end
          end
        else
          Dictionary.new(
            arguments
              .map
              .with_index do |code_argument, index|
                if code_default.nothing?
                  [
                    code_argument,
                    code_delete(code_argument, index: index, **globals)
                  ]
                else
                  [
                    code_argument,
                    code_delete(
                      code_argument,
                      code_default,
                      index: index,
                      **globals
                    )
                  ]
                end
              end
              .to_h
          )
        end
      end

      def code_delete_if(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          raw.delete_if { |_, value| value.is_a?(code_argument.raw) }
        else
          raw.delete_if.with_index do |(code_key, code_value), index|
            argument.call(
              arguments:
                List.new([code_key, code_value, self, Integer.new(index)]),
              **globals
            ).truthy?
          end
        end

        self
      end

      def code_delete_unless(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          raw.delete_if { |_, value| !value.is_a?(code_argument.raw) }
        else
          raw.delete_if.with_index do |(key, value), index|
            code_argument.call(
              arguments: List.new([key, value, self, Integer.new(index)]),
              **globals
            ).falsy?
          end
        end

        self
      end

      def code_dig(*arguments)
        code_arguments = arguments.to_code

        code_arguments
          .raw
          .reduce(self) do |code_acc, code_element|
            if code_acc.is_a?(Dictionary) || code_acc.is_a?(List)
              code_acc.code_get(code_element)
            else
              Nothing.new
            end
          end
      end

      def code_each(argument, **globals)
        code_argument = argument.to_code

        raw.each.with_index do |(key, value), index|
          code_argument.call(
            arguments: List.new([key, value, self, Integer.new(index)]),
            **globals
          )
        end

        self
      end

      def code_empty?
        Boolean.new(raw.empty?)
      end

      def code_except(*arguments)
        code_arguments = arguments.to_code
        Dictionary.new(raw.except(*code_arguments.raw))
      end

      def code_fetch(*arguments, index: 0, **globals)
        code_index = index.to_code
        arguments = arguments.to_code.raw

        code_default =
          (
            arguments.last if arguments.last.is_a?(Function) && arguments.many?
          ).to_code

        arguments = arguments[..-2] unless code_default.nothing?
        code_first = arguments.first.to_code

        if arguments.one?
          raw.fetch(code_first) do
            if code_default.nothing?
              Nothing.new
            else
              code_default.call(
                arguments: List.new([code_first, code_index, self]),
                **globals
              )
            end
          end
        else
          Dictionary.new(
            arguments
              .map
              .with_index do |code_argument, index|
                if code_default.nothing?
                  [
                    code_argument,
                    code_fetch(code_argument, index: index, **globals)
                  ]
                else
                  [
                    code_argument,
                    code_fetch(
                      code_argument,
                      code_default,
                      index: index,
                      **globals
                    )
                  ]
                end
              end
              .to_h
          )
        end
      end

      def code_fetch_values(*arguments)
        code_arguments = arguments.to_code

        List.new(raw.fetch_values(*code_arguments.raw))
      end

      def code_flatten(level = nil)
        code_level = level.to_code
        code_level = Integer.new(-1) if code_level.nothing?
        code_to_list.code_flatten(code_level)
      end

      def code_get(key)
        code_key = key.to_code
        raw[code_key] || Nothing.new
      end

      def code_has_key?(key)
        code_key = key.to_code
        Boolean.new(raw.key?(code_key))
      end

      def code_has_value?(key)
        code_key = key.to_code
        Boolean.new(raw.value?(code_key))
      end

      def code_inferior(other)
        code_other = other.to_code
        Boolean.new(raw < code_other.raw)
      end

      def code_inferior_or_equal(other)
        code_other = other.to_code
        Boolean.new(raw <= code_other.raw)
      end

      def code_invert
        Dictionary.new(raw.invert)
      end

      def code_keep_if(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          raw.keep_if { |_, value| value.is_a?(code_argument.raw) }
        else
          raw.keep_if.with_index do |(key, value), index|
            code_argument.call(
              arguments: List.new([key, value, Integer.new(index), self]),
              **globals
            ).truthy?
          end
        end

        self
      end

      def code_keep_unless(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          raw.keep_if { |_, value| !value.is_a?(code_argument.raw) }
        else
          raw.keep_if.with_index do |(key, value), index|
            code_argument.call(
              arguments: List.new([key, value, Integer.new(index), self]),
              **globals
            ).falsy?
          rescue Error::Next => e
            e.code_value.falsy?
          end
        end

        self
      end

      def code_key(value, function = nil, **globals)
        code_value = value.to_code
        code_function = function.to_code

        if code_function.nothing?
          raw.key(code_value) || Nothing.new
        else
          raw.key(code_value) ||
            function.call(arguments: List.new([code_value, self]), **globals)
        end
      rescue Error::Next => e
        e.code_value
      end

      def code_keys
        List.new(raw.keys)
      end

      def code_merge(*arguments, **globals)
        arguments = arguments.to_code.raw

        code_conflict =
          (
            arguments.last if arguments.last.is_a?(Function) && arguments.many?
          ).to_code

        arguments = arguments[..-2] unless code_conflict.nothing?

        index = 0

        Dictionary.new(
          raw.merge(*arguments.map(&:raw)) do |key, old_value, new_value|
            if code_conflict.nothing?
              new_value.to_code.tap { index += 1 }
            else
              code_conflict
                .call(
                  arguments:
                    List.new(
                      [
                        key.to_code,
                        old_value.to_code,
                        new_value.to_code,
                        index.to_code,
                        self
                      ]
                    ),
                  **globals
                )
                .tap { index += 1 }
            end
          rescue Error::Next => e
            e.code_value.tap { index += 1 }
          end
        )
      end

      def code_merge!(*arguments, **globals)
        arguments = arguments.to_code.raw

        code_conflict =
          (
            arguments.last if arguments.last.is_a?(Function) && arguments.many?
          ).to_code

        arguments = arguments[..-2] unless code_conflict.nothing?

        index = 0

        raw.merge!(*arguments.map(&:raw)) do |key, old_value, new_value|
          if code_conflict.nothing?
            new_value.to_code.tap { index += 1 }
          else
            code_conflict
              .call(
                arguments:
                  List.new(
                    [
                      key.to_code,
                      old_value.to_code,
                      new_value.to_code,
                      index.to_code,
                      self
                    ]
                  ),
                **globals
              )
              .tap { index += 1 }
          end
        rescue Error::Next => e
          e.code_value.tap { index += 1 }
        end

        self
      end

      def code_select!(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          raw.select! { |_, value| value.is_a?(code_argument.raw) }
        else
          raw.select!.with_index do |(key, value), index|
            argument.call(
              arguments:
                List.new([key.to_code, value.to_code, index.to_code, self]),
              **globals
            ).truthy?
          rescue Error::Next => e
            e.code_value.truthy?
          end
        end

        self
      end

      def code_select(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          Dictionary.new(
            raw.select { |_, value| value.is_a?(code_argument.raw) }
          )
        else
          Dictionary.new(
            raw.select.with_index do |(key, value), index|
              argument.call(
                arguments:
                  List.new([key.to_code, value.to_code, index.to_code, self]),
                **globals
              ).truthy?
            rescue Error::Next => e
              e.code_value.truthy?
            end
          )
        end
      end

      def code_set(key, value)
        code_key = key.to_code
        code_value = value.to_code
        raw[code_key] = code_value
        code_value
      end

      def code_size
        Integer.new(raw.size)
      end

      def code_superior(other)
        code_other = other.to_code
        Boolean.new(raw > code_other.raw)
      end

      def code_superior_or_equal(other)
        code_other = other.to_code
        Boolean.new(raw >= code_other.raw)
      end

      def code_to_context
        Context.new(raw)
      end

      def code_to_list
        List.new(raw.to_a.map { |key_value| List.new(key_value) })
      end

      def code_to_query(namespace = nil)
        code_namespace = namespace.to_code

        String.new(raw.to_query(code_namespace.raw))
      end

      def code_transform_values(function, **globals)
        code_function = function.to_code

        Dictionary.new(
          raw.transform_values.with_index do |value, index|
            code_function.call(
              arguments: List.new([value.to_code, index.to_code, self]),
              **globals
            )
          rescue Error::Next => e
            e.code_value
          end
        )
      end

      def code_values
        List.new(raw.values)
      end

      def code_deep_duplicate
        Dictionary.new(
          raw.dup.to_h { |key, value| [key, value].map(&:code_deep_duplicate) }
        )
      end
    end
  end
end
