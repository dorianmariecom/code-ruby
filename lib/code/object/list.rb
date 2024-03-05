# frozen_string_literal: true

class Code
  class Object
    class List < Object
      def initialize(*args, **_kargs, &_block)
        raw = args.first || Nothing.new
        raw = raw.raw if raw.is_an?(Object)
        @raw = raw.to_a
        super
      end

      def self.name
        "List"
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, [])
        globals = multi_fetch(args, *GLOBALS)
        value = arguments.first&.value

        case operator.to_s
        when "sort"
          sig(args)
          code_sort
        when "<<", "append"
          sig(args) { Object }
          code_append(value)
        when "any?"
          sig(args) { Function }
          code_any?(value, **globals)
        when "detect"
          sig(args) { Function }
          code_detect(value, **globals)
        when "each"
          sig(args) { Function }
          code_each(value, **globals)
        when "first"
          sig(args)
          code_first
        when "flatten"
          sig(args) { Integer.maybe }
          code_flatten
        when "include?"
          sig(args) { Object }
          code_include?(value)
        when "last"
          sig(args)
          code_last
        when "map"
          sig(args) { Function }
          code_map(value, **globals)
        when "max"
          sig(args)
          code_max
        when "max_by"
          sig(args) { Function }
          code_max_by(value, **globals)
        when "none?"
          sig(args) { Function }
          code_none?(value, **globals)
        when "reduce"
          sig(args) { Function }
          code_reduce(value, **globals)
        when "reverse"
          sig(args)
          code_reverse
        when "select"
          sig(args) { Function }
          code_select(value, **globals)
        when "select!"
          sig(args) { Function }
          code_select!(value, **globals)
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

      def code_any?(argument, **globals)
        Boolean.new(
          raw.any? do |element|
            argument.call(arguments: [Argument.new(element)], **globals).truthy?
          rescue Error::Next => e
            e.value || Nothing.new
          end
        )
      end

      def code_append(other)
        raw << other
        self
      end

      def code_detect(argument, **globals)
        raw.detect do |element|
          argument.call(arguments: [Argument.new(element)], **globals).truthy?
        rescue Error::Next => e
          e.value || Nothing.new
        end || Nothing.new
      end

      def code_each(argument, **globals)
        raw.each do |element|
          argument.call(arguments: [Argument.new(element)], **globals)
        rescue Error::Next => e
          e.value || Nothing.new
        end
        self
      end

      def code_first
        raw.first || Nothing.new
      end

      def code_flatten(level = nil)
        level ||= Integer.new(-1)
        level = level.raw if level.is_a?(Integer)

        List.new(
          raw.reduce([]) do |acc, element|
            element = element.to_list if element.is_a?(Dictionary)

            if element.is_a?(List) && level != 0
              if level.positive?
                acc + element.code_flatten(level - 1).raw
              else
                acc + element.code_flatten(level).raw
              end
            else
              acc + [element]
            end
          end
        )
      end

      def code_include?(other)
        Boolean.new(raw.include?(other))
      end

      def code_last
        raw.last || Nothing.new
      end

      def code_map(argument, **globals)
        List.new(
          raw.map do |element|
            argument.call(arguments: [Argument.new(element)], **globals)
          rescue Error::Next => e
            e.value || Nothing.new
          end
        )
      end

      def code_max
        raw.max || Nothing.new
      end

      def code_max_by(argument, **globals)
        raw.max_by do |element|
          argument.call(arguments: [Argument.new(element)], **globals)
        rescue Error::Next => e
          e.value || Nothing.new
        end || Nothing.new
      end

      def code_none?(argument, **globals)
        Boolean.new(
          raw.none? do |element|
            argument.call(arguments: [Argument.new(element)], **globals).truthy?
          rescue Error::Next => e
            (e.value || Nothing.new).truthy?
          end
        )
      end

      def code_reduce(argument, **globals)
        raw.reduce do |acc, element|
          argument.call(
            arguments: [Argument.new(acc), Argument.new(element)],
            **globals
          )
        rescue Error::Next => e
          e.value || Nothing.new
        end || Nothing.new
      end

      def code_reverse
        List.new(raw.reverse)
      end

      def code_select(argument, **globals)
        List.new(
          raw.select do |element|
            argument.call(arguments: [Argument.new(element)], **globals).truthy?
          rescue Error::Next => e
            (e.value || Nothing.new).truthy?
          end
        )
      end

      def code_select!(argument, **globals)
        raw.select! do |element|
          argument.call(arguments: [Argument.new(element)], **globals).truthy?
        rescue Error::Next => e
          p e.value
          (e.value || Nothing.new).truthy?
        end

        self
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

      def inspect
        to_s
      end

      def to_s
        "[#{raw.map(&:inspect).join(", ")}]"
      end

      def as_json(...)
        raw.as_json(...)
      end
    end
  end
end
