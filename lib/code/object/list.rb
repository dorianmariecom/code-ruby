# frozen_string_literal: true

class Code
  class Object
    class List < Object
      def initialize(*args, **_kargs, &)
        @raw =
          if args.first.is_a?(List)
            args.first.raw.map(&:to_code)
          elsif args.first.is_an?(::Array)
            args.first.map(&:to_code)
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
          sig(args)
          code_sort
        when "<<", "append"
          sig(args) { Object }
          code_append(code_value)
        when "any?"
          sig(args) { Function.maybe }
          code_any?(code_value, **globals)
        when "detect"
          sig(args) { Function }
          code_detect(code_value, **globals)
        when "each"
          sig(args) { Function }
          code_each(code_value, **globals)
        when "first"
          sig(args) { Integer.maybe }
          code_first(code_value)
        when "sample"
          sig(args) { Integer.maybe }
          code_sample(code_value)
        when "flatten"
          sig(args) { Integer.maybe }
          code_flatten
        when "include?"
          sig(args) { Object }
          code_include?(code_value)
        when "last"
          sig(args)
          code_last
        when "map"
          sig(args) { Function }
          code_map(code_value, **globals)
        when "map!"
          sig(args) { Function }
          code_map!(code_value, **globals)
        when "max"
          sig(args)
          code_max
        when "max_by"
          sig(args) { Function }
          code_max_by(code_value, **globals)
        when "none?"
          sig(args) { Function.maybe }
          code_none?(code_value, **globals)
        when "reduce"
          sig(args) { Function }
          code_reduce(code_value, **globals)
        when "reverse"
          sig(args)
          code_reverse
        when "select"
          sig(args) { Function }
          code_select(code_value, **globals)
        when "select!"
          sig(args) { Function }
          code_select!(code_value, **globals)
        when "compact"
          sig(args) { Function.maybe }
          code_compact(code_value, **globals)
        when "compact!"
          sig(args) { Function.maybe }
          code_compact!(code_value, **globals)
        when "reject"
          sig(args) { Function }
          code_reject(code_value, **globals)
        when "reject!"
          sig(args) { Function }
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
        else
          super
        end
      end

      def code_any?(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        Boolean.new(
          raw.any? do |code_element|
            if code_argument.nothing?
              true.tap { index += 1 }
            else
              code_argument
                .call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
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

      def code_detect(argument, **globals)
        code_argument = argument.to_code

        raw.detect.with_index do |code_element, index|
          code_argument.call(
            arguments: List.new([code_element, Integer.new(index), self]),
            **globals
          ).truthy?
        rescue Error::Next => e
          e.code_value
        end || Nothing.new
      end

      def code_each(argument, **globals)
        code_argument = argument.to_code

        raw.each.with_index do |code_element, index|
          code_argument.call(
            arguments: List.new([code_element, Integer.new(index), self]),
            **globals
          )
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

      def code_include?(other)
        code_other = other.to_code

        Boolean.new(raw.include?(code_other))
      end

      def code_last
        raw.last || Nothing.new
      end

      def code_map(argument, **globals)
        code_argument = argument.to_code

        List.new(
          raw.map.with_index do |code_element, index|
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            )
          rescue Error::Next => e
            e.code_value
          end
        )
      end

      def code_map!(argument, **globals)
        code_argument = argument.to_code

        raw.map!.with_index do |code_element, index|
          code_argument.call(
            arguments: List.new([code_element, Integer.new(index), self]),
            **globals
          )
        rescue Error::Next => e
          e.code_value
        end

        self
      end

      def code_max
        raw.max || Nothing.new
      end

      def code_max_by(argument, **globals)
        code_argument = argument.to_code

        raw.max_by.with_index do |code_element, index|
          code_argument.call(
            arguments: List.new([code_element, Integer.new(index), self]),
            **globals
          )
        rescue Error::Next => e
          e.code_value
        end || Nothing.new
      end

      def code_none?(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        Boolean.new(
          raw.none? do |code_element|
            if code_argument.nothing?
              code_element.truthy?.tap { index += 1 }
            else
              code_argument
                .call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
            end
          rescue Error::Next => e
            e.code_value.truthy?.tap { index += 1 }
          end
        )
      end

      def code_reduce(argument, **globals)
        code_argument = argument.to_code

        raw.reduce.with_index do |code_acc, code_element, index|
          code_argument.call(
            arguments:
              List.new([code_acc, code_element, Integer.new(index), self]),
            **globals
          )
        rescue Error::Next => e
          e.code_value
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
            if code_argument.nothing?
              code_element.truthy?.tap { index += 1 }
            else
              code_argument
                .call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
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
          if code_argument.nothing?
            code_element.truthy?.tap { index += 1 }
          else
            code_argument
              .call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
              .truthy?
              .tap { index += 1 }
          end
        rescue Error::Next => e
          e.code_value.truhty?.tap { index += 1 }
        end

        self
      end

      def code_select(argument, **globals)
        code_argument = argument.to_code

        List.new(
          raw.select.with_index do |code_element, index|
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          rescue Error::Next => e
            e.code_value.truthy?
          end
        )
      end

      def code_select!(argument, **globals)
        code_argument = argument.to_code

        raw.select!.with_index do |code_element, index|
          code_argument.call(
            arguments: List.new([code_element, Integer.new(index), self]),
            **globals
          ).truthy?
        rescue Error::Next => e
          e.code_value.truthy?
        end

        self
      end

      def code_reject(argument, **globals)
        code_argument = argument.to_code

        List.new(
          raw.reject.with_index do |code_element, index|
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          rescue Error::Next => e
            e.code_value.truthy?
          end
        )
      end

      def code_reject!(argument, **globals)
        code_argument = argument.to_code

        raw.reject!.with_index do |code_element, index|
          code_argument.call(
            arguments: List.new([code_element, Integer.new(index), self]),
            **globals
          ).truthy?
        rescue Error::Next => e
          e.code_value.truthy?
        end

        self
      end

      def code_join(separator = nil)
        code_separator = separator.to_s.to_code

        String.new(raw.join(code_separator.raw))
      end

      def code_sort
        List.new(raw.sort)
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

        raw[code_argument] || Nothing.new
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
