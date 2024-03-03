# frozen_string_literal: true

class Code
  class Object
    class Boolean < ::Code::Object
      def initialize(*args, **_kargs, &_block)
        raw = args.first || Nothing.new
        @raw = (raw.is_a?(Object) ? raw.truthy? : !!raw)
        super
      end

      def self.name
        "Boolean"
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, [])
        value = arguments.first&.value

        case operator.to_s
        when "&", "bitwise_and"
          sig(args) { Boolean }
          code_bitwise_and(value)
        when "^", "bitwise_xor"
          sig(args) { Boolean }
          code_bitwise_xor(value)
        when "|", "bitwise_or"
          sig(args) { Boolean }
          code_bitwise_or(value)
        else
          super
        end
      end

      def code_bitwise_and(value)
        Boolean.new(raw & value.raw)
      end

      def code_bitwise_or(value)
        Boolean.new(raw | value.raw)
      end

      def code_bitwise_xor(value)
        Boolean.new(raw ^ value.raw)
      end

      def inspect
        to_s
      end

      def succ
        Boolean.new(!raw)
      end

      def to_s
        raw.to_s
      end

      def truthy?
        raw
      end

      def as_json(...)
        raw.as_json(...)
      end
    end
  end
end
