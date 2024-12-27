# frozen_string_literal: true

class Code
  class Object
    class Boolean < ::Code::Object
      def initialize(*args, **_kargs, &)
        if args.first.is_an?(Object)
          @raw = args.first.truthy?
        else
          @raw = !!args.first
        end
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "&", "bitwise_and"
          sig(args) { Boolean }
          code_bitwise_and(code_value)
        when "^", "bitwise_xor"
          sig(args) { Boolean }
          code_bitwise_xor(code_value)
        when "|", "bitwise_or"
          sig(args) { Boolean }
          code_bitwise_or(code_value)
        else
          super
        end
      end

      def code_bitwise_and(other)
        code_other = other.to_code

        Boolean.new(raw & code_other.raw)
      end

      def code_bitwise_or(other)
        code_other = other.to_code

        Boolean.new(raw | code_other.raw)
      end

      def code_bitwise_xor(other)
        code_other = other.to_code

        Boolean.new(raw ^ code_other.raw)
      end

      def truthy?
        raw
      end
    end
  end
end
