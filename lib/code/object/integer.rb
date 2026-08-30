# frozen_string_literal: true

class Code
  class Object
    class Integer < Number
      CLASS_DOCUMENTATION = {
        name: "Integer",
        description:
          "represents whole numbers with arithmetic, bitwise operations, iteration, duration helpers, and numeric predicates.",
        examples: ["Integer.new(1)", "12.digits", "3.times((i) => { i })"]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "%" => {
          name: "%",
          description: "returns the integer modulo another number.",
          examples: ["5 % 2", "4 % 2", "7 % 3"]
        },
        "modulo" => {
          name: "modulo",
          description: "returns the integer modulo another number.",
          examples: %w[5.modulo(2) 4.modulo(2) 7.modulo(3)]
        },
        "&" => {
          name: "&",
          description:
            "returns the bitwise and of the integer and another number.",
          examples: ["5 & 3", "4 & 1", "7 & 2"]
        },
        "bitwise_and" => {
          name: "bitwise_and",
          description:
            "returns the bitwise and of the integer and another number.",
          examples: %w[5.bitwise_and(3) 4.bitwise_and(1) 7.bitwise_and(2)]
        },
        "*" => {
          name: "*",
          description: "multiplies numbers or repeats text by the integer.",
          examples: ["2 * 3", "2 * 3.5", "3 * :ha"]
        },
        "multiplication" => {
          name: "multiplication",
          description: "multiplies numbers or repeats text by the integer.",
          examples: %w[
            2.multiplication(3)
            2.multiplication(3.5)
            3.multiplication(:ha)
          ]
        },
        "×" => {
          name: "×",
          description: "multiplies numbers or repeats text by the integer.",
          examples: ["2 × 3", "2 × 3.5", "3 × :ha"]
        },
        "**" => {
          name: "**",
          description: "returns the integer raised to a power.",
          examples: ["2 ** 3", "4 ** 2", "9 ** 0.5"]
        },
        "power" => {
          name: "power",
          description: "returns the integer raised to a power.",
          examples: %w[2.power(3) 4.power(2) 9.power(0.5)]
        },
        "power_modulo" => {
          name: "power_modulo",
          description: "returns modular exponentiation.",
          examples: [
            "2.power_modulo(3, 5)",
            "3.power_modulo(2, 7)",
            "10.power_modulo(2, 6)"
          ]
        },
        "+" => {
          name: "+",
          description:
            "returns the integer itself when unary, adds numbers, or joins other values as text.",
          examples: ["1 + 2", "1 + 2.5", "+1"]
        },
        "plus" => {
          name: "plus",
          description: "adds numbers or joins non-numeric values as text.",
          examples: %w[1.plus(2) 1.plus(2.5) 1.plus(:x)]
        },
        "-" => {
          name: "-",
          description:
            "returns the integer negated when unary or minus another number.",
          examples: ["5 - 1", "5 - 2.5", "-5"]
        },
        "minus" => {
          name: "minus",
          description: "returns the integer minus another number.",
          examples: %w[5.minus(1) 5.minus(2.5) 1.minus(3)]
        },
        "unary_minus" => {
          name: "unary_minus",
          description: "returns the negated integer.",
          examples: %w[5.unary_minus 0.unary_minus -5.unary_minus]
        },
        "/" => {
          name: "/",
          description:
            "returns the integer divided by another number as a decimal.",
          examples: ["5 / 2", "4 / 2", "7 / 3"]
        },
        "division" => {
          name: "division",
          description:
            "returns the integer divided by another number as a decimal.",
          examples: %w[5.division(2) 4.division(2) 7.division(3)]
        },
        "÷" => {
          name: "÷",
          description:
            "returns the integer divided by another number as a decimal.",
          examples: ["5 ÷ 2", "4 ÷ 2", "7 ÷ 3"]
        },
        "decimal_divide" => {
          name: "decimal_divide",
          description:
            "returns the integer divided by another number as a decimal.",
          examples: %w[
            5.decimal_divide(2)
            4.decimal_divide(2)
            7.decimal_divide(3)
          ]
        },
        "digits" => {
          name: "digits",
          description:
            "returns the integer digits in reverse order, optionally for a base.",
          examples: %w[123.digits 123.digits(10) 10.digits(2)]
        },
        "bit_length" => {
          name: "bit_length",
          description:
            "returns the number of bits needed to represent the integer.",
          examples: %w[5.bit_length 0.bit_length 255.bit_length]
        },
        "all_bits?" => {
          name: "all_bits?",
          description: "returns whether every bit in a mask is set.",
          examples: %w[7.all_bits?(3) 4.all_bits?(3) 0.all_bits?(1)]
        },
        "any_bits?" => {
          name: "any_bits?",
          description: "returns whether any bit in a mask is set.",
          examples: %w[5.any_bits?(1) 4.any_bits?(1) 0.any_bits?(1)]
        },
        "no_bits?" => {
          name: "no_bits?",
          description: "returns whether no bits in a mask are set.",
          examples: %w[4.no_bits?(1) 5.no_bits?(1) 0.no_bits?(1)]
        },
        "character" => {
          name: "character",
          description: "returns the character for the integer codepoint.",
          examples: %w[65.character 97.character 48.character]
        },
        "greatest_common_denominator" => {
          name: "greatest_common_denominator",
          description:
            "returns the greatest common divisor with another integer.",
          examples: %w[
            12.greatest_common_denominator(8)
            21.greatest_common_denominator(14)
            5.greatest_common_denominator(2)
          ]
        },
        "lowest_common_multiple" => {
          name: "lowest_common_multiple",
          description:
            "returns the least common multiple with another integer.",
          examples: %w[
            4.lowest_common_multiple(6)
            3.lowest_common_multiple(7)
            5.lowest_common_multiple(10)
          ]
        },
        "<<" => {
          name: "<<",
          description: "returns the integer shifted left by a bit count.",
          examples: ["5 << 1", "4 << 2", "1 << 3"]
        },
        "left_shift" => {
          name: "left_shift",
          description: "returns the integer shifted left by a bit count.",
          examples: %w[5.left_shift(1) 4.left_shift(2) 1.left_shift(3)]
        },
        ">>" => {
          name: ">>",
          description: "returns the integer shifted right by a bit count.",
          examples: ["5 >> 1", "4 >> 1", "8 >> 2"]
        },
        "right_shift" => {
          name: "right_shift",
          description: "returns the integer shifted right by a bit count.",
          examples: %w[5.right_shift(1) 4.right_shift(1) 8.right_shift(2)]
        },
        "^" => {
          name: "^",
          description:
            "returns the bitwise xor of the integer and another number.",
          examples: ["5 ^ 3", "4 ^ 1", "7 ^ 2"]
        },
        "bitwise_xor" => {
          name: "bitwise_xor",
          description:
            "returns the bitwise xor of the integer and another number.",
          examples: %w[5.bitwise_xor(3) 4.bitwise_xor(1) 7.bitwise_xor(2)]
        },
        "abs" => {
          name: "abs",
          description: "returns the absolute value of the integer.",
          examples: %w[-1.abs 1.abs 0.abs]
        },
        "between?" => {
          name: "between?",
          description: "returns whether the integer is between two bounds.",
          examples: ["2.between?(1, 3)", "4.between?(1, 3)", "1.between?(1, 3)"]
        },
        "clamp" => {
          name: "clamp",
          description: "returns the integer constrained between two bounds.",
          examples: ["5.clamp(1, 3)", "0.clamp(1, 3)", "2.clamp(1, 3)"]
        },
        "divide" => {
          name: "divide",
          description:
            "returns integer division of the integer by another number.",
          examples: %w[5.divide(2) 10.divide(3) 9.divide(2)]
        },
        "divide_modulo" => {
          name: "divide_modulo",
          description: "returns integer division and modulo results as a list.",
          examples: %w[
            5.divide_modulo(2)
            10.divide_modulo(3)
            9.divide_modulo(2)
          ]
        },
        "ceil" => {
          name: "ceil",
          description:
            "returns the integer rounded toward positive infinity at an optional precision.",
          examples: %w[12.ceil 123.ceil(-1) -123.ceil(-1)]
        },
        "ceil_divide" => {
          name: "ceil_divide",
          description:
            "returns division by another number rounded up to an integer.",
          examples: %w[5.ceil_divide(2) 4.ceil_divide(2) 7.ceil_divide(3)]
        },
        "day" => {
          name: "day",
          description: "returns a duration of this many days.",
          examples: %w[1.day 2.day 0.day]
        },
        "days" => {
          name: "days",
          description: "returns a duration of this many days.",
          examples: %w[1.days 2.days 0.days]
        },
        "decrement!" => {
          name: "decrement!",
          description:
            "subtracts a value from the integer in place and returns it.",
          examples: [
            "i = 2 i.decrement!",
            "i = 2 i.decrement!(2)",
            "i = 0 i.decrement!"
          ]
        },
        "decrement" => {
          name: "decrement",
          description: "returns the integer minus a value, defaulting to one.",
          examples: %w[2.decrement 2.decrement(2) 0.decrement]
        },
        "even?" => {
          name: "even?",
          description: "returns whether the integer is even.",
          examples: %w[2.even? 1.even? 0.even?]
        },
        "floor" => {
          name: "floor",
          description:
            "returns the integer rounded toward negative infinity at an optional precision.",
          examples: %w[12.floor 123.floor(-1) -123.floor(-1)]
        },
        "hour" => {
          name: "hour",
          description: "returns a duration of this many hours.",
          examples: %w[1.hour 2.hour 0.hour]
        },
        "hours" => {
          name: "hours",
          description: "returns a duration of this many hours.",
          examples: %w[1.hours 2.hours 0.hours]
        },
        "increment!" => {
          name: "increment!",
          description: "adds a value to the integer in place and returns it.",
          examples: [
            "i = 1 i.increment!",
            "i = 1 i.increment!(2)",
            "i = 0 i.increment!"
          ]
        },
        "increment" => {
          name: "increment",
          description: "returns the integer plus a value, defaulting to one.",
          examples: %w[1.increment 1.increment(2) 0.increment]
        },
        "odd?" => {
          name: "odd?",
          description: "returns whether the integer is odd.",
          examples: %w[1.odd? 2.odd? 0.odd?]
        },
        "minute" => {
          name: "minute",
          description: "returns a duration of this many minutes.",
          examples: %w[1.minute 2.minute 0.minute]
        },
        "minutes" => {
          name: "minutes",
          description: "returns a duration of this many minutes.",
          examples: %w[1.minutes 2.minutes 0.minutes]
        },
        "month" => {
          name: "month",
          description: "returns a duration of this many months.",
          examples: %w[1.month 2.month 0.month]
        },
        "months" => {
          name: "months",
          description: "returns a duration of this many months.",
          examples: %w[1.months 2.months 0.months]
        },
        "round" => {
          name: "round",
          description: "returns the integer rounded to a precision.",
          examples: %w[12.round 123.round(-1) -123.round(-1)]
        },
        "second" => {
          name: "second",
          description: "returns a duration of this many seconds.",
          examples: %w[1.second 2.second 0.second]
        },
        "seconds" => {
          name: "seconds",
          description: "returns a duration of this many seconds.",
          examples: %w[1.seconds 2.seconds 0.seconds]
        },
        "sqrt" => {
          name: "sqrt",
          description: "returns the square root of the integer.",
          examples: %w[4.sqrt 9.sqrt 2.sqrt]
        },
        "times" => {
          name: "times",
          description:
            "calls a function once for each number from zero up to the integer and returns the integer.",
          examples: [
            "3.times((i) => { i })",
            "0.times((i) => { i })",
            "2.times((i, count) => { count })"
          ]
        },
        "down_to" => {
          name: "down_to",
          description:
            "calls a function for each integer from this value down to a target and returns the integer.",
          examples: [
            "3.down_to(1, (i) => { i })",
            "3.down_to(1, (i, index) => { index })",
            "1.down_to(1, (i) => { i })"
          ]
        },
        "up_to" => {
          name: "up_to",
          description:
            "calls a function for each integer from this value up to a target and returns the integer.",
          examples: [
            "1.up_to(3, (i) => { i })",
            "1.up_to(3, (i, index) => { index })",
            "1.up_to(1, (i) => { i })"
          ]
        },
        "truncate" => {
          name: "truncate",
          description: "returns the integer truncated to a precision.",
          examples: %w[12.truncate 123.truncate(-1) -123.truncate(-1)]
        },
        "week" => {
          name: "week",
          description: "returns a duration of this many weeks.",
          examples: %w[1.week 2.week 0.week]
        },
        "weeks" => {
          name: "weeks",
          description: "returns a duration of this many weeks.",
          examples: %w[1.weeks 2.weeks 0.weeks]
        },
        "year" => {
          name: "year",
          description: "returns a duration of this many years.",
          examples: %w[1.year 2.year 0.year]
        },
        "years" => {
          name: "years",
          description: "returns a duration of this many years.",
          examples: %w[1.years 2.years 0.years]
        },
        "|" => {
          name: "|",
          description:
            "returns the bitwise or of the integer and another number.",
          examples: ["5 | 2", "4 | 1", "7 | 2"]
        },
        "bitwise_or" => {
          name: "bitwise_or",
          description:
            "returns the bitwise or of the integer and another number.",
          examples: %w[5.bitwise_or(2) 4.bitwise_or(1) 7.bitwise_or(2)]
        },
        "many?" => {
          name: "many?",
          description: "returns whether the integer is greater than one.",
          examples: %w[2.many? 1.many? 0.many?]
        },
        "any?" => {
          name: "any?",
          description: "returns whether the integer is greater than zero.",
          examples: %w[1.any? 0.any? -1.any?]
        },
        "positive?" => {
          name: "positive?",
          description: "returns whether the integer is positive.",
          examples: %w[1.positive? 0.positive? -1.positive?]
        },
        "negative?" => {
          name: "negative?",
          description: "returns whether the integer is negative.",
          examples: %w[-1.negative? 0.negative? 1.negative?]
        },
        "next" => {
          name: "next",
          description: "returns the integer plus one.",
          examples: %w[1.next 0.next -1.next]
        },
        "successor" => {
          name: "successor",
          description: "returns the integer plus one.",
          examples: %w[1.successor 0.successor -1.successor]
        },
        "previous" => {
          name: "previous",
          description: "returns the integer minus one.",
          examples: %w[1.previous 0.previous -1.previous]
        },
        "predecessor" => {
          name: "predecessor",
          description: "returns the integer minus one.",
          examples: %w[1.predecessor 0.predecessor -1.predecessor]
        },
        "remainder" => {
          name: "remainder",
          description:
            "returns the remainder after division by another number.",
          examples: %w[5.remainder(2) 10.remainder(3) 9.remainder(2)]
        },
        "non_zero?" => {
          name: "non_zero?",
          description: "returns whether the integer is not zero.",
          examples: %w[1.non_zero? 0.non_zero? -1.non_zero?]
        },
        "integer?" => {
          name: "integer?",
          description: "returns whether the value is an integer.",
          examples: %w[1.integer? 0.integer? -1.integer?]
        },
        "finite?" => {
          name: "finite?",
          description: "returns whether the integer is finite.",
          examples: %w[1.finite? 0.finite? -1.finite?]
        },
        "infinite?" => {
          name: "infinite?",
          description: "returns whether the integer is infinite.",
          examples: %w[1.infinite? 0.infinite? -1.infinite?]
        },
        "numerator" => {
          name: "numerator",
          description: "returns the integer numerator.",
          examples: %w[1.numerator 0.numerator -1.numerator]
        },
        "denominator" => {
          name: "denominator",
          description: "returns one as the integer denominator.",
          examples: %w[1.denominator 0.denominator -1.denominator]
        },
        "magnitude" => {
          name: "magnitude",
          description: "returns the absolute value of the integer.",
          examples: %w[-1.magnitude 1.magnitude 0.magnitude]
        },
        "zero?" => {
          name: "zero?",
          description: "returns whether the integer is zero.",
          examples: %w[0.zero? 1.zero? -1.zero?]
        },
        "one?" => {
          name: "one?",
          description: "returns whether the integer is one.",
          examples: %w[1.one? 2.one? 0.one?]
        },
        "two?" => {
          name: "two?",
          description: "returns whether the integer is two.",
          examples: %w[2.two? 3.two? 0.two?]
        },
        "three?" => {
          name: "three?",
          description: "returns whether the integer is three.",
          examples: %w[3.three? 4.three? 0.three?]
        },
        "four?" => {
          name: "four?",
          description: "returns whether the integer is four.",
          examples: %w[4.four? 5.four? 0.four?]
        },
        "five?" => {
          name: "five?",
          description: "returns whether the integer is five.",
          examples: %w[5.five? 6.five? 0.five?]
        },
        "six?" => {
          name: "six?",
          description: "returns whether the integer is six.",
          examples: %w[6.six? 7.six? 0.six?]
        },
        "seven?" => {
          name: "seven?",
          description: "returns whether the integer is seven.",
          examples: %w[7.seven? 8.seven? 0.seven?]
        },
        "eight?" => {
          name: "eight?",
          description: "returns whether the integer is eight.",
          examples: %w[8.eight? 9.eight? 0.eight?]
        },
        "nine?" => {
          name: "nine?",
          description: "returns whether the integer is nine.",
          examples: %w[9.nine? 10.nine? 0.nine?]
        },
        "ten?" => {
          name: "ten?",
          description: "returns whether the integer is ten.",
          examples: %w[10.ten? 11.ten? 0.ten?]
        },
        "eleven?" => {
          name: "eleven?",
          description: "returns whether the integer is eleven.",
          examples: %w[11.eleven? 12.eleven? 0.eleven?]
        },
        "twelve?" => {
          name: "twelve?",
          description: "returns whether the integer is twelve.",
          examples: %w[12.twelve? 13.twelve? 0.twelve?]
        },
        "thirteen?" => {
          name: "thirteen?",
          description: "returns whether the integer is thirteen.",
          examples: %w[13.thirteen? 14.thirteen? 0.thirteen?]
        },
        "fourteen?" => {
          name: "fourteen?",
          description: "returns whether the integer is fourteen.",
          examples: %w[14.fourteen? 15.fourteen? 0.fourteen?]
        },
        "fifteen?" => {
          name: "fifteen?",
          description: "returns whether the integer is fifteen.",
          examples: %w[15.fifteen? 16.fifteen? 0.fifteen?]
        },
        "sixteen?" => {
          name: "sixteen?",
          description: "returns whether the integer is sixteen.",
          examples: %w[16.sixteen? 17.sixteen? 0.sixteen?]
        },
        "seventeen?" => {
          name: "seventeen?",
          description: "returns whether the integer is seventeen.",
          examples: %w[17.seventeen? 18.seventeen? 0.seventeen?]
        },
        "eighteen?" => {
          name: "eighteen?",
          description: "returns whether the integer is eighteen.",
          examples: %w[18.eighteen? 19.eighteen? 0.eighteen?]
        },
        "nineteen?" => {
          name: "nineteen?",
          description: "returns whether the integer is nineteen.",
          examples: %w[19.nineteen? 20.nineteen? 0.nineteen?]
        },
        "twenty?" => {
          name: "twenty?",
          description: "returns whether the integer is twenty.",
          examples: %w[20.twenty? 21.twenty? 0.twenty?]
        },
        "twenty_one?" => {
          name: "twenty_one?",
          description: "returns whether the integer is twenty one.",
          examples: %w[21.twenty_one? 22.twenty_one? 0.twenty_one?]
        },
        "twenty_two?" => {
          name: "twenty_two?",
          description: "returns whether the integer is twenty two.",
          examples: %w[22.twenty_two? 23.twenty_two? 0.twenty_two?]
        },
        "twenty_three?" => {
          name: "twenty_three?",
          description: "returns whether the integer is twenty three.",
          examples: %w[23.twenty_three? 24.twenty_three? 0.twenty_three?]
        },
        "twenty_four?" => {
          name: "twenty_four?",
          description: "returns whether the integer is twenty four.",
          examples: %w[24.twenty_four? 25.twenty_four? 0.twenty_four?]
        },
        "twenty_five?" => {
          name: "twenty_five?",
          description: "returns whether the integer is twenty five.",
          examples: %w[25.twenty_five? 26.twenty_five? 0.twenty_five?]
        },
        "twenty_six?" => {
          name: "twenty_six?",
          description: "returns whether the integer is twenty six.",
          examples: %w[26.twenty_six? 27.twenty_six? 0.twenty_six?]
        },
        "twenty_seven?" => {
          name: "twenty_seven?",
          description: "returns whether the integer is twenty seven.",
          examples: %w[27.twenty_seven? 28.twenty_seven? 0.twenty_seven?]
        },
        "twenty_eight?" => {
          name: "twenty_eight?",
          description: "returns whether the integer is twenty eight.",
          examples: %w[28.twenty_eight? 29.twenty_eight? 0.twenty_eight?]
        },
        "twenty_nine?" => {
          name: "twenty_nine?",
          description: "returns whether the integer is twenty nine.",
          examples: %w[29.twenty_nine? 30.twenty_nine? 0.twenty_nine?]
        },
        "thirty?" => {
          name: "thirty?",
          description: "returns whether the integer is thirty.",
          examples: %w[30.thirty? 31.thirty? 0.thirty?]
        },
        "thirty_one?" => {
          name: "thirty_one?",
          description: "returns whether the integer is thirty one.",
          examples: %w[31.thirty_one? 32.thirty_one? 0.thirty_one?]
        },
        "thirty_two?" => {
          name: "thirty_two?",
          description: "returns whether the integer is thirty two.",
          examples: %w[32.thirty_two? 33.thirty_two? 0.thirty_two?]
        },
        "thirty_three?" => {
          name: "thirty_three?",
          description: "returns whether the integer is thirty three.",
          examples: %w[33.thirty_three? 34.thirty_three? 0.thirty_three?]
        },
        "thirty_four?" => {
          name: "thirty_four?",
          description: "returns whether the integer is thirty four.",
          examples: %w[34.thirty_four? 35.thirty_four? 0.thirty_four?]
        },
        "thirty_five?" => {
          name: "thirty_five?",
          description: "returns whether the integer is thirty five.",
          examples: %w[35.thirty_five? 36.thirty_five? 0.thirty_five?]
        },
        "thirty_six?" => {
          name: "thirty_six?",
          description: "returns whether the integer is thirty six.",
          examples: %w[36.thirty_six? 37.thirty_six? 0.thirty_six?]
        },
        "thirty_seven?" => {
          name: "thirty_seven?",
          description: "returns whether the integer is thirty seven.",
          examples: %w[37.thirty_seven? 38.thirty_seven? 0.thirty_seven?]
        },
        "thirty_eight?" => {
          name: "thirty_eight?",
          description: "returns whether the integer is thirty eight.",
          examples: %w[38.thirty_eight? 39.thirty_eight? 0.thirty_eight?]
        },
        "thirty_nine?" => {
          name: "thirty_nine?",
          description: "returns whether the integer is thirty nine.",
          examples: %w[39.thirty_nine? 40.thirty_nine? 0.thirty_nine?]
        },
        "forty?" => {
          name: "forty?",
          description: "returns whether the integer is forty.",
          examples: %w[40.forty? 41.forty? 0.forty?]
        },
        "forty_one?" => {
          name: "forty_one?",
          description: "returns whether the integer is forty one.",
          examples: %w[41.forty_one? 42.forty_one? 0.forty_one?]
        },
        "forty_two?" => {
          name: "forty_two?",
          description: "returns whether the integer is forty two.",
          examples: %w[42.forty_two? 43.forty_two? 0.forty_two?]
        },
        "forty_three?" => {
          name: "forty_three?",
          description: "returns whether the integer is forty three.",
          examples: %w[43.forty_three? 44.forty_three? 0.forty_three?]
        },
        "forty_four?" => {
          name: "forty_four?",
          description: "returns whether the integer is forty four.",
          examples: %w[44.forty_four? 45.forty_four? 0.forty_four?]
        },
        "forty_five?" => {
          name: "forty_five?",
          description: "returns whether the integer is forty five.",
          examples: %w[45.forty_five? 46.forty_five? 0.forty_five?]
        },
        "forty_six?" => {
          name: "forty_six?",
          description: "returns whether the integer is forty six.",
          examples: %w[46.forty_six? 47.forty_six? 0.forty_six?]
        },
        "forty_seven?" => {
          name: "forty_seven?",
          description: "returns whether the integer is forty seven.",
          examples: %w[47.forty_seven? 48.forty_seven? 0.forty_seven?]
        },
        "forty_eight?" => {
          name: "forty_eight?",
          description: "returns whether the integer is forty eight.",
          examples: %w[48.forty_eight? 49.forty_eight? 0.forty_eight?]
        },
        "forty_nine?" => {
          name: "forty_nine?",
          description: "returns whether the integer is forty nine.",
          examples: %w[49.forty_nine? 50.forty_nine? 0.forty_nine?]
        },
        "fifty?" => {
          name: "fifty?",
          description: "returns whether the integer is fifty.",
          examples: %w[50.fifty? 51.fifty? 0.fifty?]
        },
        "fifty_one?" => {
          name: "fifty_one?",
          description: "returns whether the integer is fifty one.",
          examples: %w[51.fifty_one? 52.fifty_one? 0.fifty_one?]
        },
        "fifty_two?" => {
          name: "fifty_two?",
          description: "returns whether the integer is fifty two.",
          examples: %w[52.fifty_two? 53.fifty_two? 0.fifty_two?]
        },
        "fifty_three?" => {
          name: "fifty_three?",
          description: "returns whether the integer is fifty three.",
          examples: %w[53.fifty_three? 54.fifty_three? 0.fifty_three?]
        },
        "fifty_four?" => {
          name: "fifty_four?",
          description: "returns whether the integer is fifty four.",
          examples: %w[54.fifty_four? 55.fifty_four? 0.fifty_four?]
        },
        "fifty_five?" => {
          name: "fifty_five?",
          description: "returns whether the integer is fifty five.",
          examples: %w[55.fifty_five? 56.fifty_five? 0.fifty_five?]
        },
        "fifty_six?" => {
          name: "fifty_six?",
          description: "returns whether the integer is fifty six.",
          examples: %w[56.fifty_six? 57.fifty_six? 0.fifty_six?]
        },
        "fifty_seven?" => {
          name: "fifty_seven?",
          description: "returns whether the integer is fifty seven.",
          examples: %w[57.fifty_seven? 58.fifty_seven? 0.fifty_seven?]
        },
        "fifty_eight?" => {
          name: "fifty_eight?",
          description: "returns whether the integer is fifty eight.",
          examples: %w[58.fifty_eight? 59.fifty_eight? 0.fifty_eight?]
        },
        "fifty_nine?" => {
          name: "fifty_nine?",
          description: "returns whether the integer is fifty nine.",
          examples: %w[59.fifty_nine? 60.fifty_nine? 0.fifty_nine?]
        },
        "sixty?" => {
          name: "sixty?",
          description: "returns whether the integer is sixty.",
          examples: %w[60.sixty? 61.sixty? 0.sixty?]
        },
        "sixty_one?" => {
          name: "sixty_one?",
          description: "returns whether the integer is sixty one.",
          examples: %w[61.sixty_one? 62.sixty_one? 0.sixty_one?]
        },
        "sixty_two?" => {
          name: "sixty_two?",
          description: "returns whether the integer is sixty two.",
          examples: %w[62.sixty_two? 63.sixty_two? 0.sixty_two?]
        },
        "sixty_three?" => {
          name: "sixty_three?",
          description: "returns whether the integer is sixty three.",
          examples: %w[63.sixty_three? 64.sixty_three? 0.sixty_three?]
        },
        "sixty_four?" => {
          name: "sixty_four?",
          description: "returns whether the integer is sixty four.",
          examples: %w[64.sixty_four? 65.sixty_four? 0.sixty_four?]
        },
        "sixty_five?" => {
          name: "sixty_five?",
          description: "returns whether the integer is sixty five.",
          examples: %w[65.sixty_five? 66.sixty_five? 0.sixty_five?]
        },
        "sixty_six?" => {
          name: "sixty_six?",
          description: "returns whether the integer is sixty six.",
          examples: %w[66.sixty_six? 67.sixty_six? 0.sixty_six?]
        },
        "sixty_seven?" => {
          name: "sixty_seven?",
          description: "returns whether the integer is sixty seven.",
          examples: %w[67.sixty_seven? 68.sixty_seven? 0.sixty_seven?]
        },
        "sixty_eight?" => {
          name: "sixty_eight?",
          description: "returns whether the integer is sixty eight.",
          examples: %w[68.sixty_eight? 69.sixty_eight? 0.sixty_eight?]
        },
        "sixty_nine?" => {
          name: "sixty_nine?",
          description: "returns whether the integer is sixty nine.",
          examples: %w[69.sixty_nine? 70.sixty_nine? 0.sixty_nine?]
        },
        "seventy?" => {
          name: "seventy?",
          description: "returns whether the integer is seventy.",
          examples: %w[70.seventy? 71.seventy? 0.seventy?]
        },
        "seventy_one?" => {
          name: "seventy_one?",
          description: "returns whether the integer is seventy one.",
          examples: %w[71.seventy_one? 72.seventy_one? 0.seventy_one?]
        },
        "seventy_two?" => {
          name: "seventy_two?",
          description: "returns whether the integer is seventy two.",
          examples: %w[72.seventy_two? 73.seventy_two? 0.seventy_two?]
        },
        "seventy_three?" => {
          name: "seventy_three?",
          description: "returns whether the integer is seventy three.",
          examples: %w[73.seventy_three? 74.seventy_three? 0.seventy_three?]
        },
        "seventy_four?" => {
          name: "seventy_four?",
          description: "returns whether the integer is seventy four.",
          examples: %w[74.seventy_four? 75.seventy_four? 0.seventy_four?]
        },
        "seventy_five?" => {
          name: "seventy_five?",
          description: "returns whether the integer is seventy five.",
          examples: %w[75.seventy_five? 76.seventy_five? 0.seventy_five?]
        },
        "seventy_six?" => {
          name: "seventy_six?",
          description: "returns whether the integer is seventy six.",
          examples: %w[76.seventy_six? 77.seventy_six? 0.seventy_six?]
        },
        "seventy_seven?" => {
          name: "seventy_seven?",
          description: "returns whether the integer is seventy seven.",
          examples: %w[77.seventy_seven? 78.seventy_seven? 0.seventy_seven?]
        },
        "seventy_eight?" => {
          name: "seventy_eight?",
          description: "returns whether the integer is seventy eight.",
          examples: %w[78.seventy_eight? 79.seventy_eight? 0.seventy_eight?]
        },
        "seventy_nine?" => {
          name: "seventy_nine?",
          description: "returns whether the integer is seventy nine.",
          examples: %w[79.seventy_nine? 80.seventy_nine? 0.seventy_nine?]
        },
        "eighty?" => {
          name: "eighty?",
          description: "returns whether the integer is eighty.",
          examples: %w[80.eighty? 81.eighty? 0.eighty?]
        },
        "eighty_one?" => {
          name: "eighty_one?",
          description: "returns whether the integer is eighty one.",
          examples: %w[81.eighty_one? 82.eighty_one? 0.eighty_one?]
        },
        "eighty_two?" => {
          name: "eighty_two?",
          description: "returns whether the integer is eighty two.",
          examples: %w[82.eighty_two? 83.eighty_two? 0.eighty_two?]
        },
        "eighty_three?" => {
          name: "eighty_three?",
          description: "returns whether the integer is eighty three.",
          examples: %w[83.eighty_three? 84.eighty_three? 0.eighty_three?]
        },
        "eighty_four?" => {
          name: "eighty_four?",
          description: "returns whether the integer is eighty four.",
          examples: %w[84.eighty_four? 85.eighty_four? 0.eighty_four?]
        },
        "eighty_five?" => {
          name: "eighty_five?",
          description: "returns whether the integer is eighty five.",
          examples: %w[85.eighty_five? 86.eighty_five? 0.eighty_five?]
        },
        "eighty_six?" => {
          name: "eighty_six?",
          description: "returns whether the integer is eighty six.",
          examples: %w[86.eighty_six? 87.eighty_six? 0.eighty_six?]
        },
        "eighty_seven?" => {
          name: "eighty_seven?",
          description: "returns whether the integer is eighty seven.",
          examples: %w[87.eighty_seven? 88.eighty_seven? 0.eighty_seven?]
        },
        "eighty_eight?" => {
          name: "eighty_eight?",
          description: "returns whether the integer is eighty eight.",
          examples: %w[88.eighty_eight? 89.eighty_eight? 0.eighty_eight?]
        },
        "eighty_nine?" => {
          name: "eighty_nine?",
          description: "returns whether the integer is eighty nine.",
          examples: %w[89.eighty_nine? 90.eighty_nine? 0.eighty_nine?]
        },
        "ninety?" => {
          name: "ninety?",
          description: "returns whether the integer is ninety.",
          examples: %w[90.ninety? 91.ninety? 0.ninety?]
        },
        "ninety_one?" => {
          name: "ninety_one?",
          description: "returns whether the integer is ninety one.",
          examples: %w[91.ninety_one? 92.ninety_one? 0.ninety_one?]
        },
        "ninety_two?" => {
          name: "ninety_two?",
          description: "returns whether the integer is ninety two.",
          examples: %w[92.ninety_two? 93.ninety_two? 0.ninety_two?]
        },
        "ninety_three?" => {
          name: "ninety_three?",
          description: "returns whether the integer is ninety three.",
          examples: %w[93.ninety_three? 94.ninety_three? 0.ninety_three?]
        },
        "ninety_four?" => {
          name: "ninety_four?",
          description: "returns whether the integer is ninety four.",
          examples: %w[94.ninety_four? 95.ninety_four? 0.ninety_four?]
        },
        "ninety_five?" => {
          name: "ninety_five?",
          description: "returns whether the integer is ninety five.",
          examples: %w[95.ninety_five? 96.ninety_five? 0.ninety_five?]
        },
        "ninety_six?" => {
          name: "ninety_six?",
          description: "returns whether the integer is ninety six.",
          examples: %w[96.ninety_six? 97.ninety_six? 0.ninety_six?]
        },
        "ninety_seven?" => {
          name: "ninety_seven?",
          description: "returns whether the integer is ninety seven.",
          examples: %w[97.ninety_seven? 98.ninety_seven? 0.ninety_seven?]
        },
        "ninety_eight?" => {
          name: "ninety_eight?",
          description: "returns whether the integer is ninety eight.",
          examples: %w[98.ninety_eight? 99.ninety_eight? 0.ninety_eight?]
        },
        "ninety_nine?" => {
          name: "ninety_nine?",
          description: "returns whether the integer is ninety nine.",
          examples: %w[99.ninety_nine? 100.ninety_nine? 0.ninety_nine?]
        },
        "one_hundred?" => {
          name: "one_hundred?",
          description: "returns whether the integer is one hundred.",
          examples: %w[100.one_hundred? 101.one_hundred? 0.one_hundred?]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      def initialize(*args, **_kargs, &)
        self.raw =
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
        self.raw = 0
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
        when "power_modulo"
          sig(args) { [Integer, Integer] }
          code_power_modulo(*code_arguments.raw)
        when "+", "plus"
          sig(args) { Object.maybe }
          code_arguments.any? ? code_plus(code_value) : code_self
        when "-", "minus", "unary_minus"
          sig(args) { Integer | Decimal.maybe }
          code_arguments.any? ? code_minus(code_value) : code_unary_minus
        when "/", "division", "÷"
          sig(args) { Integer | Decimal }
          code_division(code_value)
        when "divide"
          sig(args) { Integer | Decimal }
          code_divide(code_value)
        when "divide_modulo"
          sig(args) { Integer | Decimal }
          code_divide_modulo(code_value)
        when "decimal_divide"
          sig(args) { Integer | Decimal }
          code_decimal_divide(code_value)
        when "digits"
          sig(args) { Integer.maybe }
          code_digits(code_value)
        when "bit_length"
          sig(args)
          code_bit_length
        when "all_bits?"
          sig(args) { Integer }
          code_all_bits?(code_value)
        when "any_bits?"
          sig(args) { Integer }
          code_any_bits?(code_value)
        when "no_bits?"
          sig(args) { Integer }
          code_no_bits?(code_value)
        when "character"
          sig(args)
          code_character
        when "greatest_common_denominator"
          sig(args) { Integer }
          code_greatest_common_denominator(code_value)
        when "lowest_common_multiple"
          sig(args) { Integer }
          code_lowest_common_multiple(code_value)
        when "<<", "left_shift"
          sig(args) { Integer | Decimal }
          code_left_shift(code_value)
        when ">>", "right_shift"
          sig(args) { Integer | Decimal }
          code_right_shift(code_value)
        when "^", "bitwise_xor"
          sig(args) { Integer | Decimal }
          code_bitwise_xor(code_value)
        when "abs"
          sig(args)
          code_abs
        when "between?"
          sig(args) { [Integer | Decimal, Integer | Decimal] }
          code_between?(*code_arguments.raw)
        when "ceil"
          sig(args) { Integer.maybe }
          code_ceil(code_value)
        when "ceil_divide"
          sig(args) { Integer | Decimal }
          code_ceil_divide(code_value)
        when "clamp"
          sig(args) { [Integer | Decimal, Integer | Decimal] }
          code_clamp(*code_arguments.raw)
        when "day", "days"
          sig(args)
          code_days
        when "decrement!"
          sig(args) { Integer.maybe }
          code_decrement!(code_value)
        when "decrement"
          sig(args) { Integer.maybe }
          code_decrement(code_value)
        when "even?"
          sig(args)
          code_even?
        when "floor"
          sig(args) { Integer.maybe }
          code_floor(code_value)
        when "hour", "hours"
          sig(args)
          code_hours
        when "increment!"
          sig(args) { Integer.maybe }
          code_increment!(code_value)
        when "increment"
          sig(args) { Integer.maybe }
          code_increment(code_value)
        when "odd?"
          sig(args)
          code_odd?
        when "minute", "minutes"
          sig(args)
          code_minutes
        when "month", "months"
          sig(args)
          code_months
        when "next", "successor"
          sig(args)
          code_next
        when "previous", "predecessor"
          sig(args)
          code_previous
        when "remainder"
          sig(args) { Integer | Decimal }
          code_remainder(code_value)
        when "round"
          sig(args) { Integer.maybe }
          code_round(code_value)
        when "second", "seconds"
          sig(args)
          code_seconds
        when "sqrt"
          sig(args)
          code_sqrt
        when "times"
          sig(args) { Function }
          code_times(code_value, **globals)
        when "down_to"
          sig(args) { [Integer, Function] }
          code_down_to(*code_arguments.raw, **globals)
        when "up_to"
          sig(args) { [Integer, Function] }
          code_up_to(*code_arguments.raw, **globals)
        when "truncate"
          sig(args) { Integer.maybe }
          code_truncate(code_value)
        when "week", "weeks"
          sig(args)
          code_weeks
        when "year", "years"
          sig(args)
          code_years
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
        when "non_zero?"
          sig(args)
          code_non_zero?
        when "integer?"
          sig(args)
          code_integer?
        when "finite?"
          sig(args)
          code_finite?
        when "infinite?"
          sig(args)
          code_infinite?
        when "numerator"
          sig(args)
          code_numerator
        when "denominator"
          sig(args)
          code_denominator
        when "magnitude"
          sig(args)
          code_magnitude
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

      def code_bit_length
        Integer.new(raw.bit_length)
      end

      def code_all_bits?(mask)
        code_mask = mask.to_code

        Boolean.new(raw.allbits?(code_mask.raw))
      end

      def code_any_bits?(mask)
        code_mask = mask.to_code

        Boolean.new(raw.anybits?(code_mask.raw))
      end

      def code_no_bits?(mask)
        code_mask = mask.to_code

        Boolean.new(raw.nobits?(code_mask.raw))
      end

      def code_ceil(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?
        Integer.new(raw.ceil(code_n.raw))
      end

      def code_ceil_divide(other)
        code_other = other.to_code

        Integer.new(raw.ceildiv(code_other.raw))
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

      def code_decimal_divide(other)
        code_division(other)
      end

      def code_digits(base = nil)
        code_base = base.to_code

        if code_base.nothing?
          List.new(raw.digits)
        else
          List.new(raw.digits(code_base.raw))
        end
      end

      def code_character
        String.new(raw.chr)
      end

      def code_even?
        Boolean.new(raw.even?)
      end

      def code_floor(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?
        Integer.new(raw.floor(code_n.raw))
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

      def code_greatest_common_denominator(other)
        code_other = other.to_code
        Integer.new(raw.gcd(code_other.raw))
      end

      def code_lowest_common_multiple(other)
        code_other = other.to_code
        Integer.new(raw.lcm(code_other.raw))
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

      def code_odd?
        Boolean.new(raw.odd?)
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
          Integer.new(raw**code_other.raw)
        else
          Decimal.new(raw**code_other.raw)
        end
      end

      def code_power_modulo(power, modulo)
        code_power = power.to_code
        code_modulo = modulo.to_code

        Integer.new(raw.pow(code_power.raw, code_modulo.raw))
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

      def code_sqrt
        Decimal.new(Math.sqrt(raw).to_s)
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
        rescue Error::Next => e
          e.code_value
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_down_to(value, function, **globals)
        code_value = value.to_code
        code_function = function.to_code

        raw
          .downto(code_value.raw)
          .with_index do |element, index|
            code_function.call(
              arguments:
                List.new([Integer.new(element), Integer.new(index), self]),
              **globals
            )
          rescue Error::Next => e
            e.code_value
          end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_up_to(value, function, **globals)
        code_value = value.to_code
        code_function = function.to_code

        raw
          .upto(code_value.raw)
          .with_index do |element, index|
            code_function.call(
              arguments:
                List.new([Integer.new(element), Integer.new(index), self]),
              **globals
            )
          rescue Error::Next => e
            e.code_value
          end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_truncate(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?

        Integer.new(raw.truncate(code_n.raw))
      end

      def code_unary_minus
        Integer.new(-raw)
      end

      def code_many?
        Boolean.new(raw > 1)
      end

      def code_any?
        Boolean.new(raw.positive?)
      end

      def code_hours
        Duration.new(raw.hours)
      end

      def code_minutes
        Duration.new(raw.minutes)
      end

      def code_months
        Duration.new(raw.months)
      end

      def code_seconds
        Duration.new(raw.seconds)
      end

      def code_weeks
        Duration.new(raw.weeks)
      end

      def code_years
        Duration.new(raw.years)
      end

      def code_days
        Duration.new(raw.days)
      end

      def code_positive?
        Boolean.new(raw.positive?)
      end

      def code_negative?
        Boolean.new(raw.negative?)
      end

      def code_non_zero?
        Boolean.new(!raw.zero?)
      end

      def code_integer?
        Boolean.new(true)
      end

      def code_finite?
        Boolean.new(true)
      end

      def code_infinite?
        Boolean.new(false)
      end

      def code_numerator
        Integer.new(raw.numerator)
      end

      def code_denominator
        Integer.new(raw.denominator)
      end

      def code_magnitude
        code_abs
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
