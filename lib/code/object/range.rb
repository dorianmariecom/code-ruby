# frozen_string_literal: true

class Code
  class Object
    class Range < Object
      attr_reader :code_left, :code_right, :code_options, :code_exclude_end

      def initialize(*args, **kargs, &_block)
        if args.first.is_a?(Range)
          @code_left = args.first.code_left
          @code_right = args.first.code_right
          @code_options = args.first.code_options
          @code_exclude_end = args.first.code_exclude_end
        elsif args.first.is_a?(List)
          @code_left = args.first.code_first
          @code_right = args.first.code_last
          @code_options = Dictionary.new(args.second.presence || kargs)
          @code_exclude_end = Boolean.new(code_options.code_get(:exclude_end))
        else
          @code_left =
            (args.first.to_code.nothing? ? Integer.new(0) : args.first.to_code)

          @code_right =
            if args.second.to_code.nothing?
              Integer.new(0)
            else
              args.second.to_code
            end

          @code_options = Dictionary.new(args.third.presence || kargs)
          @code_exclude_end = Boolean.new(code_options.code_get(:exclude_end))
        end

        self.raw = ::Range.new(code_left, code_right, exclude_end?)
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        globals = multi_fetch(args, *GLOBALS)
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "all?"
          sig(args) { Function }
          code_all?(code_value, **globals)
        when "any?"
          sig(args) { Function }
          code_any?(code_value, **globals)
        when "each"
          sig(args) { Function }
          code_each(code_value, **globals)
        when "include?"
          sig(args) { Object }
          code_include?(code_value)
        when "cover?"
          sig(args) { Object }
          code_cover?(code_value)
        when "empty?"
          sig(args)
          code_empty?
        when "first"
          sig(args)
          code_first
        when "last"
          sig(args)
          code_last
        when "minimum"
          sig(args)
          code_minimum
        when "maximum"
          sig(args)
          code_maximum
        when "map"
          sig(args) { Function }
          code_map(code_value, **globals)
        when "select"
          sig(args) { Function }
          code_select(code_value, **globals)
        when "step"
          sig(args) { Integer | Decimal }
          code_step(code_value)
        when "sample"
          sig(args)
          code_sample
        when "size"
          sig(args)
          code_size
        when "count"
          sig(args) { Function.maybe }
          code_count(code_value, **globals)
        when "to_list"
          sig(args)
          code_to_list
        else
          super
        end
      end

      def code_all?(argument, **globals)
        code_argument = argument.to_code

        index = 0

        Boolean.new(
          raw.all? do |code_element|
            code_argument
              .call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
              .truthy?
              .tap { index += 1 }
          rescue Error::Next => e
            e.code_value.truthy?.tap { index += 1 }
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_any?(argument, **globals)
        code_argument = argument.to_code

        index = 0

        Boolean.new(
          raw.any? do |code_element|
            code_argument
              .call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
              .truthy?
              .tap { index += 1 }
          rescue Error::Next => e
            e.code_value.truthy?.tap { index += 1 }
          end
        )
      rescue Error::Break => e
        e.code_value
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
      rescue Error::Break => e
        e.code_value
      end

      def code_include?(value)
        code_value = value.to_code
        Boolean.new(raw.include?(code_value))
      end

      def code_cover?(value)
        code_value = value.to_code
        Boolean.new(raw.cover?(code_value))
      end

      def code_empty?
        Boolean.new(raw.to_a.empty?)
      end

      def code_first
        raw.first || Nothing.new
      end

      def code_last
        raw.last || Nothing.new
      end

      def code_minimum
        raw.min || Nothing.new
      end

      def code_maximum
        raw.max || Nothing.new
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
      rescue Error::Break => e
        e.code_value
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
      rescue Error::Break => e
        e.code_value
      end

      def exclude_end?
        code_exclude_end.truthy?
      end

      def code_step(argument)
        code_argument = argument.to_code

        code_list = List.new
        code_element = code_left
        code_list.code_append(code_element)

        code_element = code_element.code_plus(code_argument)

        if exclude_end?
          while code_element.code_less(code_right).truthy?
            code_list.code_append(code_element)
            code_element = code_element.code_plus(code_argument)
          end
        else
          while code_element.code_less_or_equal(code_right).truthy?
            code_list.code_append(code_element)
            code_element = code_element.code_plus(code_argument)
          end
        end

        code_list
      end

      def code_to_list
        List.new(raw.to_a)
      end

      def code_sample
        code_to_list.code_sample
      end

      def code_size
        Integer.new(raw.to_a.size)
      end

      def code_count(argument = nil, **globals)
        code_argument = argument.to_code

        if code_argument.nothing?
          return Integer.new(raw.to_a.size)
        end

        index = 0
        Integer.new(
          raw.count do |code_element|
            code_argument
              .call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
              .truthy?
              .tap { index += 1 }
          rescue Error::Next => e
            e.code_value.truthy?.tap { index += 1 }
          end
        )
      rescue Error::Break => e
        e.code_value
      end
    end
  end
end
