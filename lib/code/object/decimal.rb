# frozen_string_literal: true

class Code
  class Object
    class Decimal < Number
      def initialize(*args, **_kargs, &_block)
        self.raw =
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
        self.raw = 0.to_d
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
        when "floor"
          sig(args) { Integer.maybe }
          code_floor(code_value)
        when "round"
          sig(args) { Integer.maybe }
          code_round(code_value)
        when "sqrt"
          sig(args)
          code_sqrt
        when "truncate"
          sig(args) { Integer.maybe }
          code_truncate(code_value)
        when "|", "bitwise_or"
          sig(args) { Integer | Decimal }
          code_bitwise_or(code_value)
        when "many?"
          sig(args)
          code_many?
        when "any?"
          sig(args)
          code_any?
        when "positive?"
          sig(args)
          code_positive?
        when "negative?"
          sig(args)
          code_negative?
        when "zero?"
          sig(args)
          code_zero?
        when "one?"
          sig(args)
          code_one?
        when "two?"
          sig(args)
          code_two?
        when "three?"
          sig(args)
          code_three?
        when "four?"
          sig(args)
          code_four?
        when "five?"
          sig(args)
          code_five?
        when "six?"
          sig(args)
          code_six?
        when "seven?"
          sig(args)
          code_seven?
        when "eight?"
          sig(args)
          code_eight?
        when "nine?"
          sig(args)
          code_nine?
        when "ten?"
          sig(args)
          code_ten?
        when "eleven?"
          sig(args)
          code_eleven?
        when "twelve?"
          sig(args)
          code_twelve?
        when "thirteen?"
          sig(args)
          code_thirteen?
        when "fourteen?"
          sig(args)
          code_fourteen?
        when "fifteen?"
          sig(args)
          code_fifteen?
        when "sixteen?"
          sig(args)
          code_sixteen?
        when "seventeen?"
          sig(args)
          code_seventeen?
        when "eighteen?"
          sig(args)
          code_eighteen?
        when "nineteen?"
          sig(args)
          code_nineteen?
        when "twenty?"
          sig(args)
          code_twenty?
        when "twenty_one?"
          sig(args)
          code_twenty_one?
        when "twenty_two?"
          sig(args)
          code_twenty_two?
        when "twenty_three?"
          sig(args)
          code_twenty_three?
        when "twenty_four?"
          sig(args)
          code_twenty_four?
        when "twenty_five?"
          sig(args)
          code_twenty_five?
        when "twenty_six?"
          sig(args)
          code_twenty_six?
        when "twenty_seven?"
          sig(args)
          code_twenty_seven?
        when "twenty_eight?"
          sig(args)
          code_twenty_eight?
        when "twenty_nine?"
          sig(args)
          code_twenty_nine?
        when "thirty?"
          sig(args)
          code_thirty?
        when "thirty_one?"
          sig(args)
          code_thirty_one?
        when "thirty_two?"
          sig(args)
          code_thirty_two?
        when "thirty_three?"
          sig(args)
          code_thirty_three?
        when "thirty_four?"
          sig(args)
          code_thirty_four?
        when "thirty_five?"
          sig(args)
          code_thirty_five?
        when "thirty_six?"
          sig(args)
          code_thirty_six?
        when "thirty_seven?"
          sig(args)
          code_thirty_seven?
        when "thirty_eight?"
          sig(args)
          code_thirty_eight?
        when "thirty_nine?"
          sig(args)
          code_thirty_nine?
        when "forty?"
          sig(args)
          code_forty?
        when "forty_one?"
          sig(args)
          code_forty_one?
        when "forty_two?"
          sig(args)
          code_forty_two?
        when "forty_three?"
          sig(args)
          code_forty_three?
        when "forty_four?"
          sig(args)
          code_forty_four?
        when "forty_five?"
          sig(args)
          code_forty_five?
        when "forty_six?"
          sig(args)
          code_forty_six?
        when "forty_seven?"
          sig(args)
          code_forty_seven?
        when "forty_eight?"
          sig(args)
          code_forty_eight?
        when "forty_nine?"
          sig(args)
          code_forty_nine?
        when "fifty?"
          sig(args)
          code_fifty?
        when "fifty_one?"
          sig(args)
          code_fifty_one?
        when "fifty_two?"
          sig(args)
          code_fifty_two?
        when "fifty_three?"
          sig(args)
          code_fifty_three?
        when "fifty_four?"
          sig(args)
          code_fifty_four?
        when "fifty_five?"
          sig(args)
          code_fifty_five?
        when "fifty_six?"
          sig(args)
          code_fifty_six?
        when "fifty_seven?"
          sig(args)
          code_fifty_seven?
        when "fifty_eight?"
          sig(args)
          code_fifty_eight?
        when "fifty_nine?"
          sig(args)
          code_fifty_nine?
        when "sixty?"
          sig(args)
          code_sixty?
        when "sixty_one?"
          sig(args)
          code_sixty_one?
        when "sixty_two?"
          sig(args)
          code_sixty_two?
        when "sixty_three?"
          sig(args)
          code_sixty_three?
        when "sixty_four?"
          sig(args)
          code_sixty_four?
        when "sixty_five?"
          sig(args)
          code_sixty_five?
        when "sixty_six?"
          sig(args)
          code_sixty_six?
        when "sixty_seven?"
          sig(args)
          code_sixty_seven?
        when "sixty_eight?"
          sig(args)
          code_sixty_eight?
        when "sixty_nine?"
          sig(args)
          code_sixty_nine?
        when "seventy?"
          sig(args)
          code_seventy?
        when "seventy_one?"
          sig(args)
          code_seventy_one?
        when "seventy_two?"
          sig(args)
          code_seventy_two?
        when "seventy_three?"
          sig(args)
          code_seventy_three?
        when "seventy_four?"
          sig(args)
          code_seventy_four?
        when "seventy_five?"
          sig(args)
          code_seventy_five?
        when "seventy_six?"
          sig(args)
          code_seventy_six?
        when "seventy_seven?"
          sig(args)
          code_seventy_seven?
        when "seventy_eight?"
          sig(args)
          code_seventy_eight?
        when "seventy_nine?"
          sig(args)
          code_seventy_nine?
        when "eighty?"
          sig(args)
          code_eighty?
        when "eighty_one?"
          sig(args)
          code_eighty_one?
        when "eighty_two?"
          sig(args)
          code_eighty_two?
        when "eighty_three?"
          sig(args)
          code_eighty_three?
        when "eighty_four?"
          sig(args)
          code_eighty_four?
        when "eighty_five?"
          sig(args)
          code_eighty_five?
        when "eighty_six?"
          sig(args)
          code_eighty_six?
        when "eighty_seven?"
          sig(args)
          code_eighty_seven?
        when "eighty_eight?"
          sig(args)
          code_eighty_eight?
        when "eighty_nine?"
          sig(args)
          code_eighty_nine?
        when "ninety?"
          sig(args)
          code_ninety?
        when "ninety_one?"
          sig(args)
          code_ninety_one?
        when "ninety_two?"
          sig(args)
          code_ninety_two?
        when "ninety_three?"
          sig(args)
          code_ninety_three?
        when "ninety_four?"
          sig(args)
          code_ninety_four?
        when "ninety_five?"
          sig(args)
          code_ninety_five?
        when "ninety_six?"
          sig(args)
          code_ninety_six?
        when "ninety_seven?"
          sig(args)
          code_ninety_seven?
        when "ninety_eight?"
          sig(args)
          code_ninety_eight?
        when "ninety_nine?"
          sig(args)
          code_ninety_nine?
        when "one_hundred?"
          sig(args)
          code_one_hundred?
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

      def code_compare(other)
        code_other = other.to_code

        Integer.new(raw <=> code_other.raw)
      end

      def code_division(other)
        code_other = other.to_code

        Decimal.new(raw / code_other.raw)
      end

      def code_floor(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?

        Decimal.new(raw.floor(code_n.raw))
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

      def code_to_string
        String.new(raw.to_s("F"))
      end

      def code_truncate(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?

        Decimal.new(raw.truncate(code_n.raw))
      end

      def code_unary_minus
        Decimal.new(-raw)
      end

      def code_many?
        Boolean.new(raw > 1)
      end

      def code_any?
        Boolean.new(raw.positive?)
      end

      def code_positive?
        Boolean.new(raw.positive?)
      end

      def code_negative?
        Boolean.new(raw.negative?)
      end

      def code_zero?
        Boolean.new(raw.zero?)
      end

      def code_one?
        Boolean.new(raw == 1)
      end

      def code_two?
        Boolean.new(raw == 2)
      end

      def code_three?
        Boolean.new(raw == 3)
      end

      def code_four?
        Boolean.new(raw == 4)
      end

      def code_five?
        Boolean.new(raw == 5)
      end

      def code_six?
        Boolean.new(raw == 6)
      end

      def code_seven?
        Boolean.new(raw == 7)
      end

      def code_eight?
        Boolean.new(raw == 8)
      end

      def code_nine?
        Boolean.new(raw == 9)
      end

      def code_ten?
        Boolean.new(raw == 10)
      end

      def code_eleven?
        Boolean.new(raw == 11)
      end

      def code_twelve?
        Boolean.new(raw == 12)
      end

      def code_thirteen?
        Boolean.new(raw == 13)
      end

      def code_fourteen?
        Boolean.new(raw == 14)
      end

      def code_fifteen?
        Boolean.new(raw == 15)
      end

      def code_sixteen?
        Boolean.new(raw == 16)
      end

      def code_seventeen?
        Boolean.new(raw == 17)
      end

      def code_eighteen?
        Boolean.new(raw == 18)
      end

      def code_nineteen?
        Boolean.new(raw == 19)
      end

      def code_twenty?
        Boolean.new(raw == 20)
      end

      def code_twenty_one?
        Boolean.new(raw == 21)
      end

      def code_twenty_two?
        Boolean.new(raw == 22)
      end

      def code_twenty_three?
        Boolean.new(raw == 23)
      end

      def code_twenty_four?
        Boolean.new(raw == 24)
      end

      def code_twenty_five?
        Boolean.new(raw == 25)
      end

      def code_twenty_six?
        Boolean.new(raw == 26)
      end

      def code_twenty_seven?
        Boolean.new(raw == 27)
      end

      def code_twenty_eight?
        Boolean.new(raw == 28)
      end

      def code_twenty_nine?
        Boolean.new(raw == 29)
      end

      def code_thirty?
        Boolean.new(raw == 30)
      end

      def code_thirty_one?
        Boolean.new(raw == 31)
      end

      def code_thirty_two?
        Boolean.new(raw == 32)
      end

      def code_thirty_three?
        Boolean.new(raw == 33)
      end

      def code_thirty_four?
        Boolean.new(raw == 34)
      end

      def code_thirty_five?
        Boolean.new(raw == 35)
      end

      def code_thirty_six?
        Boolean.new(raw == 36)
      end

      def code_thirty_seven?
        Boolean.new(raw == 37)
      end

      def code_thirty_eight?
        Boolean.new(raw == 38)
      end

      def code_thirty_nine?
        Boolean.new(raw == 39)
      end

      def code_forty?
        Boolean.new(raw == 40)
      end

      def code_forty_one?
        Boolean.new(raw == 41)
      end

      def code_forty_two?
        Boolean.new(raw == 42)
      end

      def code_forty_three?
        Boolean.new(raw == 43)
      end

      def code_forty_four?
        Boolean.new(raw == 44)
      end

      def code_forty_five?
        Boolean.new(raw == 45)
      end

      def code_forty_six?
        Boolean.new(raw == 46)
      end

      def code_forty_seven?
        Boolean.new(raw == 47)
      end

      def code_forty_eight?
        Boolean.new(raw == 48)
      end

      def code_forty_nine?
        Boolean.new(raw == 49)
      end

      def code_fifty?
        Boolean.new(raw == 50)
      end

      def code_fifty_one?
        Boolean.new(raw == 51)
      end

      def code_fifty_two?
        Boolean.new(raw == 52)
      end

      def code_fifty_three?
        Boolean.new(raw == 53)
      end

      def code_fifty_four?
        Boolean.new(raw == 54)
      end

      def code_fifty_five?
        Boolean.new(raw == 55)
      end

      def code_fifty_six?
        Boolean.new(raw == 56)
      end

      def code_fifty_seven?
        Boolean.new(raw == 57)
      end

      def code_fifty_eight?
        Boolean.new(raw == 58)
      end

      def code_fifty_nine?
        Boolean.new(raw == 59)
      end

      def code_sixty?
        Boolean.new(raw == 60)
      end

      def code_sixty_one?
        Boolean.new(raw == 61)
      end

      def code_sixty_two?
        Boolean.new(raw == 62)
      end

      def code_sixty_three?
        Boolean.new(raw == 63)
      end

      def code_sixty_four?
        Boolean.new(raw == 64)
      end

      def code_sixty_five?
        Boolean.new(raw == 65)
      end

      def code_sixty_six?
        Boolean.new(raw == 66)
      end

      def code_sixty_seven?
        Boolean.new(raw == 67)
      end

      def code_sixty_eight?
        Boolean.new(raw == 68)
      end

      def code_sixty_nine?
        Boolean.new(raw == 69)
      end

      def code_seventy?
        Boolean.new(raw == 70)
      end

      def code_seventy_one?
        Boolean.new(raw == 71)
      end

      def code_seventy_two?
        Boolean.new(raw == 72)
      end

      def code_seventy_three?
        Boolean.new(raw == 73)
      end

      def code_seventy_four?
        Boolean.new(raw == 74)
      end

      def code_seventy_five?
        Boolean.new(raw == 75)
      end

      def code_seventy_six?
        Boolean.new(raw == 76)
      end

      def code_seventy_seven?
        Boolean.new(raw == 77)
      end

      def code_seventy_eight?
        Boolean.new(raw == 78)
      end

      def code_seventy_nine?
        Boolean.new(raw == 79)
      end

      def code_eighty?
        Boolean.new(raw == 80)
      end

      def code_eighty_one?
        Boolean.new(raw == 81)
      end

      def code_eighty_two?
        Boolean.new(raw == 82)
      end

      def code_eighty_three?
        Boolean.new(raw == 83)
      end

      def code_eighty_four?
        Boolean.new(raw == 84)
      end

      def code_eighty_five?
        Boolean.new(raw == 85)
      end

      def code_eighty_six?
        Boolean.new(raw == 86)
      end

      def code_eighty_seven?
        Boolean.new(raw == 87)
      end

      def code_eighty_eight?
        Boolean.new(raw == 88)
      end

      def code_eighty_nine?
        Boolean.new(raw == 89)
      end

      def code_ninety?
        Boolean.new(raw == 90)
      end

      def code_ninety_one?
        Boolean.new(raw == 91)
      end

      def code_ninety_two?
        Boolean.new(raw == 92)
      end

      def code_ninety_three?
        Boolean.new(raw == 93)
      end

      def code_ninety_four?
        Boolean.new(raw == 94)
      end

      def code_ninety_five?
        Boolean.new(raw == 95)
      end

      def code_ninety_six?
        Boolean.new(raw == 96)
      end

      def code_ninety_seven?
        Boolean.new(raw == 97)
      end

      def code_ninety_eight?
        Boolean.new(raw == 98)
      end

      def code_ninety_nine?
        Boolean.new(raw == 99)
      end

      def code_one_hundred?
        Boolean.new(raw == 100)
      end
    end
  end
end
