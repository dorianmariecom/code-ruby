# frozen_string_literal: true

class Code
  class Object
    class Decimal < Number
      CLASS_DOCUMENTATION = {
        name: "Decimal",
        description:
          "represents fractional numbers with arithmetic, rounding, formatting, duration helpers, and numeric predicates.",
        examples: ["Decimal.new(1.5)", "Decimal.new(\"2.5\") + 1", "1.5.days"]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "%" => {
          name: "%",
          description: "returns the decimal modulo another number.",
          examples: ["5.5 % 2", "4.0 % 2", "7.5 % 3"]
        },
        "modulo" => {
          name: "modulo",
          description: "returns the decimal modulo another number.",
          examples: %w[5.5.modulo(2) 4.0.modulo(2) 7.5.modulo(3)]
        },
        "&" => {
          name: "&",
          description:
            "returns the bitwise and of the decimal integer value and another number.",
          examples: ["5.5 & 3", "4.0 & 1", "7.0 & 2"]
        },
        "bitwise_and" => {
          name: "bitwise_and",
          description:
            "returns the bitwise and of the decimal integer value and another number.",
          examples: %w[5.5.bitwise_and(3) 4.0.bitwise_and(1) 7.0.bitwise_and(2)]
        },
        "*" => {
          name: "*",
          description: "returns the decimal multiplied by another number.",
          examples: ["2.5 * 2", "1.5 * 3", "4.0 * 2"]
        },
        "multiplication" => {
          name: "multiplication",
          description: "returns the decimal multiplied by another number.",
          examples: %w[
            2.5.multiplication(2)
            1.5.multiplication(3)
            4.0.multiplication(2)
          ]
        },
        "**" => {
          name: "**",
          description: "returns the decimal raised to a power.",
          examples: ["2.5 ** 2", "4.0 ** 2", "9.0 ** 0.5"]
        },
        "power" => {
          name: "power",
          description: "returns the decimal raised to a power.",
          examples: %w[2.5.power(2) 4.0.power(2) 9.0.power(0.5)]
        },
        "+" => {
          name: "+",
          description:
            "returns the decimal itself when unary, adds numbers, or joins other values as text.",
          examples: ["1.5 + 2", "1.5 + 2.5", "+1.5"]
        },
        "plus" => {
          name: "plus",
          description: "adds numbers or joins non-numeric values as text.",
          examples: %w[1.5.plus(2) 1.5.plus(2.5) 1.5.plus(:x)]
        },
        "-" => {
          name: "-",
          description:
            "returns the decimal negated when unary or minus another number.",
          examples: ["5.5 - 1", "5.5 - 2.5", "-5.5"]
        },
        "minus" => {
          name: "minus",
          description: "returns the decimal minus another number.",
          examples: %w[5.5.minus(1) 5.5.minus(2.5) 1.5.minus(3)]
        },
        "/" => {
          name: "/",
          description: "returns the decimal divided by another number.",
          examples: ["5.5 / 2", "4.0 / 2", "7.5 / 3"]
        },
        "division" => {
          name: "division",
          description: "returns the decimal divided by another number.",
          examples: %w[5.5.division(2) 4.0.division(2) 7.5.division(3)]
        },
        "decimal_divide" => {
          name: "decimal_divide",
          description: "returns the decimal divided by another number.",
          examples: %w[
            5.5.decimal_divide(2)
            4.0.decimal_divide(2)
            7.5.decimal_divide(3)
          ]
        },
        "<<" => {
          name: "<<",
          description: "returns the decimal integer value shifted left.",
          examples: ["5.5 << 1", "4.0 << 2", "1.0 << 3"]
        },
        "left_shift" => {
          name: "left_shift",
          description: "returns the decimal integer value shifted left.",
          examples: %w[5.5.left_shift(1) 4.0.left_shift(2) 1.0.left_shift(3)]
        },
        ">>" => {
          name: ">>",
          description: "returns the decimal integer value shifted right.",
          examples: ["5.5 >> 1", "4.0 >> 1", "8.0 >> 2"]
        },
        "right_shift" => {
          name: "right_shift",
          description: "returns the decimal integer value shifted right.",
          examples: %w[5.5.right_shift(1) 4.0.right_shift(1) 8.0.right_shift(2)]
        },
        "^" => {
          name: "^",
          description:
            "returns the bitwise xor of the decimal integer value and another number.",
          examples: ["5.5 ^ 3", "4.0 ^ 1", "7.0 ^ 2"]
        },
        "bitwise_xor" => {
          name: "bitwise_xor",
          description:
            "returns the bitwise xor of the decimal integer value and another number.",
          examples: %w[5.5.bitwise_xor(3) 4.0.bitwise_xor(1) 7.0.bitwise_xor(2)]
        },
        "abs" => {
          name: "abs",
          description: "returns the absolute value of the decimal.",
          examples: %w[-1.5.abs 1.5.abs 0.0.abs]
        },
        "between?" => {
          name: "between?",
          description: "returns whether the decimal is between two bounds.",
          examples: [
            "1.5.between?(1, 2)",
            "3.5.between?(1, 2)",
            "2.0.between?(1.5, 2.5)"
          ]
        },
        "clamp" => {
          name: "clamp",
          description: "returns the decimal constrained between two bounds.",
          examples: ["5.5.clamp(1, 3)", "0.5.clamp(1, 3)", "2.5.clamp(1, 3)"]
        },
        "divide" => {
          name: "divide",
          description:
            "returns integer division of the decimal by another number.",
          examples: %w[5.5.divide(2) 10.5.divide(3) 9.5.divide(2)]
        },
        "divide_modulo" => {
          name: "divide_modulo",
          description: "returns integer division and modulo as a list.",
          examples: %w[
            5.5.divide_modulo(2)
            10.5.divide_modulo(3)
            9.5.divide_modulo(2)
          ]
        },
        "ceil" => {
          name: "ceil",
          description: "returns the decimal rounded up.",
          examples: %w[1.2.ceil 1.234.ceil(2) -1.2.ceil]
        },
        "day" => {
          name: "day",
          description: "returns a duration of this many days.",
          examples: %w[1.5.day 2.0.day 0.5.day]
        },
        "days" => {
          name: "days",
          description: "returns a duration of this many days.",
          examples: %w[1.5.days 2.0.days 0.5.days]
        },
        "floor" => {
          name: "floor",
          description: "returns the decimal rounded down.",
          examples: %w[1.8.floor 1.234.floor(2) -1.2.floor]
        },
        "hour" => {
          name: "hour",
          description: "returns a duration of this many hours.",
          examples: %w[1.5.hour 2.0.hour 0.5.hour]
        },
        "hours" => {
          name: "hours",
          description: "returns a duration of this many hours.",
          examples: %w[1.5.hours 2.0.hours 0.5.hours]
        },
        "minute" => {
          name: "minute",
          description: "returns a duration of this many minutes.",
          examples: %w[1.5.minute 2.0.minute 0.5.minute]
        },
        "minutes" => {
          name: "minutes",
          description: "returns a duration of this many minutes.",
          examples: %w[1.5.minutes 2.0.minutes 0.5.minutes]
        },
        "month" => {
          name: "month",
          description: "returns a duration of this many months.",
          examples: %w[1.5.month 2.0.month 0.5.month]
        },
        "months" => {
          name: "months",
          description: "returns a duration of this many months.",
          examples: %w[1.5.months 2.0.months 0.5.months]
        },
        "next_decimal" => {
          name: "next_decimal",
          description: "alias for next.",
          examples: %w[1.5.next_decimal 0.0.next_decimal -1.5.next_decimal]
        },
        "previous_decimal" => {
          name: "previous_decimal",
          description: "alias for previous.",
          examples: %w[
            1.5.previous_decimal
            0.0.previous_decimal
            -1.5.previous_decimal
          ]
        },
        "round" => {
          name: "round",
          description: "returns the decimal rounded to a precision.",
          examples: %w[1.5.round 1.234.round(2) -1.5.round]
        },
        "second" => {
          name: "second",
          description: "returns a duration of this many seconds.",
          examples: %w[1.5.second 2.0.second 0.5.second]
        },
        "seconds" => {
          name: "seconds",
          description: "returns a duration of this many seconds.",
          examples: %w[1.5.seconds 2.0.seconds 0.5.seconds]
        },
        "sqrt" => {
          name: "sqrt",
          description: "returns the square root of the decimal.",
          examples: %w[4.0.sqrt 9.0.sqrt 2.25.sqrt]
        },
        "truncate" => {
          name: "truncate",
          description: "returns the decimal truncated to a precision.",
          examples: %w[1.9.truncate 1.234.truncate(2) -1.9.truncate]
        },
        "to_fixed" => {
          name: "to_fixed",
          description:
            "returns the decimal formatted with a fixed number of fractional digits.",
          examples: %w[1.5.to_fixed 1.5.to_fixed(2) 1.234.to_fixed(1)]
        },
        "to_precision" => {
          name: "to_precision",
          description:
            "returns the decimal formatted with a fixed number of significant digits.",
          examples: %w[
            1.5.to_precision
            1.234.to_precision(2)
            123.4.to_precision(3)
          ]
        },
        "to_exponential" => {
          name: "to_exponential",
          description:
            "returns the decimal formatted with exponential notation.",
          examples: %w[
            1.5.to_exponential
            1.5.to_exponential(2)
            123.4.to_exponential(1)
          ]
        },
        "week" => {
          name: "week",
          description: "returns a duration of this many weeks.",
          examples: %w[1.5.week 2.0.week 0.5.week]
        },
        "weeks" => {
          name: "weeks",
          description: "returns a duration of this many weeks.",
          examples: %w[1.5.weeks 2.0.weeks 0.5.weeks]
        },
        "year" => {
          name: "year",
          description: "returns a duration of this many years.",
          examples: %w[1.5.year 2.0.year 0.5.year]
        },
        "years" => {
          name: "years",
          description: "returns a duration of this many years.",
          examples: %w[1.5.years 2.0.years 0.5.years]
        },
        "|" => {
          name: "|",
          description:
            "returns the bitwise or of the decimal integer value and another number.",
          examples: ["5.5 | 2", "4.0 | 1", "7.0 | 2"]
        },
        "bitwise_or" => {
          name: "bitwise_or",
          description:
            "returns the bitwise or of the decimal integer value and another number.",
          examples: %w[5.5.bitwise_or(2) 4.0.bitwise_or(1) 7.0.bitwise_or(2)]
        },
        "many?" => {
          name: "many?",
          description: "returns whether the decimal is greater than one.",
          examples: %w[2.0.many? 1.0.many? 0.5.many?]
        },
        "any?" => {
          name: "any?",
          description: "returns whether the decimal is positive.",
          examples: %w[1.0.any? 0.0.any? -1.0.any?]
        },
        "positive?" => {
          name: "positive?",
          description: "returns whether the decimal is positive.",
          examples: %w[1.0.positive? 0.0.positive? -1.0.positive?]
        },
        "negative?" => {
          name: "negative?",
          description: "returns whether the decimal is negative.",
          examples: %w[-1.0.negative? 0.0.negative? 1.0.negative?]
        },
        "next" => {
          name: "next",
          description: "returns the decimal plus one.",
          examples: %w[1.5.next 0.0.next -1.5.next]
        },
        "successor" => {
          name: "successor",
          description: "alias for next.",
          examples: %w[1.5.successor 0.0.successor -1.5.successor]
        },
        "previous" => {
          name: "previous",
          description: "returns the decimal minus one.",
          examples: %w[1.5.previous 0.0.previous -1.5.previous]
        },
        "predecessor" => {
          name: "predecessor",
          description: "alias for previous.",
          examples: %w[1.5.predecessor 0.0.predecessor -1.5.predecessor]
        },
        "remainder" => {
          name: "remainder",
          description:
            "returns the remainder after division by another number.",
          examples: %w[5.5.remainder(2) 10.5.remainder(3) 9.5.remainder(2)]
        },
        "non_zero?" => {
          name: "non_zero?",
          description: "returns whether the decimal is not zero.",
          examples: %w[1.0.non_zero? 0.0.non_zero? -1.0.non_zero?]
        },
        "integer?" => {
          name: "integer?",
          description: "returns whether the decimal has no fractional part.",
          examples: %w[1.0.integer? 1.5.integer? 0.0.integer?]
        },
        "finite?" => {
          name: "finite?",
          description: "returns whether the decimal is finite.",
          examples: %w[1.0.finite? 0.0.finite? -1.0.finite?]
        },
        "infinite?" => {
          name: "infinite?",
          description: "returns whether the decimal is infinite.",
          examples: %w[1.0.infinite? 0.0.infinite? -1.0.infinite?]
        },
        "not_a_number?" => {
          name: "not_a_number?",
          description: "returns whether the decimal is not a number.",
          examples: %w[1.0.not_a_number? 0.0.not_a_number? -1.0.not_a_number?]
        },
        "numerator" => {
          name: "numerator",
          description: "returns the decimal numerator.",
          examples: %w[1.5.numerator 2.0.numerator 0.5.numerator]
        },
        "denominator" => {
          name: "denominator",
          description: "returns the decimal denominator.",
          examples: %w[1.5.denominator 2.0.denominator 0.5.denominator]
        },
        "magnitude" => {
          name: "magnitude",
          description: "returns the absolute value of the decimal.",
          examples: %w[-1.5.magnitude 1.5.magnitude 0.0.magnitude]
        },
        "zero?" => {
          name: "zero?",
          description: "returns whether the decimal is zero.",
          examples: %w[0.0.zero? 1.0.zero? 0.5.zero?]
        },
        "one?" => {
          name: "one?",
          description: "returns whether the decimal is one.",
          examples: %w[1.0.one? 2.0.one? 0.5.one?]
        },
        "two?" => {
          name: "two?",
          description: "returns whether the decimal is two.",
          examples: %w[2.0.two? 3.0.two? 0.5.two?]
        },
        "three?" => {
          name: "three?",
          description: "returns whether the decimal is three.",
          examples: %w[3.0.three? 4.0.three? 0.5.three?]
        },
        "four?" => {
          name: "four?",
          description: "returns whether the decimal is four.",
          examples: %w[4.0.four? 5.0.four? 0.5.four?]
        },
        "five?" => {
          name: "five?",
          description: "returns whether the decimal is five.",
          examples: %w[5.0.five? 6.0.five? 0.5.five?]
        },
        "six?" => {
          name: "six?",
          description: "returns whether the decimal is six.",
          examples: %w[6.0.six? 7.0.six? 0.5.six?]
        },
        "seven?" => {
          name: "seven?",
          description: "returns whether the decimal is seven.",
          examples: %w[7.0.seven? 8.0.seven? 0.5.seven?]
        },
        "eight?" => {
          name: "eight?",
          description: "returns whether the decimal is eight.",
          examples: %w[8.0.eight? 9.0.eight? 0.5.eight?]
        },
        "nine?" => {
          name: "nine?",
          description: "returns whether the decimal is nine.",
          examples: %w[9.0.nine? 10.0.nine? 0.5.nine?]
        },
        "ten?" => {
          name: "ten?",
          description: "returns whether the decimal is ten.",
          examples: %w[10.0.ten? 11.0.ten? 0.5.ten?]
        },
        "eleven?" => {
          name: "eleven?",
          description: "returns whether the decimal is eleven.",
          examples: %w[11.0.eleven? 12.0.eleven? 0.5.eleven?]
        },
        "twelve?" => {
          name: "twelve?",
          description: "returns whether the decimal is twelve.",
          examples: %w[12.0.twelve? 13.0.twelve? 0.5.twelve?]
        },
        "thirteen?" => {
          name: "thirteen?",
          description: "returns whether the decimal is thirteen.",
          examples: %w[13.0.thirteen? 14.0.thirteen? 0.5.thirteen?]
        },
        "fourteen?" => {
          name: "fourteen?",
          description: "returns whether the decimal is fourteen.",
          examples: %w[14.0.fourteen? 15.0.fourteen? 0.5.fourteen?]
        },
        "fifteen?" => {
          name: "fifteen?",
          description: "returns whether the decimal is fifteen.",
          examples: %w[15.0.fifteen? 16.0.fifteen? 0.5.fifteen?]
        },
        "sixteen?" => {
          name: "sixteen?",
          description: "returns whether the decimal is sixteen.",
          examples: %w[16.0.sixteen? 17.0.sixteen? 0.5.sixteen?]
        },
        "seventeen?" => {
          name: "seventeen?",
          description: "returns whether the decimal is seventeen.",
          examples: %w[17.0.seventeen? 18.0.seventeen? 0.5.seventeen?]
        },
        "eighteen?" => {
          name: "eighteen?",
          description: "returns whether the decimal is eighteen.",
          examples: %w[18.0.eighteen? 19.0.eighteen? 0.5.eighteen?]
        },
        "nineteen?" => {
          name: "nineteen?",
          description: "returns whether the decimal is nineteen.",
          examples: %w[19.0.nineteen? 20.0.nineteen? 0.5.nineteen?]
        },
        "twenty?" => {
          name: "twenty?",
          description: "returns whether the decimal is twenty.",
          examples: %w[20.0.twenty? 21.0.twenty? 0.5.twenty?]
        },
        "twenty_one?" => {
          name: "twenty_one?",
          description: "returns whether the decimal is twenty one.",
          examples: %w[21.0.twenty_one? 22.0.twenty_one? 0.5.twenty_one?]
        },
        "twenty_two?" => {
          name: "twenty_two?",
          description: "returns whether the decimal is twenty two.",
          examples: %w[22.0.twenty_two? 23.0.twenty_two? 0.5.twenty_two?]
        },
        "twenty_three?" => {
          name: "twenty_three?",
          description: "returns whether the decimal is twenty three.",
          examples: %w[23.0.twenty_three? 24.0.twenty_three? 0.5.twenty_three?]
        },
        "twenty_four?" => {
          name: "twenty_four?",
          description: "returns whether the decimal is twenty four.",
          examples: %w[24.0.twenty_four? 25.0.twenty_four? 0.5.twenty_four?]
        },
        "twenty_five?" => {
          name: "twenty_five?",
          description: "returns whether the decimal is twenty five.",
          examples: %w[25.0.twenty_five? 26.0.twenty_five? 0.5.twenty_five?]
        },
        "twenty_six?" => {
          name: "twenty_six?",
          description: "returns whether the decimal is twenty six.",
          examples: %w[26.0.twenty_six? 27.0.twenty_six? 0.5.twenty_six?]
        },
        "twenty_seven?" => {
          name: "twenty_seven?",
          description: "returns whether the decimal is twenty seven.",
          examples: %w[27.0.twenty_seven? 28.0.twenty_seven? 0.5.twenty_seven?]
        },
        "twenty_eight?" => {
          name: "twenty_eight?",
          description: "returns whether the decimal is twenty eight.",
          examples: %w[28.0.twenty_eight? 29.0.twenty_eight? 0.5.twenty_eight?]
        },
        "twenty_nine?" => {
          name: "twenty_nine?",
          description: "returns whether the decimal is twenty nine.",
          examples: %w[29.0.twenty_nine? 30.0.twenty_nine? 0.5.twenty_nine?]
        },
        "thirty?" => {
          name: "thirty?",
          description: "returns whether the decimal is thirty.",
          examples: %w[30.0.thirty? 31.0.thirty? 0.5.thirty?]
        },
        "thirty_one?" => {
          name: "thirty_one?",
          description: "returns whether the decimal is thirty one.",
          examples: %w[31.0.thirty_one? 32.0.thirty_one? 0.5.thirty_one?]
        },
        "thirty_two?" => {
          name: "thirty_two?",
          description: "returns whether the decimal is thirty two.",
          examples: %w[32.0.thirty_two? 33.0.thirty_two? 0.5.thirty_two?]
        },
        "thirty_three?" => {
          name: "thirty_three?",
          description: "returns whether the decimal is thirty three.",
          examples: %w[33.0.thirty_three? 34.0.thirty_three? 0.5.thirty_three?]
        },
        "thirty_four?" => {
          name: "thirty_four?",
          description: "returns whether the decimal is thirty four.",
          examples: %w[34.0.thirty_four? 35.0.thirty_four? 0.5.thirty_four?]
        },
        "thirty_five?" => {
          name: "thirty_five?",
          description: "returns whether the decimal is thirty five.",
          examples: %w[35.0.thirty_five? 36.0.thirty_five? 0.5.thirty_five?]
        },
        "thirty_six?" => {
          name: "thirty_six?",
          description: "returns whether the decimal is thirty six.",
          examples: %w[36.0.thirty_six? 37.0.thirty_six? 0.5.thirty_six?]
        },
        "thirty_seven?" => {
          name: "thirty_seven?",
          description: "returns whether the decimal is thirty seven.",
          examples: %w[37.0.thirty_seven? 38.0.thirty_seven? 0.5.thirty_seven?]
        },
        "thirty_eight?" => {
          name: "thirty_eight?",
          description: "returns whether the decimal is thirty eight.",
          examples: %w[38.0.thirty_eight? 39.0.thirty_eight? 0.5.thirty_eight?]
        },
        "thirty_nine?" => {
          name: "thirty_nine?",
          description: "returns whether the decimal is thirty nine.",
          examples: %w[39.0.thirty_nine? 40.0.thirty_nine? 0.5.thirty_nine?]
        },
        "forty?" => {
          name: "forty?",
          description: "returns whether the decimal is forty.",
          examples: %w[40.0.forty? 41.0.forty? 0.5.forty?]
        },
        "forty_one?" => {
          name: "forty_one?",
          description: "returns whether the decimal is forty one.",
          examples: %w[41.0.forty_one? 42.0.forty_one? 0.5.forty_one?]
        },
        "forty_two?" => {
          name: "forty_two?",
          description: "returns whether the decimal is forty two.",
          examples: %w[42.0.forty_two? 43.0.forty_two? 0.5.forty_two?]
        },
        "forty_three?" => {
          name: "forty_three?",
          description: "returns whether the decimal is forty three.",
          examples: %w[43.0.forty_three? 44.0.forty_three? 0.5.forty_three?]
        },
        "forty_four?" => {
          name: "forty_four?",
          description: "returns whether the decimal is forty four.",
          examples: %w[44.0.forty_four? 45.0.forty_four? 0.5.forty_four?]
        },
        "forty_five?" => {
          name: "forty_five?",
          description: "returns whether the decimal is forty five.",
          examples: %w[45.0.forty_five? 46.0.forty_five? 0.5.forty_five?]
        },
        "forty_six?" => {
          name: "forty_six?",
          description: "returns whether the decimal is forty six.",
          examples: %w[46.0.forty_six? 47.0.forty_six? 0.5.forty_six?]
        },
        "forty_seven?" => {
          name: "forty_seven?",
          description: "returns whether the decimal is forty seven.",
          examples: %w[47.0.forty_seven? 48.0.forty_seven? 0.5.forty_seven?]
        },
        "forty_eight?" => {
          name: "forty_eight?",
          description: "returns whether the decimal is forty eight.",
          examples: %w[48.0.forty_eight? 49.0.forty_eight? 0.5.forty_eight?]
        },
        "forty_nine?" => {
          name: "forty_nine?",
          description: "returns whether the decimal is forty nine.",
          examples: %w[49.0.forty_nine? 50.0.forty_nine? 0.5.forty_nine?]
        },
        "fifty?" => {
          name: "fifty?",
          description: "returns whether the decimal is fifty.",
          examples: %w[50.0.fifty? 51.0.fifty? 0.5.fifty?]
        },
        "fifty_one?" => {
          name: "fifty_one?",
          description: "returns whether the decimal is fifty one.",
          examples: %w[51.0.fifty_one? 52.0.fifty_one? 0.5.fifty_one?]
        },
        "fifty_two?" => {
          name: "fifty_two?",
          description: "returns whether the decimal is fifty two.",
          examples: %w[52.0.fifty_two? 53.0.fifty_two? 0.5.fifty_two?]
        },
        "fifty_three?" => {
          name: "fifty_three?",
          description: "returns whether the decimal is fifty three.",
          examples: %w[53.0.fifty_three? 54.0.fifty_three? 0.5.fifty_three?]
        },
        "fifty_four?" => {
          name: "fifty_four?",
          description: "returns whether the decimal is fifty four.",
          examples: %w[54.0.fifty_four? 55.0.fifty_four? 0.5.fifty_four?]
        },
        "fifty_five?" => {
          name: "fifty_five?",
          description: "returns whether the decimal is fifty five.",
          examples: %w[55.0.fifty_five? 56.0.fifty_five? 0.5.fifty_five?]
        },
        "fifty_six?" => {
          name: "fifty_six?",
          description: "returns whether the decimal is fifty six.",
          examples: %w[56.0.fifty_six? 57.0.fifty_six? 0.5.fifty_six?]
        },
        "fifty_seven?" => {
          name: "fifty_seven?",
          description: "returns whether the decimal is fifty seven.",
          examples: %w[57.0.fifty_seven? 58.0.fifty_seven? 0.5.fifty_seven?]
        },
        "fifty_eight?" => {
          name: "fifty_eight?",
          description: "returns whether the decimal is fifty eight.",
          examples: %w[58.0.fifty_eight? 59.0.fifty_eight? 0.5.fifty_eight?]
        },
        "fifty_nine?" => {
          name: "fifty_nine?",
          description: "returns whether the decimal is fifty nine.",
          examples: %w[59.0.fifty_nine? 60.0.fifty_nine? 0.5.fifty_nine?]
        },
        "sixty?" => {
          name: "sixty?",
          description: "returns whether the decimal is sixty.",
          examples: %w[60.0.sixty? 61.0.sixty? 0.5.sixty?]
        },
        "sixty_one?" => {
          name: "sixty_one?",
          description: "returns whether the decimal is sixty one.",
          examples: %w[61.0.sixty_one? 62.0.sixty_one? 0.5.sixty_one?]
        },
        "sixty_two?" => {
          name: "sixty_two?",
          description: "returns whether the decimal is sixty two.",
          examples: %w[62.0.sixty_two? 63.0.sixty_two? 0.5.sixty_two?]
        },
        "sixty_three?" => {
          name: "sixty_three?",
          description: "returns whether the decimal is sixty three.",
          examples: %w[63.0.sixty_three? 64.0.sixty_three? 0.5.sixty_three?]
        },
        "sixty_four?" => {
          name: "sixty_four?",
          description: "returns whether the decimal is sixty four.",
          examples: %w[64.0.sixty_four? 65.0.sixty_four? 0.5.sixty_four?]
        },
        "sixty_five?" => {
          name: "sixty_five?",
          description: "returns whether the decimal is sixty five.",
          examples: %w[65.0.sixty_five? 66.0.sixty_five? 0.5.sixty_five?]
        },
        "sixty_six?" => {
          name: "sixty_six?",
          description: "returns whether the decimal is sixty six.",
          examples: %w[66.0.sixty_six? 67.0.sixty_six? 0.5.sixty_six?]
        },
        "sixty_seven?" => {
          name: "sixty_seven?",
          description: "returns whether the decimal is sixty seven.",
          examples: %w[67.0.sixty_seven? 68.0.sixty_seven? 0.5.sixty_seven?]
        },
        "sixty_eight?" => {
          name: "sixty_eight?",
          description: "returns whether the decimal is sixty eight.",
          examples: %w[68.0.sixty_eight? 69.0.sixty_eight? 0.5.sixty_eight?]
        },
        "sixty_nine?" => {
          name: "sixty_nine?",
          description: "returns whether the decimal is sixty nine.",
          examples: %w[69.0.sixty_nine? 70.0.sixty_nine? 0.5.sixty_nine?]
        },
        "seventy?" => {
          name: "seventy?",
          description: "returns whether the decimal is seventy.",
          examples: %w[70.0.seventy? 71.0.seventy? 0.5.seventy?]
        },
        "seventy_one?" => {
          name: "seventy_one?",
          description: "returns whether the decimal is seventy one.",
          examples: %w[71.0.seventy_one? 72.0.seventy_one? 0.5.seventy_one?]
        },
        "seventy_two?" => {
          name: "seventy_two?",
          description: "returns whether the decimal is seventy two.",
          examples: %w[72.0.seventy_two? 73.0.seventy_two? 0.5.seventy_two?]
        },
        "seventy_three?" => {
          name: "seventy_three?",
          description: "returns whether the decimal is seventy three.",
          examples: %w[
            73.0.seventy_three?
            74.0.seventy_three?
            0.5.seventy_three?
          ]
        },
        "seventy_four?" => {
          name: "seventy_four?",
          description: "returns whether the decimal is seventy four.",
          examples: %w[74.0.seventy_four? 75.0.seventy_four? 0.5.seventy_four?]
        },
        "seventy_five?" => {
          name: "seventy_five?",
          description: "returns whether the decimal is seventy five.",
          examples: %w[75.0.seventy_five? 76.0.seventy_five? 0.5.seventy_five?]
        },
        "seventy_six?" => {
          name: "seventy_six?",
          description: "returns whether the decimal is seventy six.",
          examples: %w[76.0.seventy_six? 77.0.seventy_six? 0.5.seventy_six?]
        },
        "seventy_seven?" => {
          name: "seventy_seven?",
          description: "returns whether the decimal is seventy seven.",
          examples: %w[
            77.0.seventy_seven?
            78.0.seventy_seven?
            0.5.seventy_seven?
          ]
        },
        "seventy_eight?" => {
          name: "seventy_eight?",
          description: "returns whether the decimal is seventy eight.",
          examples: %w[
            78.0.seventy_eight?
            79.0.seventy_eight?
            0.5.seventy_eight?
          ]
        },
        "seventy_nine?" => {
          name: "seventy_nine?",
          description: "returns whether the decimal is seventy nine.",
          examples: %w[79.0.seventy_nine? 80.0.seventy_nine? 0.5.seventy_nine?]
        },
        "eighty?" => {
          name: "eighty?",
          description: "returns whether the decimal is eighty.",
          examples: %w[80.0.eighty? 81.0.eighty? 0.5.eighty?]
        },
        "eighty_one?" => {
          name: "eighty_one?",
          description: "returns whether the decimal is eighty one.",
          examples: %w[81.0.eighty_one? 82.0.eighty_one? 0.5.eighty_one?]
        },
        "eighty_two?" => {
          name: "eighty_two?",
          description: "returns whether the decimal is eighty two.",
          examples: %w[82.0.eighty_two? 83.0.eighty_two? 0.5.eighty_two?]
        },
        "eighty_three?" => {
          name: "eighty_three?",
          description: "returns whether the decimal is eighty three.",
          examples: %w[83.0.eighty_three? 84.0.eighty_three? 0.5.eighty_three?]
        },
        "eighty_four?" => {
          name: "eighty_four?",
          description: "returns whether the decimal is eighty four.",
          examples: %w[84.0.eighty_four? 85.0.eighty_four? 0.5.eighty_four?]
        },
        "eighty_five?" => {
          name: "eighty_five?",
          description: "returns whether the decimal is eighty five.",
          examples: %w[85.0.eighty_five? 86.0.eighty_five? 0.5.eighty_five?]
        },
        "eighty_six?" => {
          name: "eighty_six?",
          description: "returns whether the decimal is eighty six.",
          examples: %w[86.0.eighty_six? 87.0.eighty_six? 0.5.eighty_six?]
        },
        "eighty_seven?" => {
          name: "eighty_seven?",
          description: "returns whether the decimal is eighty seven.",
          examples: %w[87.0.eighty_seven? 88.0.eighty_seven? 0.5.eighty_seven?]
        },
        "eighty_eight?" => {
          name: "eighty_eight?",
          description: "returns whether the decimal is eighty eight.",
          examples: %w[88.0.eighty_eight? 89.0.eighty_eight? 0.5.eighty_eight?]
        },
        "eighty_nine?" => {
          name: "eighty_nine?",
          description: "returns whether the decimal is eighty nine.",
          examples: %w[89.0.eighty_nine? 90.0.eighty_nine? 0.5.eighty_nine?]
        },
        "ninety?" => {
          name: "ninety?",
          description: "returns whether the decimal is ninety.",
          examples: %w[90.0.ninety? 91.0.ninety? 0.5.ninety?]
        },
        "ninety_one?" => {
          name: "ninety_one?",
          description: "returns whether the decimal is ninety one.",
          examples: %w[91.0.ninety_one? 92.0.ninety_one? 0.5.ninety_one?]
        },
        "ninety_two?" => {
          name: "ninety_two?",
          description: "returns whether the decimal is ninety two.",
          examples: %w[92.0.ninety_two? 93.0.ninety_two? 0.5.ninety_two?]
        },
        "ninety_three?" => {
          name: "ninety_three?",
          description: "returns whether the decimal is ninety three.",
          examples: %w[93.0.ninety_three? 94.0.ninety_three? 0.5.ninety_three?]
        },
        "ninety_four?" => {
          name: "ninety_four?",
          description: "returns whether the decimal is ninety four.",
          examples: %w[94.0.ninety_four? 95.0.ninety_four? 0.5.ninety_four?]
        },
        "ninety_five?" => {
          name: "ninety_five?",
          description: "returns whether the decimal is ninety five.",
          examples: %w[95.0.ninety_five? 96.0.ninety_five? 0.5.ninety_five?]
        },
        "ninety_six?" => {
          name: "ninety_six?",
          description: "returns whether the decimal is ninety six.",
          examples: %w[96.0.ninety_six? 97.0.ninety_six? 0.5.ninety_six?]
        },
        "ninety_seven?" => {
          name: "ninety_seven?",
          description: "returns whether the decimal is ninety seven.",
          examples: %w[97.0.ninety_seven? 98.0.ninety_seven? 0.5.ninety_seven?]
        },
        "ninety_eight?" => {
          name: "ninety_eight?",
          description: "returns whether the decimal is ninety eight.",
          examples: %w[98.0.ninety_eight? 99.0.ninety_eight? 0.5.ninety_eight?]
        },
        "ninety_nine?" => {
          name: "ninety_nine?",
          description: "returns whether the decimal is ninety nine.",
          examples: %w[99.0.ninety_nine? 100.0.ninety_nine? 0.5.ninety_nine?]
        },
        "one_hundred?" => {
          name: "one_hundred?",
          description: "returns whether the decimal is one hundred.",
          examples: %w[100.0.one_hundred? 101.0.one_hundred? 0.5.one_hundred?]
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
        when "divide"
          sig(args) { Integer | Decimal }
          code_divide(code_value)
        when "divide_modulo"
          sig(args) { Integer | Decimal }
          code_divide_modulo(code_value)
        when "decimal_divide"
          sig(args) { Integer | Decimal }
          code_decimal_divide(code_value)
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
        when "clamp"
          sig(args) { [Integer | Decimal, Integer | Decimal] }
          code_clamp(*code_arguments.raw)
        when "day", "days"
          sig(args)
          code_days
        when "floor"
          sig(args) { Integer.maybe }
          code_floor(code_value)
        when "hour", "hours"
          sig(args)
          code_hours
        when "minute", "minutes"
          sig(args)
          code_minutes
        when "month", "months"
          sig(args)
          code_months
        when "next", "successor"
          sig(args)
          code_next
        when "next_decimal"
          sig(args)
          code_next_decimal
        when "previous", "predecessor"
          sig(args)
          code_previous
        when "previous_decimal"
          sig(args)
          code_previous_decimal
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
        when "truncate"
          sig(args) { Integer.maybe }
          code_truncate(code_value)
        when "to_fixed"
          sig(args) { Integer.maybe }
          code_to_fixed(code_value)
        when "to_precision"
          sig(args) { Integer.maybe }
          code_to_precision(code_value)
        when "to_exponential"
          sig(args) { Integer.maybe }
          code_to_exponential(code_value)
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
        when "not_a_number?"
          sig(args)
          code_not_a_number?
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

      def code_division(other)
        code_other = other.to_code

        Decimal.new(raw / code_other.raw)
      end

      def code_decimal_divide(other)
        code_division(other)
      end

      def code_floor(n = nil)
        code_n = n.to_code
        code_n = Integer.new(0) if code_n.nothing?

        Decimal.new(raw.floor(code_n.raw))
      end

      def code_days
        Duration.new(raw.days)
      end

      def code_hours
        Duration.new(raw.hours)
      end

      def code_minutes
        Duration.new(raw.minutes)
      end

      def code_months
        Duration.new(::ActiveSupport::Duration.months(raw))
      end

      def code_seconds
        Duration.new(raw.seconds)
      end

      def code_weeks
        Duration.new(raw.weeks)
      end

      def code_years
        Duration.new(::ActiveSupport::Duration.years(raw))
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

      def code_to_string
        String.new(raw.to_s("F"))
      end

      def code_to_fixed(digits = nil)
        code_digits = digits.to_code
        code_digits = Integer.new(0) if code_digits.nothing?

        String.new(format("%.#{code_digits.raw}f", raw))
      end

      def code_to_precision(precision = nil)
        code_precision = precision.to_code
        if code_precision.nothing?
          code_precision =
            Integer.new(
              raw.to_s("F").delete(".-").length
            )
        end

        String.new(format("%.#{code_precision.raw}g", raw))
      end

      def code_to_exponential(digits = nil)
        code_digits = digits.to_code
        code_digits = Integer.new(6) if code_digits.nothing?

        String.new(format("%.#{code_digits.raw}e", raw))
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

      def code_next_decimal
        code_next
      end

      def code_previous_decimal
        code_previous
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
        Boolean.new(raw.frac.zero?)
      end

      def code_finite?
        Boolean.new(raw.finite?)
      end

      def code_infinite?
        Boolean.new(!!raw.infinite?)
      end

      def code_not_a_number?
        Boolean.new(raw.nan?)
      end

      def code_numerator
        Integer.new(raw.to_r.numerator)
      end

      def code_denominator
        Integer.new(raw.to_r.denominator)
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
