# frozen_string_literal: true

class Code
  class Object
    class Range < Object
      attr_reader :raw, :exclude_end, :left, :right

      def initialize(left, right, exclude_end: false)
        @left = left
        @right = right
        @exclude_end = !exclude_end.nil?
        @raw = ::Range.new(left, right, exclude_end)
      end

      def self.name
        "Range"
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, [])
        globals = multi_fetch(args, *GLOBALS)
        value = arguments.first&.value

        case operator.to_s
        when "all?"
          sig(args) { Function }
          code_all?(value, **globals)
        when "any?"
          sig(args) { Function }
          code_any?(value, **globals)
        when "each"
          sig(args) { Function }
          code_each(value, **globals)
        when "first"
          sig(args)
          code_first
        when "last"
          sig(args)
          code_last
        when "map"
          sig(args) { Function }
          code_map(value, **globals)
        when "select"
          sig(args) { Function }
          code_select(value, **globals)
        when "step"
          sig(args) { Number }
          code_step(value)
        when "to_list"
          sig(args)
          code_to_list
        else
          super
        end
      end

      def code_all?(argument, **globals)
        Boolean.new(
          raw.all? do |element|
            argument.call(arguments: [Argument.new(element)], **globals).truthy?
          end
        )
      end

      def code_any?(argument, **globals)
        Boolean.new(
          raw.any? do |element|
            argument.call(arguments: [Argument.new(element)], **globals).truthy?
          end
        )
      end

      def code_each(argument, **globals)
        raw.each do |element|
          argument.call(arguments: [Argument.new(element)], **globals)
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
        List.new(
          raw.map do |element|
            argument.call(arguments: [Argument.new(element)], **globals)
          end
        )
      end

      def code_select(argument, **globals)
        List.new(
          raw.select do |element|
            argument.call(arguments: [Argument.new(element)], **globals).truthy?
          end
        )
      end

      def code_step(argument)
        list = List.new
        element = left
        list.code_append(element)

        element = element.code_plus(argument)
        if exclude_end?
          while element.code_inferior(right).truthy?
            list.code_append(element)
            element = element.code_plus(argument)
          end
        else
          while element.code_inferior_or_equal(right).truthy?
            list.code_append(element)
            element = element.code_plus(argument)
          end
        end

        list
      end

      def code_to_list
        List.new(raw.to_a)
      end

      def exclude_end?
        !!exclude_end
      end

      def inspect
        to_s
      end

      def to_s
        raw.to_s
      end

      def as_json(...)
        raw.as_json(...)
      end
    end
  end
end
