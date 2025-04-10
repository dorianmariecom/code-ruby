# frozen_string_literal: true

class Code
  class Object
    class Decimal < Object
      def initialize(*args, **_kargs, &_block)
        @raw =
          if args.first.class.in?(NUMBER_CLASSES)
            if args.second.class.in?(NUMBER_CLASSES)
              args.first.to_s.to_d * (10**args.second.to_s.to_d)
            else
              args.first.to_s.to_d
            end
          else
            0.to_d
          end
      rescue FloatDomainError
        @raw = 0.to_d
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "%", "modulo"
          sig(args) { Integer | Decimal }
          code_modulo(code_value)
        when "&", "bitwise_and"
          sig(args) { Integer | Decimal }
          code_bitwise_and(code_value)
        when "*", "multiplication"
          sig(args) { Integer | Decimal }
          code_multiplication(code_value)
        when "**", "power"
          sig(args) { Integer | Decimal }
          code_power(code_value)
        when "+", "plus"
          sig(args) { Object.maybe }
          code_arguments.any? ? code_plus(code_value) : self
        when "-", "minus"
          sig(args) { (Integer | Decimal).maybe }
          code_arguments.any? ? code_minus(code_value) : code_unary_minus
        when "/", "division"
          sig(args) { Integer | Decimal }
          code_division(code_value)
        when "<", "inferior"
          sig(args) { Integer | Decimal }
          code_inferior(code_value)
        when "<<", "left_shift"
          sig(args) { Integer | Decimal }
          code_left_shift(code_value)
        when "<=", "inferior_or_equal"
          sig(args) { Integer | Decimal }
          code_inferior_or_equal(code_value)
        when "<=>", "compare"
          sig(args) { Integer | Decimal }
          code_compare(code_value)
        when ">", "superior"
          sig(args) { Integer | Decimal }
          code_superior(code_value)
        when ">=", "superior_or_equal"
          sig(args) { Integer | Decimal }
          code_superior_or_equal(code_value)
        when ">>", "right_shift"
          sig(args) { Integer | Decimal }
          code_right_shift(code_value)
        when "^", "bitwise_xor"
          sig(args) { Integer | Decimal }
          code_bitwise_xor(code_value)
        when "abs"
          sig(args)
          code_abs
        when "ceil"
          sig(args) { Integer.maybe }
          code_ceil(code_value)
        when "clone"
          sig(args)
          code_clone
        when "eight?"
          sig(args)
          code_eight?
        when "five?"
          sig(args)
          code_five?
        when "floor"
          sig(args) { Integer.maybe }
          code_floor(code_value)
        when "four?"
          sig(args)
          code_four?
        when "nine?"
          sig(args)
          code_nine?
        when "one?"
          sig(args)
          code_one?
        when "round"
          sig(args) { Integer.maybe }
          code_round(code_value)
        when "seven?"
          sig(args)
          code_seven?
        when "six?"
          sig(args)
          code_six?
        when "sqrt"
          sig(args)
          code_sqrt
        when "ten?"
          sig(args)
          code_ten?
        when "three?"
          sig(args)
          code_three?
        when "to_decimal"
          sig(args)
          code_to_decimal
        when "to_integer"
          sig(args)
          code_to_integer
        when "to_string"
          sig(args)
          code_to_string
        when "truncate"
          sig(args) { Integer.maybe }
          code_truncate(code_value)
        when "two?"
          sig(args)
          code_two?
        when "zero?"
          sig(args)
          code_zero?
        when "|", "bitwise_or"
          sig(args) { Integer | Decimal }
          code_bitwise_or(code_value)
        else
          super
        end
      end

      def code_abs
        Decimal.new(raw.abs)
      end

      def code_bitwise_and(other)
        code_other = other.to_code

        Integer.new(raw.to_i & code_other.raw.to_i)
      end

      def code_bitwise_or(other)
        code_other = other.to_code

        Integer.new(raw.to_i | code_other.raw.to_i)
      end

      def code_bitwise_xor(other)
        code_other = other.to_code

        Integer.new(raw.to_i ^ code_other.raw.to_i)
      end

      def code_ceil(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?

        Decimal.new(raw.ceil(code_n.raw))
      end

      def code_clone
        Decimal.new(raw)
      end

      def code_compare(other)
        code_other = other.to_code

        Integer.new(raw <=> code_other.raw)
      end

      def code_division(other)
        code_other = other.to_code

        Decimal.new(raw / code_other.raw)
      end

      def code_eight?
        Boolean.new(raw == 8)
      end

      def code_five?
        Boolean.new(raw == 5)
      end

      def code_floor(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?

        Decimal.new(raw.floor(code_n.raw))
      end

      def code_four?
        Boolean.new(raw == 4)
      end

      def code_inferior(other)
        code_other = other.to_code

        Boolean.new(raw < code_other.raw)
      end

      def code_inferior_or_equal(other)
        code_other = other.to_code

        Boolean.new(raw <= code_other.raw)
      end

      def code_left_shift(other)
        code_other = other.to_code

        Integer.new(raw.to_i << code_other.raw.to_i)
      end

      def code_minus(other)
        code_other = other.to_code

        Decimal.new(raw - code_other.raw)
      end

      def code_modulo(other)
        code_other = other.to_code

        Decimal.new(raw % code_other.raw)
      end

      def code_multiplication(other)
        code_other = other.to_code

        Decimal.new(raw * code_other.raw)
      end

      def code_nine?
        Boolean.new(raw == 9)
      end

      def code_one?
        Boolean.new(raw == 1)
      end

      def code_plus(other)
        code_other = other.to_code

        if code_other.is_an?(Integer) || other.is_a?(Decimal)
          Decimal.new(raw + code_other.raw)
        else
          String.new(to_s + code_other.to_s)
        end
      end

      def code_power(other)
        code_other = other.to_code

        Decimal.new(raw**code_other.raw)
      end

      def code_right_shift(other)
        code_other = other.to_code

        Integer.new(raw.to_i >> code_other.raw.to_i)
      end

      def code_round(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?

        Decimal.new(raw.round(code_n.raw))
      end

      def code_seven?
        Boolean.new(raw == 7)
      end

      def code_six?
        Boolean.new(raw == 6)
      end

      def code_sqrt
        Decimal.new(Math.sqrt(raw).to_s)
      end

      def code_superior(other)
        code_other = other.to_code

        Boolean.new(raw > code_other.raw)
      end

      def code_superior_or_equal(other)
        code_other = other.to_code

        Boolean.new(raw >= code_other.raw)
      end

      def code_ten?
        Boolean.new(raw == 10)
      end

      def code_three?
        Boolean.new(raw == 3)
      end

      def code_to_decimal
        Decimal.new(raw)
      end

      def code_to_integer
        Integer.new(raw.to_i)
      end

      def code_to_string
        String.new(raw.to_s("F"))
      end

      def code_truncate(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?

        Decimal.new(raw.truncate(code_n.raw))
      end

      def code_two?
        Boolean.new(raw == 2)
      end

      def code_unary_minus
        Decimal.new(-raw)
      end

      def code_zero?
        Boolean.new(raw.zero?)
      end
    end
  end
end
