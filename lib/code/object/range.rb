# frozen_string_literal: true

class Code
  class Object
    class Range < Object
      CLASS_DOCUMENTATION = {
        name: "Range",
        description: "represents inclusive or exclusive sequences between comparable bounds.",
        examples: [
          "1..3",
          "1...3",
          "(1..3).to_list"
        ]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "all?" => {
          name: "all?",
          description: "returns whether every item in the range matches a function.",
          examples: [
            "(1..3).all?((x) => { x > 0 })",
            "(1..3).all?((x) => { x < 4 })",
            "(1..3).all?((x) => { x < 3 })"
          ]
        },
        "any?" => {
          name: "any?",
          description: "returns whether any item in the range matches a function.",
          examples: [
            "(1..3).any?((x) => { x == 2 })",
            "(1..3).any?((x) => { x == 1 })",
            "(1..3).any?((x) => { x > 3 })"
          ]
        },
        "none?" => {
          name: "none?",
          description: "returns whether no items in the range match a function.",
          examples: [
            "(1..3).none?((x) => { x > 3 })",
            "(1..3).none?((x) => { x == 2 })",
            "(1..3).none?((x) => { x < 0 })"
          ]
        },
        "each" => {
          name: "each",
          description: "calls a function for each item in the range and returns the range.",
          examples: [
            "(1..3).each((x) => { x })",
            "(:a..:c).each((x) => { x })",
            "(1...3).each((x) => { x })"
          ]
        },
        "reverse_each" => {
          name: "reverse_each",
          description: "calls a function for each item in the range in reverse order.",
          examples: [
            "(1..3).reverse_each((x) => { x })",
            "(:a..:c).reverse_each((x) => { x })",
            "(1...3).reverse_each((x) => { x })"
          ]
        },
        "include?" => {
          name: "include?",
          description: "returns whether the range includes a value.",
          examples: [
            "(1..3).include?(2)",
            "(1..3).include?(4)",
            "(:a..:c).include?(:b)"
          ]
        },
        "member?" => {
          name: "member?",
          description: "returns whether the range includes a value.",
          examples: [
            "(1..3).member?(2)",
            "(1..3).member?(4)",
            "(:a..:c).member?(:b)"
          ]
        },
        "cover?" => {
          name: "cover?",
          description: "returns whether a value is between the range bounds.",
          examples: [
            "(1..3).cover?(2)",
            "(1..3).cover?(4)",
            "(:a..:c).cover?(:b)"
          ]
        },
        "overlap?" => {
          name: "overlap?",
          description: "returns whether the range overlaps another range.",
          examples: [
            "(1..3).overlap?(2..4)",
            "(1..3).overlap?(4..6)",
            "(:a..:c).overlap?(:b..:d)"
          ]
        },
        "empty?" => {
          name: "empty?",
          description: "returns whether the range is empty.",
          examples: [
            "(1..3).empty?",
            "(1...1).empty?",
            "(:a..:c).empty?"
          ]
        },
        "begin" => {
          name: "begin",
          description: "returns the starting bound of the range.",
          examples: [
            "(1..3).begin",
            "(:a..:c).begin",
            "(1...3).begin"
          ]
        },
        "end" => {
          name: "end",
          description: "returns the ending bound of the range.",
          examples: [
            "(1..3).end",
            "(:a..:c).end",
            "(1...3).end"
          ]
        },
        "exclude_end?" => {
          name: "exclude_end?",
          description: "returns whether the range excludes its ending bound.",
          examples: [
            "(1..3).exclude_end?",
            "(1...3).exclude_end?",
            "(:a...:c).exclude_end?"
          ]
        },
        "first" => {
          name: "first",
          description: "returns the first item in the range.",
          examples: [
            "(1..3).first",
            "(2..4).first",
            "(:a..:c).first"
          ]
        },
        "last" => {
          name: "last",
          description: "returns the last item in the range.",
          examples: [
            "(1..3).last",
            "(2..4).last",
            "(:a..:c).last"
          ]
        },
        "minimum" => {
          name: "minimum",
          description: "returns the minimum item in the range.",
          examples: [
            "(1..3).minimum",
            "(:a..:c).minimum",
            "(3..1).minimum"
          ]
        },
        "maximum" => {
          name: "maximum",
          description: "returns the maximum item in the range.",
          examples: [
            "(1..3).maximum",
            "(:a..:c).maximum",
            "(3..1).maximum"
          ]
        },
        "minimum_maximum" => {
          name: "minimum_maximum",
          description: "returns the minimum and maximum items as a list.",
          examples: [
            "(1..3).minimum_maximum",
            "(:a..:c).minimum_maximum",
            "(3..1).minimum_maximum"
          ]
        },
        "map" => {
          name: "map",
          description: "returns a list with each item transformed by a function.",
          examples: [
            "(1..3).map((x) => { x + 1 })",
            "(1..3).map((x) => { x.to_string })",
            "(:a..:c).map((x) => { x.to_string })"
          ]
        },
        "select" => {
          name: "select",
          description: "returns a list of items matched by a function.",
          examples: [
            "(1..3).select((x) => { x > 1 })",
            "(1..3).select((x) => { x < 3 })",
            "(:a..:c).select((x) => { x > :a })"
          ]
        },
        "reject" => {
          name: "reject",
          description: "returns a list of items not matched by a function.",
          examples: [
            "(1..3).reject((x) => { x > 1 })",
            "(1..3).reject((x) => { x < 3 })",
            "(:a..:c).reject((x) => { x > :a })"
          ]
        },
        "reduce" => {
          name: "reduce",
          description: "combines items in the range with a function.",
          examples: [
            "(1..3).reduce((sum, x) => { sum + x })",
            "(1..3).reduce((product, x) => { product * x })",
            "(2..4).reduce((sum, x) => { sum + x })"
          ]
        },
        "step" => {
          name: "step",
          description: "returns a list of items separated by a step size.",
          examples: [
            "(1..5).step(2)",
            "(1..5).step(1)",
            "(1...5).step(2)"
          ]
        },
        "binary_search" => {
          name: "binary_search",
          description: "returns the first item matched by binary search.",
          examples: [
            "(1..10).binary_search((x) => { x >= 5 })",
            "(1..10).binary_search((x) => { x > 10 })",
            "(1..3).binary_search((x) => { x >= 2 })"
          ]
        },
        "sample" => {
          name: "sample",
          description: "returns a random item from the range.",
          examples: [
            "(1..3).sample",
            "(2..4).sample",
            "(:a..:c).sample"
          ]
        },
        "size" => {
          name: "size",
          description: "returns the number of items in the range.",
          examples: [
            "(1..3).size",
            "(1...3).size",
            "(:a..:c).size"
          ]
        },
        "count" => {
          name: "count",
          description: "returns the number of items, optionally matched by a function.",
          examples: [
            "(1..3).count",
            "(1...3).count",
            "(1..5).count((x) => { x.even? })"
          ]
        },
        "to_list" => {
          name: "to_list",
          description: "returns the range items as a list.",
          examples: [
            "(1..3).to_list",
            "(1...3).to_list",
            "(:a..:c).to_list"
          ]
        },
        "entries" => {
          name: "entries",
          description: "returns the range items as a list.",
          examples: [
            "(1..3).entries",
            "(1...3).entries",
            "(:a..:c).entries"
          ]
        },
        "to_dictionary" => {
          name: "to_dictionary",
          description: "returns a dictionary built from indexed range items.",
          examples: [
            "(1..3).to_dictionary",
            "(1...3).to_dictionary",
            "(:a..:c).to_dictionary"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

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
        when "none?"
          sig(args) { Function }
          code_none?(code_value, **globals)
        when "each"
          sig(args) { Function }
          code_each(code_value, **globals)
        when "reverse_each"
          sig(args) { Function }
          code_reverse_each(code_value, **globals)
        when "include?"
          sig(args) { Object }
          code_include?(code_value)
        when "member?"
          sig(args) { Object }
          code_member?(code_value)
        when "cover?"
          sig(args) { Object }
          code_cover?(code_value)
        when "overlap?"
          sig(args) { Range }
          code_overlap?(code_value)
        when "empty?"
          sig(args)
          code_empty?
        when "begin"
          sig(args)
          code_begin
        when "end"
          sig(args)
          code_end
        when "exclude_end?"
          sig(args)
          code_exclude_end?
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
        when "minimum_maximum"
          sig(args)
          code_minimum_maximum
        when "map"
          sig(args) { Function }
          code_map(code_value, **globals)
        when "select"
          sig(args) { Function }
          code_select(code_value, **globals)
        when "reject"
          sig(args) { Function }
          code_reject(code_value, **globals)
        when "reduce"
          sig(args) { Function }
          code_reduce(code_value, **globals)
        when "step"
          sig(args) { [(Integer | Decimal).maybe, Function.maybe] }
          code_step(*code_arguments.raw, **globals)
        when "binary_search"
          sig(args) { Function }
          code_binary_search(code_value, **globals)
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
        when "entries"
          sig(args)
          code_entries
        when "to_dictionary"
          sig(args)
          code_to_dictionary
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

      def code_none?(argument, **globals)
        code_argument = argument.to_code

        index = 0

        Boolean.new(
          raw.none? do |code_element|
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

      def code_reverse_each(argument, **globals)
        code_argument = argument.to_code

        raw.reverse_each.with_index do |code_element, index|
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

      def code_member?(value)
        code_include?(value)
      end

      def code_cover?(value)
        code_value = value.to_code
        Boolean.new(raw.cover?(code_value))
      end

      def code_overlap?(range)
        code_range = range.to_code

        Boolean.new(raw.overlap?(code_range.raw))
      end

      def code_empty?
        Boolean.new(raw.to_a.empty?)
      end

      def code_begin
        code_left
      end

      def code_end
        code_right
      end

      def code_exclude_end?
        Boolean.new(exclude_end?)
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

      def code_minimum_maximum
        List.new([code_minimum, code_maximum])
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
      rescue Error::Break => e
        e.code_value
      end

      def code_reduce(argument, **globals)
        code_argument = argument.to_code

        index = 0

        raw.reduce do |code_acc, code_element|
          code_argument
            .call(
              arguments:
                List.new([code_acc, code_element, Integer.new(index), self]),
              **globals
            )
            .tap { index += 1 }
        rescue Error::Next => e
          e.code_value.tap { index += 1 }
        end || Nothing.new
      rescue Error::Break => e
        e.code_value
      end

      def exclude_end?
        code_exclude_end.truthy?
      end

      def code_binary_search(argument, **globals)
        code_argument = argument.to_code
        values = raw.to_a
        lower = 0
        upper = values.length - 1
        result = nil

        while lower <= upper
          index = (lower + upper) / 2
          code_element = values[index]
          matched =
            begin
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              ).truthy?
            rescue Error::Next => e
              e.code_value.truthy?
            end

          if matched
            result = code_element
            upper = index - 1
          else
            lower = index + 1
          end
        end

        result || Nothing.new
      rescue Error::Break => e
        e.code_value
      end

      def code_step(argument = nil, function = nil, **globals)
        code_argument = argument.to_code
        code_function = function.to_code

        if code_argument.is_a?(Function)
          code_function = code_argument
          code_argument = Integer.new(1)
        elsif code_argument.nothing?
          code_argument = Integer.new(1)
        end

        code_list = List.new
        code_element = code_left
        index = 0
        step_is_positive = code_argument.code_greater(Integer.new(0)).truthy?

        loop do
          comparison =
            if step_is_positive
              exclude_end? ? code_element.code_less(code_right) : code_element.code_less_or_equal(code_right)
            else
              exclude_end? ? code_element.code_greater(code_right) : code_element.code_greater_or_equal(code_right)
            end

          break unless comparison.truthy?

          if code_function.is_a?(Function)
            code_function.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            )
          else
            code_list.code_append(code_element)
          end

          index += 1
          code_element = code_element.code_plus(code_argument)
        end

        code_function.is_a?(Function) ? self : code_list
      rescue Error::Break => e
        e.code_value
      end

      def code_to_list
        List.new(raw.to_a)
      end

      def code_entries
        code_to_list
      end

      def code_to_dictionary
        code_to_list.code_to_dictionary
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
