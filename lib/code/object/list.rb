# frozen_string_literal: true

class Code
  class Object
    class List < Object
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

      def initialize(*args, **_kargs, &_block)
        self.raw =
          if args.first.is_a?(List)
            args.first.raw.map(&:to_code)
          elsif args.first.is_a?(Dictionary)
            args.first.raw.to_a.map(&:to_code)
          elsif args.first.is_an?(::Array)
            args.first.map(&:to_code)
          elsif args.first.is_a?(::Hash)
            args.first.to_a.map(&:to_code)
          else
            []
          end
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        globals = multi_fetch(args, *GLOBALS)
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "join"
          sig(args) { String.maybe }
          code_join(code_value)
        when "sort"
          sig(args) { Function.maybe }
          code_sort(code_value, **globals)
        when "<<", "append"
          sig(args) { Object }
          code_append(code_value)
        when "-", "minus"
          sig(args) { List }
          code_minus(code_value)
        when "any?"
          sig(args) { (Function | Class).maybe }
          code_any?(code_value, **globals)
        when "detect"
          sig(args) { (Function | Class).maybe }
          code_detect(code_value, **globals)
        when "each"
          sig(args) { (Function | Class).maybe }
          code_each(code_value, **globals)
        when "first"
          sig(args) { Integer.maybe }
          code_first(code_value)
        when "sample"
          sig(args) { Integer.maybe }
          code_sample(code_value)
        when "shuffle"
          sig(args)
          code_shuffle
        when "flatten"
          sig(args) { Integer.maybe }
          code_flatten(code_value)
        when "pop"
          sig(args) { Integer.maybe }
          code_pop(code_value)
        when "pop!"
          sig(args) { Integer.maybe }
          code_pop!(code_value)
        when "shift"
          sig(args) { Integer.maybe }
          code_shift(code_value)
        when "include?"
          sig(args) { Object }
          code_include?(code_value)
        when "last"
          sig(args)
          code_last
        when "map"
          sig(args) { (Function | Class).maybe }
          code_map(code_value, **globals)
        when "map!"
          sig(args) { (Function | Class).maybe }
          code_map!(code_value, **globals)
        when "max"
          sig(args) { (Function | Class).maybe }
          code_max(code_value, **globals)
        when "none?"
          sig(args) { (Function | Class).maybe }
          code_none?(code_value, **globals)
        when "all?"
          sig(args) { (Function | Class).maybe }
          code_all?(code_value, **globals)
        when "reduce"
          sig(args) { (Function | Class).maybe }
          code_reduce(code_value, **globals)
        when "reverse"
          sig(args)
          code_reverse
        when "select"
          sig(args) { (Function | Class).maybe }
          code_select(code_value, **globals)
        when "select!"
          sig(args) { (Function | Class).maybe }
          code_select!(code_value, **globals)
        when "compact"
          sig(args) { (Function | Class).maybe }
          code_compact(code_value, **globals)
        when "compact!"
          sig(args) { (Function | Class).maybe }
          code_compact!(code_value, **globals)
        when "reject"
          sig(args) { (Function | Class).maybe }
          code_reject(code_value, **globals)
        when "reject!"
          sig(args) { (Function | Class).maybe }
          code_reject!(code_value, **globals)
        when "size"
          sig(args)
          code_size
        when "sum"
          sig(args)
          code_sum
        when "uniq"
          sig(args)
          code_uniq
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
        else
          super
        end
      end

      def code_any?(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        Boolean.new(
          raw.any? do |code_element|
            if code_argument.is_a?(Function)
              code_argument
                .call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw).tap { index += 1 }
            else
              true.tap { index += 1 }
            end
          rescue Error::Next => e
            e.code_value.tap { index += 1 }
          end
        )
      end

      def code_append(other)
        code_other = other.to_code

        raw << code_other

        self
      end

      def code_minus(other)
        code_other = other.to_code

        List.new(raw - code_other.raw)
      end

      def code_detect(argument = nil, **globals)
        code_argument = argument.to_code

        raw.detect.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          elsif code_argument.is_a?(Class)
            code_element.is_a?(code_argument.raw)
          else
            false
          end
        rescue Error::Next => e
          e.code_value
        end || Nothing.new
      end

      def code_each(argument = nil, **globals)
        code_argument = argument.to_code

        raw.each.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            )
          elsif code_argument.is_a?(Class)
            code_argument.raw.new(code_element)
          end
        rescue Error::Next => e
          e.code_value
        end

        self
      end

      def code_first(value = nil)
        code_value = value.to_code

        if code_value.nothing?
          raw.first || Nothing.new
        else
          List.new(raw.first(code_value.raw))
        end
      end

      def code_sample(value = nil)
        code_value = value.to_code

        if code_value.nothing?
          raw.sample || Nothing.new
        else
          List.new(raw.sample(code_value.raw))
        end
      end

      def code_shuffle
        List.new(raw.shuffle)
      end

      def code_flatten(level = nil)
        code_level = level.to_code
        code_level = Integer.new(-1) if code_level.nothing?
        level = code_level.raw

        List.new(
          raw.reduce([]) do |acc, code_element|
            if code_element.is_a?(List) && level != 0
              if level.positive?
                acc + code_element.code_flatten(level - 1).raw
              else
                acc + code_element.code_flatten(level).raw
              end
            else
              acc + [code_element]
            end
          end
        )
      end

      def code_pop(n = nil)
        code_n = n.to_code
        n = code_n.raw

        code_n.nothing? ? raw.dup.pop || Nothing.new : List.new(raw.dup.pop(n))
      end

      def code_pop!(n = nil)
        code_n = n.to_code
        n = code_n.raw

        code_n.nothing? ? raw.pop || Nothing.new : List.new(raw.pop(n))
      end

      def code_shift(n = nil)
        code_n = n.to_code
        n = code_n.raw

        code_n.nothing? ? raw.shift || Nothing.new : List.new(raw.shift(n))
      end

      def code_include?(other)
        code_other = other.to_code

        Boolean.new(raw.include?(code_other))
      end

      def code_last
        raw.last || Nothing.new
      end

      def code_map(argument = nil, **globals)
        code_argument = argument.to_code

        List.new(
          raw.map.with_index do |code_element, index|
            if code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
            elsif code_argument.is_a?(Class)
              code_argument.raw.new(code_element)
            else
              Nothing.new
            end
          rescue Error::Next => e
            e.code_value
          end
        )
      end

      def code_map!(argument = nil, **globals)
        code_argument = argument.to_code

        raw.map!.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            )
          elsif code_argument.is_a?(Class)
            code_argument.raw.new(code_element)
          else
            Nothing.new
          end
        rescue Error::Next => e
          e.code_value
        end

        self
      end

      def code_max(argument = nil, **globals)
        code_argument = argument.to_code

        raw.max_by.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          else
            code_element
          end
        rescue Error::Next => e
          e.code_value
        end || Nothing.new
      end

      def code_none?(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        Boolean.new(
          raw.none? do |code_element|
            if code_argument.is_a?(Function)
              code_argument
                .call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw).tap { index += 1 }
            else
              true.tap { index += 1 }
            end
          rescue Error::Next => e
            e.code_value.truthy?.tap { index += 1 }
          end
        )
      end

      def code_all?(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        Boolean.new(
          raw.all? do |code_element|
            if code_argument.is_a?(Function)
              code_argument
                .call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw).tap { index += 1 }
            else
              true.tap { index += 1 }
            end
          rescue Error::Next => e
            e.code_value.truthy?.tap { index += 1 }
          end
        )
      end

      def code_reduce(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        raw.reduce do |code_acc, code_element|
          if code_argument.is_a?(Function)
            code_argument
              .call(
                arguments:
                  List.new([code_acc, code_element, Integer.new(index), self]),
                **globals
              )
              .tap { index += 1 }
          else
            code_acc.tap { index += 1 }
          end
        rescue Error::Next => e
          e.code_value.tap { index += 1 }
        end || Nothing.new
      end

      def code_reverse
        List.new(raw.reverse)
      end

      def code_compact(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        List.new(
          raw.select do |code_element|
            if code_argument.is_a?(Function)
              code_argument
                .call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw).tap { index += 1 }
            else
              code_element.truthy?.tap { index += 1 }
            end
          rescue Error::Next => e
            e.code_value.truhty?.tap { index += 1 }
          end
        )
      end

      def code_compact!(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        raw.select! do |code_element|
          if code_argument.is_a?(Function)
            code_argument
              .call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
              .truthy?
              .tap { index += 1 }
          elsif code_argument.is_a?(Class)
            code_element.is_a?(code_argument.raw).tap { index += 1 }
          else
            code_element.truthy?.tap { index += 1 }
          end
        rescue Error::Next => e
          e.code_value.truhty?.tap { index += 1 }
        end

        self
      end

      def code_select(argument = nil, **globals)
        code_argument = argument.to_code

        List.new(
          raw.select.with_index do |code_element, index|
            if code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              ).truthy?
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw)
            else
              false
            end
          rescue Error::Next => e
            e.code_value.truthy?
          end
        )
      end

      def code_select!(argument = nil, **globals)
        code_argument = argument.to_code

        raw.select!.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          elsif code_argument.is_a?(Class)
            code_element.is_a?(code_argument.raw)
          else
            false
          end
        rescue Error::Next => e
          e.code_value.truthy?
        end

        self
      end

      def code_reject(argument = nil, **globals)
        code_argument = argument.to_code

        List.new(
          raw.reject.with_index do |code_element, index|
            if code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              ).truthy?
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw)
            else
              false
            end
          rescue Error::Next => e
            e.code_value.truthy?
          end
        )
      end

      def code_reject!(argument = nil, **globals)
        code_argument = argument.to_code

        raw.reject!.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          elsif code_argument.is_a?(Class)
            code_element.is_a?(code_argument.raw)
          else
            false
          end
        rescue Error::Next => e
          e.code_value.truthy?
        end

        self
      end

      def code_join(separator = nil)
        code_separator = separator.to_s.to_code

        String.new(raw.join(code_separator.raw))
      end

      def code_sort(argument = nil, **globals)
        code_argument = argument.to_code

        List.new(
          raw.sort_by.with_index do |code_element, index|
            if code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
            else
              code_element
            end
          rescue Error::Next => e
            e.code_value
          end
        )
      end

      def code_size
        Integer.new(raw.size)
      end

      def code_uniq
        List.new(raw.uniq)
      end

      def code_sum
        raw.inject(&:code_plus) || Nothing.new
      end

      def code_deep_duplicate
        List.new(raw.dup.map(&:code_deep_duplicate))
      end

      def code_get(argument)
        code_argument = argument.to_code

        raw[code_argument.raw] || Nothing.new
      end

      def code_set(key, value)
        code_key = key.to_code.code_to_integer
        code_value = value.to_code
        raw[code_key.raw] = code_value
        code_value
      end

      def code_fetch(key)
        code_key = key.to_code.code_to_integer

        raw.fetch(code_key.raw, Nothing.new)
      end

      def any?
        code_any?.truthy?
      end
    end
  end
end
