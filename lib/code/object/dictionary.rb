# frozen_string_literal: true

class Code
  class Object
    class Dictionary < ::Code::Object
      delegate(
        :code_many?,
        :code_positive?,
        :code_negative?,
        :code_zero?,
        :code_one?,
        :code_two?,
        :code_three?,
        :code_four?,
        :code_five?,
        :code_six?,
        :code_seven?,
        :code_eight?,
        :code_nine?,
        :code_ten?,
        :code_eleven?,
        :code_twelve?,
        :code_thirteen?,
        :code_fourteen?,
        :code_fifteen?,
        :code_sixteen?,
        :code_seventeen?,
        :code_eighteen?,
        :code_nineteen?,
        :code_twenty?,
        :code_twenty_one?,
        :code_twenty_two?,
        :code_twenty_three?,
        :code_twenty_four?,
        :code_twenty_five?,
        :code_twenty_six?,
        :code_twenty_seven?,
        :code_twenty_eight?,
        :code_twenty_nine?,
        :code_thirty?,
        :code_thirty_one?,
        :code_thirty_two?,
        :code_thirty_three?,
        :code_thirty_four?,
        :code_thirty_five?,
        :code_thirty_six?,
        :code_thirty_seven?,
        :code_thirty_eight?,
        :code_thirty_nine?,
        :code_forty?,
        :code_forty_one?,
        :code_forty_two?,
        :code_forty_three?,
        :code_forty_four?,
        :code_forty_five?,
        :code_forty_six?,
        :code_forty_seven?,
        :code_forty_eight?,
        :code_forty_nine?,
        :code_fifty?,
        :code_fifty_one?,
        :code_fifty_two?,
        :code_fifty_three?,
        :code_fifty_four?,
        :code_fifty_five?,
        :code_fifty_six?,
        :code_fifty_seven?,
        :code_fifty_eight?,
        :code_fifty_nine?,
        :code_sixty?,
        :code_sixty_one?,
        :code_sixty_two?,
        :code_sixty_three?,
        :code_sixty_four?,
        :code_sixty_five?,
        :code_sixty_six?,
        :code_sixty_seven?,
        :code_sixty_eight?,
        :code_sixty_nine?,
        :code_seventy?,
        :code_seventy_one?,
        :code_seventy_two?,
        :code_seventy_three?,
        :code_seventy_four?,
        :code_seventy_five?,
        :code_seventy_six?,
        :code_seventy_seven?,
        :code_seventy_eight?,
        :code_seventy_nine?,
        :code_eighty?,
        :code_eighty_one?,
        :code_eighty_two?,
        :code_eighty_three?,
        :code_eighty_four?,
        :code_eighty_five?,
        :code_eighty_six?,
        :code_eighty_seven?,
        :code_eighty_eight?,
        :code_eighty_nine?,
        :code_ninety?,
        :code_ninety_one?,
        :code_ninety_two?,
        :code_ninety_three?,
        :code_ninety_four?,
        :code_ninety_five?,
        :code_ninety_six?,
        :code_ninety_seven?,
        :code_ninety_eight?,
        :code_ninety_nine?,
        :code_one_hundred?,
        to: :code_size
      )

      def initialize(*args, **kargs, &_block)
        self.raw =
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
        when "[]", "at", "get"
          sig(args) { Object }
          code_get(code_value)
        when "any?"
          sig(args) { (Function | Class).maybe }
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
        when "flatten"
          sig(args) { Integer.maybe }
          code_flatten(code_value)
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
        when "select!", "filter!"
          sig(args) { Function | Class }
          code_select!(code_value, **globals)
        when "select", "filter"
          sig(args) { Function | Class }
          code_select(code_value, **globals)
        when "size"
          sig(args)
          code_size
        when "transform_values"
          sig(args) { Function }
          code_transform_values(code_value, **globals)
        when "to_query"
          sig(args) { String.maybe }
          code_to_query(code_value)
        when "values"
          sig(args)
          code_values
        when "many?"
          sig(args)
          code_many?
        when "positive?"
          sig(args)
          code_positive?
        when "negative?"
          sig(args)
          code_negative?
        when "zero?"
          sig(args)
          code_zero?
        when "one?"
          sig(args)
          code_one?
        when "two?"
          sig(args)
          code_two?
        when "three?"
          sig(args)
          code_three?
        when "four?"
          sig(args)
          code_four?
        when "five?"
          sig(args)
          code_five?
        when "six?"
          sig(args)
          code_six?
        when "seven?"
          sig(args)
          code_seven?
        when "eight?"
          sig(args)
          code_eight?
        when "nine?"
          sig(args)
          code_nine?
        when "ten?"
          sig(args)
          code_ten?
        when "eleven?"
          sig(args)
          code_eleven?
        when "twelve?"
          sig(args)
          code_twelve?
        when "thirteen?"
          sig(args)
          code_thirteen?
        when "fourteen?"
          sig(args)
          code_fourteen?
        when "fifteen?"
          sig(args)
          code_fifteen?
        when "sixteen?"
          sig(args)
          code_sixteen?
        when "seventeen?"
          sig(args)
          code_seventeen?
        when "eighteen?"
          sig(args)
          code_eighteen?
        when "nineteen?"
          sig(args)
          code_nineteen?
        when "twenty?"
          sig(args)
          code_twenty?
        when "twenty_one?"
          sig(args)
          code_twenty_one?
        when "twenty_two?"
          sig(args)
          code_twenty_two?
        when "twenty_three?"
          sig(args)
          code_twenty_three?
        when "twenty_four?"
          sig(args)
          code_twenty_four?
        when "twenty_five?"
          sig(args)
          code_twenty_five?
        when "twenty_six?"
          sig(args)
          code_twenty_six?
        when "twenty_seven?"
          sig(args)
          code_twenty_seven?
        when "twenty_eight?"
          sig(args)
          code_twenty_eight?
        when "twenty_nine?"
          sig(args)
          code_twenty_nine?
        when "thirty?"
          sig(args)
          code_thirty?
        when "thirty_one?"
          sig(args)
          code_thirty_one?
        when "thirty_two?"
          sig(args)
          code_thirty_two?
        when "thirty_three?"
          sig(args)
          code_thirty_three?
        when "thirty_four?"
          sig(args)
          code_thirty_four?
        when "thirty_five?"
          sig(args)
          code_thirty_five?
        when "thirty_six?"
          sig(args)
          code_thirty_six?
        when "thirty_seven?"
          sig(args)
          code_thirty_seven?
        when "thirty_eight?"
          sig(args)
          code_thirty_eight?
        when "thirty_nine?"
          sig(args)
          code_thirty_nine?
        when "forty?"
          sig(args)
          code_forty?
        when "forty_one?"
          sig(args)
          code_forty_one?
        when "forty_two?"
          sig(args)
          code_forty_two?
        when "forty_three?"
          sig(args)
          code_forty_three?
        when "forty_four?"
          sig(args)
          code_forty_four?
        when "forty_five?"
          sig(args)
          code_forty_five?
        when "forty_six?"
          sig(args)
          code_forty_six?
        when "forty_seven?"
          sig(args)
          code_forty_seven?
        when "forty_eight?"
          sig(args)
          code_forty_eight?
        when "forty_nine?"
          sig(args)
          code_forty_nine?
        when "fifty?"
          sig(args)
          code_fifty?
        when "fifty_one?"
          sig(args)
          code_fifty_one?
        when "fifty_two?"
          sig(args)
          code_fifty_two?
        when "fifty_three?"
          sig(args)
          code_fifty_three?
        when "fifty_four?"
          sig(args)
          code_fifty_four?
        when "fifty_five?"
          sig(args)
          code_fifty_five?
        when "fifty_six?"
          sig(args)
          code_fifty_six?
        when "fifty_seven?"
          sig(args)
          code_fifty_seven?
        when "fifty_eight?"
          sig(args)
          code_fifty_eight?
        when "fifty_nine?"
          sig(args)
          code_fifty_nine?
        when "sixty?"
          sig(args)
          code_sixty?
        when "sixty_one?"
          sig(args)
          code_sixty_one?
        when "sixty_two?"
          sig(args)
          code_sixty_two?
        when "sixty_three?"
          sig(args)
          code_sixty_three?
        when "sixty_four?"
          sig(args)
          code_sixty_four?
        when "sixty_five?"
          sig(args)
          code_sixty_five?
        when "sixty_six?"
          sig(args)
          code_sixty_six?
        when "sixty_seven?"
          sig(args)
          code_sixty_seven?
        when "sixty_eight?"
          sig(args)
          code_sixty_eight?
        when "sixty_nine?"
          sig(args)
          code_sixty_nine?
        when "seventy?"
          sig(args)
          code_seventy?
        when "seventy_one?"
          sig(args)
          code_seventy_one?
        when "seventy_two?"
          sig(args)
          code_seventy_two?
        when "seventy_three?"
          sig(args)
          code_seventy_three?
        when "seventy_four?"
          sig(args)
          code_seventy_four?
        when "seventy_five?"
          sig(args)
          code_seventy_five?
        when "seventy_six?"
          sig(args)
          code_seventy_six?
        when "seventy_seven?"
          sig(args)
          code_seventy_seven?
        when "seventy_eight?"
          sig(args)
          code_seventy_eight?
        when "seventy_nine?"
          sig(args)
          code_seventy_nine?
        when "eighty?"
          sig(args)
          code_eighty?
        when "eighty_one?"
          sig(args)
          code_eighty_one?
        when "eighty_two?"
          sig(args)
          code_eighty_two?
        when "eighty_three?"
          sig(args)
          code_eighty_three?
        when "eighty_four?"
          sig(args)
          code_eighty_four?
        when "eighty_five?"
          sig(args)
          code_eighty_five?
        when "eighty_six?"
          sig(args)
          code_eighty_six?
        when "eighty_seven?"
          sig(args)
          code_eighty_seven?
        when "eighty_eight?"
          sig(args)
          code_eighty_eight?
        when "eighty_nine?"
          sig(args)
          code_eighty_nine?
        when "ninety?"
          sig(args)
          code_ninety?
        when "ninety_one?"
          sig(args)
          code_ninety_one?
        when "ninety_two?"
          sig(args)
          code_ninety_two?
        when "ninety_three?"
          sig(args)
          code_ninety_three?
        when "ninety_four?"
          sig(args)
          code_ninety_four?
        when "ninety_five?"
          sig(args)
          code_ninety_five?
        when "ninety_six?"
          sig(args)
          code_ninety_six?
        when "ninety_seven?"
          sig(args)
          code_ninety_seven?
        when "ninety_eight?"
          sig(args)
          code_ninety_eight?
        when "ninety_nine?"
          sig(args)
          code_ninety_nine?
        when "one_hundred?"
          sig(args)
          code_one_hundred?
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

        if code_argument.nothing?
          Boolean.new(raw.any?)
        elsif code_argument.is_a?(Class)
          Boolean.new(raw.any? { |_, value| value.is_a?(code_argument.raw) })
        else
          index = 0

          Boolean.new(
            raw.any? do |key, value|
              code_argument
                .call(
                  arguments: List.new([key, value, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
            end
          )
        end
      end

      def code_clear
        self.raw = {}
        self
      end

      def code_compact
        Dictionary.new(raw.dup.delete_if { |_, value| value.falsy? })
      end

      def code_compact!
        raw.delete_if { |_, value| value.falsy? }
        self
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
                List.new([code_key, code_value, Integer.new(index), self]),
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
              arguments: List.new([key, value, Integer.new(index), self]),
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
            arguments: List.new([key, value, Integer.new(index), self]),
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

      def code_to_context
        Context.new(raw)
      end

      def code_to_query(namespace = nil)
        code_namespace = namespace.to_code

        String.new(raw.to_query(code_namespace.raw))
      end

      def code_transform_values(function, **globals)
        code_function = function.to_code

        Dictionary.new(
          raw
            .map
            .with_index do |(key, value), index|
              [
                key.to_code,
                code_function.call(
                  arguments:
                    List.new([key.to_code, value.to_code, index.to_code, self]),
                  **globals
                )
              ]
            rescue Error::Next => e
              [key.to_code, e.code_value]
            end
            .to_h
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

      def <=>(other)
        code_other = other.to_code
        return -1 if self.class != code_other.class
        return 0 if raw == code_other.raw
        return -1 if raw < code_other.raw
        return 1 if raw > code_other.raw

        -1
      end

      def present?
        raw.present?
      end
    end
  end
end
