# frozen_string_literal: true

class Code
  class Object
    class Range < Object
      attr_reader :code_left, :code_right, :code_options, :code_exclude_end

      def initialize(*args, **kargs, &)
        if args.first.is_a?(Range)
          @code_left = args.first.code_left
          @code_right = args.first.code_right
          @code_options = args.first.code_options
          @code_exclude_end = args.first.code_exclude_end
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

        @raw = ::Range.new(code_left, code_right, exclude_end?)
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
        when "first"
          sig(args)
          code_first
        when "last"
          sig(args)
          code_last
        when "map"
          sig(args) { Function }
          code_map(code_value, **globals)
        when "select"
          sig(args) { Function }
          code_select(code_value, **globals)
        when "step"
          sig(args) { Integer | Decimal }
          code_step(code_value)
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
          end
        )
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
          end
        )
      end

      def code_each(argument, **globals)
        code_argument = argument.to_code

        raw.each.with_index do |code_element, index|
          code_argument.call(
            arguments: List.new([code_element, Integer.new(index), self]),
            **globals
          )
        end

        self
      end

      def code_first
        raw.first || Nothing.new
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
          end
        )
      end

      def code_select(argument, **globals)
        code_argument = argument.to_code

        List.new(
          raw.select.with_index do |code_element, index|
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          end
        )
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
          while code_element.code_inferior(code_right).truthy?
            code_list.code_append(code_element)
            code_element = code_element.code_plus(code_argument)
          end
        else
          while code_element.code_inferior_or_equal(code_right).truthy?
            code_list.code_append(code_element)
            code_element = code_element.code_plus(code_argument)
          end
        end

        code_list
      end

      def code_to_list
        List.new(raw.to_a)
      end
    end
  end
end
