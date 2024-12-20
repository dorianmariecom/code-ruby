# frozen_string_literal: true

class Code
  class Object
    class Dictionary < ::Code::Object
      def initialize(*args, **kargs, &)
        @raw = args.map(&:to_h).reduce({}, &:merge).merge(kargs)
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, List.new)
        globals = multi_fetch(args, *GLOBALS)
        value = arguments.code_first

        case operator.to_s
        when "<", "inferior"
          sig(args) { Dictionary }
          code_inferior(value)
        when "<=", "inferior_or_equal"
          sig(args) { Dictionary }
          code_inferior_or_equal(value)
        when "<=>", "compare"
          sig(args) { Dictionary }
          code_compare(value)
        when ">", "superior"
          sig(args) { Dictionary }
          code_superior(value)
        when ">=", "superior_or_equal"
          sig(args) { Dictionary }
          code_superior_or_equal(value)
        when "[]", "at", "get"
          sig(args) { Object }
          code_get(value)
        when "any?"
          sig(args) { Function | Class }
          code_any?(value, **globals)
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
          code_delete(*arguments.raw, **globals)
        when "delete_if"
          sig(args) { Function | Class }
          code_delete_if(value, **globals)
        when "delete_unless"
          sig(args) { Function | Class }
          code_delete_unless(value, **globals)
        when "dig"
          sig(args) { Object.repeat(1) }
          code_dig(*arguments.raw)
        when "each"
          sig(args) { Function }
          code_each(value, **globals)
        when "eight?"
          sig(args)
          code_eight?
        when "empty?"
          sig(args)
          code_empty?
        when "except"
          sig(args) { Object.repeat(1) }
          code_except(*arguments.raw)
        when "fetch"
          sig(args) { Object.repeat(1) }
          code_fetch(*arguments.raw, **globals)
        when "fetch_values"
          sig(args) { Object.repeat(1) }
          code_fetch_values(*arguments.raw)
        when "five?"
          sig(args)
          code_five?
        when "flatten"
          sig(args) { Integer.maybe }
          code_flatten(value)
        when "four?"
          sig(args)
          code_four?
        when "has_key?"
          sig(args) { Object }
          code_has_key?(value)
        when "has_value?"
          sig(args) { Object }
          code_has_value?(value)
        when "invert"
          sig(args)
          code_invert
        when "keep_if"
          sig(args) { Function | Class }
          code_keep_if(value, **globals)
        when "keep_unless"
          sig(args) { Function | Class }
          code_keep_unless(value, **globals)
        when "key"
          sig(args) { [Object, Function.maybe] }
          code_key(*arguments.raw, **globals)
        when "keys"
          sig(args)
          code_keys
        when "merge"
          sig(args) { [Dictionary.repeat, Function.maybe] }
          code_merge(*arguments.raw, **globals)
        when "merge!"
          sig(args) { [Dictionary.repeat, Function.maybe] }
          code_merge!(*arguments.raw, **globals)
        when "nine?"
          sig(args)
          code_nine?
        when "one?"
          sig(args)
          code_one?
        when "select!", "filter!"
          sig(args) { Function | Class }
          code_select!(value, **globals)
        when "select", "filter"
          sig(args) { Function | Class }
          code_select(value, **globals)
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
          code_transform_values(value, **globals)
        when "two?"
          sig(args)
          code_two?
        when "values"
          sig(args)
          code_values
        when "zero?"
          sig(args)
          code_zero?
        when ->(operator) { code_has_key?(String.new(operator)).truthy? }
          result = code_fetch(operator)

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
        if argument.is_a?(Class)
          Boolean.new(raw.any? { |_, value| value.is_a?(argument.raw) })
        else
          index = 0

          Boolean.new(
            raw.any? do |key, value|
              argument
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
        self.class.new(raw.dup.delete_if { |_, value| value.falsy? })
      end

      def code_compact!
        raw.delete_if { |_, value| value.falsy? }
        self
      end

      def code_compare(other)
        Integer.new(raw <=> other.raw)
      end

      def code_delete(*arguments, index: Integer.new(0), **globals)
        default =
          (
            if arguments.last.is_a?(Function) && arguments.size > 1
              arguments.last
            end
          )

        arguments = arguments[..-2] if default
        first = arguments.first

        if arguments.one?
          raw.delete(first) do
            if default
              default.call(arguments: List.new([first, self, index]), **globals)
            else
              raise(
                Code::Error::KeyNotFound,
                "#{first.inspect} not found on #{inspect}"
              )
            end
          end
        else
          self.class.new(
            arguments
              .map
              .with_index do |argument, index|
                if default
                  [
                    argument,
                    code_delete(
                      argument,
                      default,
                      index: Integer.new(index),
                      **globals
                    )
                  ]
                else
                  [
                    argument,
                    code_delete(argument, index: Integer.new(index), **globals)
                  ]
                end
              end
              .to_h
          )
        end
      end

      def code_delete_if(argument, **globals)
        if argument.is_a?(Class)
          raw.delete_if { |_, value| value.is_a?(argument.raw) }
        else
          raw.delete_if.with_index do |(key, value), index|
            argument.call(
              arguments: List.new([key, value, self, Integer.new(index)]),
              **globals
            ).truthy?
          end
        end

        self
      end

      def code_delete_unless(argument, **globals)
        if argument.is_a?(Class)
          raw.delete_if { |_, value| !value.is_a?(argument.raw) }
        else
          raw.delete_if.with_index do |(key, value), index|
            argument.call(
              arguments: List.new([key, value, self, Integer.new(index)]),
              **globals
            ).falsy?
          end
        end

        self
      end

      def code_dig(*)
        raw.dig(*) || Nothing.new
      end

      def code_each(argument, **globals)
        raw.each.with_index do |(key, value), index|
          argument.call(
            arguments: List.new([key, value, self, Integer.new(index)]),
            **globals
          )
        end

        self
      end

      delegate :code_eight?, to: :code_size

      def code_empty?
        Boolean.new(raw.empty?)
      end

      def code_except(*)
        self.class.new(raw.except(*))
      end

      def code_fetch(*arguments, index: 0, **globals)
        default =
          (
            if arguments.last.is_a?(Function) && arguments.size > 1
              arguments.last
            end
          )

        arguments = arguments[..-2] if default
        first = arguments.first || Nothing.new

        if arguments.one?
          raw.fetch(first) do
            if default
              default.call(
                arguments: List.new([first, Integer.new(index), self]),
                **globals
              )
            else
              raise(
                Error::KeyNotFound,
                "#{first.inspect} not found on #{inspect}"
              )
            end
          end
        else
          Dictionary.new(
            arguments
              .map
              .with_index do |argument, index|
                if default
                  [argument, code_fetch(argument, default, index:, **globals)]
                else
                  [argument, code_fetch(argument, index:, **globals)]
                end
              end
              .to_h
          )
        end
      end

      def code_fetch_values(*)
        List.new(raw.fetch_values(*))
      end

      delegate :code_five?, to: :code_size

      def code_flatten(level = nil)
        level = Integer.new(-1) if level.nil? || level.falsy?
        code_to_list.code_flatten(level)
      end

      delegate :code_four?, to: :code_size

      def code_get(key)
        raw[key] || Nothing.new
      end

      def code_has_key?(key)
        Boolean.new(raw.key?(key))
      end

      def code_has_value?(key)
        Boolean.new(raw.value?(key))
      end

      def code_inferior(other)
        Boolean.new(raw < other.raw)
      end

      def code_inferior_or_equal(other)
        Boolean.new(raw <= other.raw)
      end

      def code_invert
        self.class.new(raw.invert)
      end

      def code_keep_if(argument, **globals)
        if argument.is_a?(Class)
          raw.keep_if { |_, value| value.is_a?(argument.raw) }
        else
          raw.keep_if.with_index do |(key, value), index|
            argument.call(
              arguments: List.new([key, value, Integer.new(index), self]),
              **globals
            ).truthy?
          end
        end

        self
      end

      def code_keep_unless(argument, **globals)
        if argument.is_a?(Class)
          raw.keep_if { |_, value| !value.is_a?(argument.raw) }
        else
          raw.keep_if.with_index do |(key, value), index|
            argument.call(
              arguments: List.new([key, value, Integer.new(index), self]),
              **globals
            ).falsy?
          rescue Error::Next => e
            (e.value || Nothing.new).falsy?
          end
        end

        self
      end

      def code_key(value, function = nil, **globals)
        if function
          raw.key(value) ||
            function.call(arguments: List.new([value, self]), **globals)
        else
          raw.key(value) || Nothing.new
        end
      rescue Error::Next => e
        e.value || Nothing.new
      end

      def code_keys
        List.new(raw.keys)
      end

      def code_merge(*arguments, **globals)
        conflict =
          (
            if arguments.last.is_a?(Function) && arguments.size > 1
              arguments.last
            end
          )

        arguments = arguments[..-2] if conflict

        index = 0

        self.class.new(
          raw.merge(*arguments.map(&:raw)) do |key, old_value, new_value|
            if conflict
              conflict
                .call(
                  arguments:
                    List.new(
                      [key, old_value, new_value, Integer.new(index), self]
                    ),
                  **globals
                )
                .tap { index += 1 }
            else
              new_value.tap { index += 1 }
            end
          rescue Error::Next => e
            index += 1
            e.value || Nothing.new
          end
        )
      end

      def code_merge!(*arguments, **globals)
        conflict =
          (
            if arguments.last.is_a?(Function) && arguments.size > 1
              arguments.last
            end
          )

        arguments = arguments[..-2] if conflict

        index = 0

        raw.merge!(*arguments.map(&:raw)) do |key, old_value, new_value|
          if conflict
            conflict
              .call(
                arguments:
                  List.new(
                    [key, old_value, new_value, Integer.new(index), self]
                  ),
                **globals
              )
              .tap { index += 1 }
          else
            new_value.tap { index += 1 }
          end
        rescue Error::Next => e
          index += 1
          e.value || Nothing.new
        end

        self
      end

      delegate :code_nine?, to: :code_size

      delegate :code_one?, to: :code_size

      def code_select!(argument, **globals)
        if argument.is_a?(Class)
          raw.select! { |_, value| value.is_a?(argument.raw) }
        else
          raw.select!.with_index do |(key, value), index|
            argument.call(
              arguments: List.new([key, value, Integer.new(index), self]),
              **globals
            ).truthy?
          rescue Error::Next => e
            (e.value || Nothing.new).truthy?
          end
        end

        self
      end

      def code_select(argument, **globals)
        if argument.is_a?(Class)
          self.class.new(raw.select { |_, value| value.is_a?(argument.raw) })
        else
          self.class.new(
            raw.select.with_index do |(key, value), index|
              argument.call(
                arguments: List.new([key, value, Integer.new(index), self]),
                **globals
              ).truthy?
            rescue Error::Next => e
              (e.value || Nothing.new).truthy?
            end
          )
        end
      end

      def code_set(key, value)
        raw[key] = value
        value
      end

      delegate :code_seven?, to: :code_size

      delegate :code_six?, to: :code_size

      def code_size
        Integer.new(raw.size)
      end

      def code_superior(other)
        Boolean.new(raw > other.raw)
      end

      def code_superior_or_equal(other)
        Boolean.new(raw >= other.raw)
      end

      delegate :code_ten?, to: :code_size

      delegate :code_three?, to: :code_size

      def code_to_context
        Context.new(raw)
      end

      def code_to_list
        List.new(raw.to_a.map { |key_value| List.new(key_value) })
      end

      def to_h
        raw
      end

      def code_transform_values(function, **globals)
        self.class.new(
          raw.transform_values.with_index do |value, index|
            function.call(
              arguments: List.new([value, Integer.new(index), self]),
              **globals
            )
          rescue Error::Next => e
            e.value || Nothing.new
          end
        )
      end

      delegate :code_two?, to: :code_size

      def code_values
        List.new(raw.values)
      end

      delegate :code_zero?, to: :code_size
    end
  end
end
