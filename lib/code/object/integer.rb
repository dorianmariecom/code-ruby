# frozen_string_literal: true

class Code
  class Object
    class Integer < Object
      def initialize(*args, **_kargs, &_block)
        @raw =
          if args.first.class.in?(NUMBER_CLASSES)
            if args.second.class.in?(NUMBER_CLASSES)
              (args.first.to_s.to_d * (10**args.second.to_s.to_d)).to_i
            else
              args.first.to_s.to_i
            end
          else
            0
          end
      rescue FloatDomainError
        @raw = 0
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        globals = multi_fetch(args, *GLOBALS)
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "%", "modulo"
          sig(args) { Integer | Decimal }
          code_modulo(code_value)
        when "&", "bitwise_and"
          sig(args) { Integer | Decimal }
          code_bitwise_and(code_value)
        when "*", "multiplication", "×"
          sig(args) { Integer | Decimal | String }
          code_multiplication(code_value)
        when "**", "power"
          sig(args) { Integer | Decimal }
          code_power(code_value)
        when "+", "plus", "self"
          sig(args) { Object.maybe }
          code_arguments.any? ? code_plus(code_value) : code_self
        when "-", "minus", "unary_minus"
          sig(args) { Integer | Decimal.maybe }
          code_arguments.any? ? code_minus(code_value) : code_unary_minus
        when "/", "division", "÷"
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
        when "day", "days"
          sig(args)
          code_days
        when "decrement!"
          sig(args) { Integer.maybe }
          code_decrement!(code_value)
        when "decrement"
          sig(args) { Integer.maybe }
          code_decrement(code_value)
        when "eight?"
          sig(args)
          code_eight?
        when "even?"
          sig(args)
          code_even?
        when "five?"
          sig(args)
          code_five?
        when "floor"
          sig(args) { Integer.maybe }
          code_floor(code_value)
        when "four?"
          sig(args)
          code_four?
        when "hour", "hours"
          sig(args)
          code_hours
        when "increment!"
          sig(args) { Integer.maybe }
          code_increment!(code_value)
        when "increment"
          sig(args) { Integer.maybe }
          code_increment(code_value)
        when "nine?"
          sig(args)
          code_nine?
        when "odd?"
          sig(args)
          code_odd?
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
        when "times"
          sig(args) { Function }
          code_times(code_value, **globals)
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
        Integer.new(raw & code_other.raw.to_i)
      end

      def code_bitwise_or(other)
        code_other = other.to_code
        Integer.new(raw | code_other.raw.to_i)
      end

      def code_bitwise_xor(other)
        code_other = other.to_code
        Integer.new(raw ^ code_other.raw.to_i)
      end

      def code_ceil(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?
        Integer.new(raw.ceil(code_n.raw))
      end

      def code_clone
        Integer.new(raw)
      end

      def code_compare(other)
        code_other = other.to_code
        Integer.new(raw <=> code_other.raw)
      end

      def code_decrement!(n = nil)
        code_n = n.to_code
        code_n = Integer.new(1) if code_n.nothing?
        @raw -= code_n.raw
        self
      end

      def code_decrement(n = nil)
        code_n = n.to_code
        code_n = Integer.new(1) if code_n.nothing?
        Integer.new(raw - code_n.raw)
      end

      def code_division(other)
        code_other = other.to_code
        Decimal.new(BigDecimal(raw) / code_other.raw)
      end

      def code_eight?
        Boolean.new(raw.eight?)
      end

      def code_even?
        Boolean.new(raw.even?)
      end

      def code_five?
        Boolean.new(raw.five?)
      end

      def code_floor(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?
        Integer.new(raw.floor(code_n.raw))
      end

      def code_four?
        Boolean.new(raw.four?)
      end

      def code_increment!(n = nil)
        code_n = n.to_code
        code_n = Integer.new(1) if code_n.nothing?
        @raw += code_n.raw
        self
      end

      def code_increment(n = nil)
        code_n = n.to_code
        code_n = Integer.new(1) if code_n.nothing?
        Integer.new(raw + code_n.raw)
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
        Integer.new(raw << code_other.raw.to_i)
      end

      def code_minus(other)
        code_other = other.to_code

        if code_other.is_a?(Integer)
          Integer.new(raw - code_other.raw)
        else
          Decimal.new(raw - code_other.raw)
        end
      end

      def code_modulo(other)
        code_other = other.to_code

        if code_other.is_a?(Integer)
          Integer.new(raw % code_other.raw)
        else
          Decimal.new(raw % code_other.raw)
        end
      end

      def code_multiplication(other)
        code_other = other.to_code

        if code_other.is_a?(Integer)
          Integer.new(raw * code_other.raw)
        elsif code_other.is_a?(Decimal)
          Decimal.new(raw * code_other.raw)
        else
          String.new(code_other.raw * raw)
        end
      end

      def code_nine?
        Boolean.new(raw.nine?)
      end

      def code_odd?
        Boolean.new(raw.odd?)
      end

      def code_one?
        Boolean.new(raw == 1)
      end

      def code_plus(other)
        code_other = other.to_code

        if code_other.is_a?(Integer)
          Integer.new(raw + code_other.raw)
        elsif code_other.is_a?(Decimal)
          Decimal.new(raw + code_other.raw)
        else
          String.new(to_s + code_other.to_s)
        end
      end

      def code_power(other)
        code_other = other.to_code

        if code_other.is_a?(Integer)
          Integer.new(raw**other.raw)
        else
          Decimal.new(raw**other.raw)
        end
      end

      def code_right_shift(other)
        code_other = other.to_code
        Integer.new(raw >> code_other.raw.to_i)
      end

      def code_round(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?

        Integer.new(raw.round(code_n.raw))
      end

      def code_seven?
        Boolean.new(raw.seven?)
      end

      def code_six?
        Boolean.new(raw.six?)
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
        Boolean.new(raw.ten?)
      end

      def code_three?
        Boolean.new(raw.three?)
      end

      def code_to_decimal
        Decimal.new(raw)
      end

      def code_to_integer
        Integer.new(raw)
      end

      def code_times(argument, **globals)
        code_argument = argument.to_code

        raw.times do |element|
          code_argument.call(
            arguments: List.new([Integer.new(element), self]),
            **globals
          )
        end

        self
      end

      def code_truncate(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?

        Integer.new(raw.truncate(code_n.raw))
      end

      def code_two?
        Boolean.new(raw.two?)
      end

      def code_unary_minus
        Integer.new(-raw)
      end

      def code_zero?
        Boolean.new(raw.zero?)
      end

      def code_hours
        Duration.new(raw.hours)
      end

      def code_days
        Duration.new(raw.days)
      end
    end
  end
end
