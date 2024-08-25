# frozen_string_literal: true

class Code
  class Object
    class Decimal < Object
      def initialize(*args, **_kargs, &)
        decimal = args.first || "0"
        exponent = args.second || "0"
        decimal = decimal.raw if decimal.is_an?(Object)
        exponent = exponent.raw if exponent.is_an?(Object)
        @raw = decimal.to_d * (10**exponent.to_d)
      rescue FloatDomainError
        raise Error, "#{decimal.inspect} * 10**#{exponent.inspect} is invalid"
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, List.new)
        value = arguments.code_first

        case operator.to_s
        when "%", "modulo"
          sig(args) { Integer | Decimal }
          code_modulo(value)
        when "&", "bitwise_and"
          sig(args) { Integer | Decimal }
          code_bitwise_and(value)
        when "*", "multiplication"
          sig(args) { Integer | Decimal }
          code_multiplication(value)
        when "**", "power"
          sig(args) { Integer | Decimal }
          code_power(value)
        when "+", "plus"
          sig(args) { Object.maybe }
          arguments.any? ? code_plus(value) : self
        when "-", "minus"
          sig(args) { (Integer | Decimal).maybe }
          arguments.any? ? code_minus(value) : code_unary_minus
        when "/", "division"
          sig(args) { Integer | Decimal }
          code_division(value)
        when "<", "inferior"
          sig(args) { Integer | Decimal }
          code_inferior(value)
        when "<<", "left_shift"
          sig(args) { Integer | Decimal }
          code_left_shift(value)
        when "<=", "inferior_or_equal"
          sig(args) { Integer | Decimal }
          code_inferior_or_equal(value)
        when "<=>", "compare"
          sig(args) { Integer | Decimal }
          code_compare(value)
        when ">", "superior"
          sig(args) { Integer | Decimal }
          code_superior(value)
        when ">=", "superior_or_equal"
          sig(args) { Integer | Decimal }
          code_superior_or_equal(value)
        when ">>", "right_shift"
          sig(args) { Integer | Decimal }
          code_right_shift(value)
        when "^", "bitwise_xor"
          sig(args) { Integer | Decimal }
          code_bitwise_xor(value)
        when "abs"
          sig(args)
          code_abs
        when "ceil"
          sig(args) { Integer.maybe }
          code_ceil(value)
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
          code_floor(value)
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
          code_round(value)
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
          code_truncate(value)
        when "two?"
          sig(args)
          code_two?
        when "zero?"
          sig(args)
          code_zero?
        when "|", "bitwise_or"
          sig(args) { Integer | Decimal }
          code_bitwise_or(value)
        else
          super
        end
      end

      def code_abs
        Decimal.new(raw.abs)
      end

      def code_bitwise_and(other)
        Integer.new(raw.to_i & other.raw.to_i)
      end

      def code_bitwise_or(other)
        Integer.new(raw.to_i | other.raw.to_i)
      end

      def code_bitwise_xor(other)
        Integer.new(raw.to_i ^ other.raw.to_i)
      end

      def code_ceil(n = nil)
        n = Integer.new(0) if n.nil? || n.is_a?(Nothing)
        Decimal.new(raw.ceil(n.raw))
      end

      def code_clone
        Decimal.new(raw)
      end

      def code_compare(other)
        Integer.new(raw <=> other.raw)
      end

      def code_division(other)
        Decimal.new(raw / other.raw)
      end

      def code_eight?
        Boolean.new(raw == 8)
      end

      def code_five?
        Boolean.new(raw == 5)
      end

      def code_floor(n = nil)
        n = Integer.new(0) if n.nil? || n.is_a?(Nothing)
        Decimal.new(raw.floor(n.raw))
      end

      def code_four?
        Boolean.new(raw == 4)
      end

      def code_inferior(other)
        Boolean.new(raw < other.raw)
      end

      def code_inferior_or_equal(other)
        Boolean.new(raw <= other.raw)
      end

      def code_left_shift(other)
        Integer.new(raw.to_i << other.raw.to_i)
      end

      def code_minus(other)
        Decimal.new(raw - other.raw)
      end

      def code_modulo(other)
        Decimal.new(raw % other.raw)
      end

      def code_multiplication(other)
        Decimal.new(raw * other.raw)
      end

      def code_nine?
        Boolean.new(raw == 9)
      end

      def code_one?
        Boolean.new(raw == 1)
      end

      def code_plus(other)
        if other.is_an?(Integer) || other.is_a?(Decimal)
          Decimal.new(raw + other.raw)
        else
          String.new(to_s + other.to_s)
        end
      end

      def code_power(other)
        Decimal.new(raw**other.raw)
      end

      def code_right_shift(other)
        Integer.new(raw.to_i >> other.raw.to_i)
      end

      def code_round(n = nil)
        n = Integer.new(0) if n.nil? || n.is_a?(Nothing)
        Decimal.new(raw.round(n.raw))
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
        Boolean.new(raw > other.raw)
      end

      def code_superior_or_equal(other)
        Boolean.new(raw >= other.raw)
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
        n = Integer.new(0) if n.nil? || n.is_a?(Nothing)
        Decimal.new(raw.truncate(n.raw))
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
