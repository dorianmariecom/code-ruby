# frozen_string_literal: true

class Code
  class Object
    class List < Object
      delegate(
        :code_many?,
        :code_positive?,
        :code_negative?,
        :code_zero?,
        :code_one?,
        :code_two?,
        :code_three?,
        :code_four?,
        :code_five?,
        :code_six?,
        :code_seven?,
        :code_eight?,
        :code_nine?,
        :code_ten?,
        :code_eleven?,
        :code_twelve?,
        :code_thirteen?,
        :code_fourteen?,
        :code_fifteen?,
        :code_sixteen?,
        :code_seventeen?,
        :code_eighteen?,
        :code_nineteen?,
        :code_twenty?,
        :code_twenty_one?,
        :code_twenty_two?,
        :code_twenty_three?,
        :code_twenty_four?,
        :code_twenty_five?,
        :code_twenty_six?,
        :code_twenty_seven?,
        :code_twenty_eight?,
        :code_twenty_nine?,
        :code_thirty?,
        :code_thirty_one?,
        :code_thirty_two?,
        :code_thirty_three?,
        :code_thirty_four?,
        :code_thirty_five?,
        :code_thirty_six?,
        :code_thirty_seven?,
        :code_thirty_eight?,
        :code_thirty_nine?,
        :code_forty?,
        :code_forty_one?,
        :code_forty_two?,
        :code_forty_three?,
        :code_forty_four?,
        :code_forty_five?,
        :code_forty_six?,
        :code_forty_seven?,
        :code_forty_eight?,
        :code_forty_nine?,
        :code_fifty?,
        :code_fifty_one?,
        :code_fifty_two?,
        :code_fifty_three?,
        :code_fifty_four?,
        :code_fifty_five?,
        :code_fifty_six?,
        :code_fifty_seven?,
        :code_fifty_eight?,
        :code_fifty_nine?,
        :code_sixty?,
        :code_sixty_one?,
        :code_sixty_two?,
        :code_sixty_three?,
        :code_sixty_four?,
        :code_sixty_five?,
        :code_sixty_six?,
        :code_sixty_seven?,
        :code_sixty_eight?,
        :code_sixty_nine?,
        :code_seventy?,
        :code_seventy_one?,
        :code_seventy_two?,
        :code_seventy_three?,
        :code_seventy_four?,
        :code_seventy_five?,
        :code_seventy_six?,
        :code_seventy_seven?,
        :code_seventy_eight?,
        :code_seventy_nine?,
        :code_eighty?,
        :code_eighty_one?,
        :code_eighty_two?,
        :code_eighty_three?,
        :code_eighty_four?,
        :code_eighty_five?,
        :code_eighty_six?,
        :code_eighty_seven?,
        :code_eighty_eight?,
        :code_eighty_nine?,
        :code_ninety?,
        :code_ninety_one?,
        :code_ninety_two?,
        :code_ninety_three?,
        :code_ninety_four?,
        :code_ninety_five?,
        :code_ninety_six?,
        :code_ninety_seven?,
        :code_ninety_eight?,
        :code_ninety_nine?,
        :code_one_hundred?,
        to: :code_size
      )

      def initialize(*args, **_kargs, &_block)
        self.raw =
          if args.first.is_a?(List)
            args.first.raw.map(&:to_code)
          elsif args.first.is_a?(Dictionary)
            args.first.raw.to_a.map(&:to_code)
          elsif args.first.is_an?(::Array)
            args.first.map(&:to_code)
          elsif args.first.is_a?(::Hash)
            args.first.to_a.map(&:to_code)
          else
            []
          end
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        globals = multi_fetch(args, *GLOBALS)
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "[]", "at", "get"
          sig(args) { Integer }
          code_get(code_value)
        when "fetch"
          sig(args) { Integer }
          code_fetch(code_value)
        when "values_at"
          sig(args) { Integer.repeat(1) }
          code_values_at(*code_arguments.raw)
        when "slice"
          sig(args) { [Object, Integer.maybe] }
          code_slice(*code_arguments.raw)
        when "slice!"
          sig(args) { [Object, Integer.maybe] }
          code_slice!(*code_arguments.raw)
        when "clear"
          sig(args)
          code_clear
        when "join"
          sig(args) { String.maybe }
          code_join(code_value)
        when "sort"
          sig(args) { Function.maybe }
          code_sort(code_value, **globals)
        when "sort!"
          sig(args) { Function.maybe }
          code_sort!(code_value, **globals)
        when "<<", "append"
          sig(args) { Object }
          code_append(code_value)
        when "push"
          sig(args) { Object }
          code_push(code_value)
        when "prepend"
          sig(args) { Object }
          code_prepend(code_value)
        when "insert"
          sig(args) { [Integer, Object] }
          code_insert(*code_arguments.raw)
        when "concat"
          sig(args) { List.repeat(1) }
          code_concat(*code_arguments.raw)
        when "fill"
          sig(args) { [Object, Integer.maybe, Integer.maybe] }
          code_fill(*code_arguments.raw)
        when "+", "plus"
          sig(args) { List.maybe }
          code_arguments.any? ? code_plus(code_value) : code_self
        when "-", "minus"
          sig(args) { List }
          code_minus(code_value)
        when "any?"
          sig(args) { (Function | Class).maybe }
          code_any?(code_value, **globals)
        when "detect"
          sig(args) { (Function | Class).maybe }
          code_detect(code_value, **globals)
        when "index", "find_index"
          sig(args) { (Object | Function | Class).maybe }
          code_index(code_value, **globals)
        when "right_index"
          sig(args) { (Object | Function | Class).maybe }
          code_right_index(code_value, **globals)
        when "each"
          sig(args) { (Function | Class).maybe }
          code_each(code_value, **globals)
        when "each_index"
          sig(args) { Function }
          code_each_index(code_value, **globals)
        when "first"
          sig(args) { Integer.maybe }
          code_first(code_value)
        when "second"
          sig(args)
          code_second
        when "third"
          sig(args)
          code_third
        when "fourth"
          sig(args)
          code_fourth
        when "fifth"
          sig(args)
          code_fifth
        when "sixth"
          sig(args)
          code_sixth
        when "seventh"
          sig(args)
          code_seventh
        when "eighth"
          sig(args)
          code_eighth
        when "ninth"
          sig(args)
          code_ninth
        when "tenth"
          sig(args)
          code_tenth
        when "eleventh"
          sig(args)
          code_eleventh
        when "twelfth"
          sig(args)
          code_twelfth
        when "thirteenth"
          sig(args)
          code_thirteenth
        when "fourteenth"
          sig(args)
          code_fourteenth
        when "fifteenth"
          sig(args)
          code_fifteenth
        when "sixteenth"
          sig(args)
          code_sixteenth
        when "seventeenth"
          sig(args)
          code_seventeenth
        when "eighteenth"
          sig(args)
          code_eighteenth
        when "nineteenth"
          sig(args)
          code_nineteenth
        when "twentieth"
          sig(args)
          code_twentieth
        when "twenty_first"
          sig(args)
          code_twenty_first
        when "twenty_second"
          sig(args)
          code_twenty_second
        when "twenty_third"
          sig(args)
          code_twenty_third
        when "twenty_fourth"
          sig(args)
          code_twenty_fourth
        when "twenty_fifth"
          sig(args)
          code_twenty_fifth
        when "twenty_sixth"
          sig(args)
          code_twenty_sixth
        when "twenty_seventh"
          sig(args)
          code_twenty_seventh
        when "twenty_eighth"
          sig(args)
          code_twenty_eighth
        when "twenty_ninth"
          sig(args)
          code_twenty_ninth
        when "thirtieth"
          sig(args)
          code_thirtieth
        when "thirty_first"
          sig(args)
          code_thirty_first
        when "thirty_second"
          sig(args)
          code_thirty_second
        when "thirty_third"
          sig(args)
          code_thirty_third
        when "thirty_fourth"
          sig(args)
          code_thirty_fourth
        when "thirty_fifth"
          sig(args)
          code_thirty_fifth
        when "thirty_sixth"
          sig(args)
          code_thirty_sixth
        when "thirty_seventh"
          sig(args)
          code_thirty_seventh
        when "thirty_eighth"
          sig(args)
          code_thirty_eighth
        when "thirty_ninth"
          sig(args)
          code_thirty_ninth
        when "fortieth"
          sig(args)
          code_fortieth
        when "forty_first"
          sig(args)
          code_forty_first
        when "forty_second"
          sig(args)
          code_forty_second
        when "forty_third"
          sig(args)
          code_forty_third
        when "forty_fourth"
          sig(args)
          code_forty_fourth
        when "forty_fifth"
          sig(args)
          code_forty_fifth
        when "forty_sixth"
          sig(args)
          code_forty_sixth
        when "forty_seventh"
          sig(args)
          code_forty_seventh
        when "forty_eighth"
          sig(args)
          code_forty_eighth
        when "forty_ninth"
          sig(args)
          code_forty_ninth
        when "fiftieth"
          sig(args)
          code_fiftieth
        when "fifty_first"
          sig(args)
          code_fifty_first
        when "fifty_second"
          sig(args)
          code_fifty_second
        when "fifty_third"
          sig(args)
          code_fifty_third
        when "fifty_fourth"
          sig(args)
          code_fifty_fourth
        when "fifty_fifth"
          sig(args)
          code_fifty_fifth
        when "fifty_sixth"
          sig(args)
          code_fifty_sixth
        when "fifty_seventh"
          sig(args)
          code_fifty_seventh
        when "fifty_eighth"
          sig(args)
          code_fifty_eighth
        when "fifty_ninth"
          sig(args)
          code_fifty_ninth
        when "sixtieth"
          sig(args)
          code_sixtieth
        when "sixty_first"
          sig(args)
          code_sixty_first
        when "sixty_second"
          sig(args)
          code_sixty_second
        when "sixty_third"
          sig(args)
          code_sixty_third
        when "sixty_fourth"
          sig(args)
          code_sixty_fourth
        when "sixty_fifth"
          sig(args)
          code_sixty_fifth
        when "sixty_sixth"
          sig(args)
          code_sixty_sixth
        when "sixty_seventh"
          sig(args)
          code_sixty_seventh
        when "sixty_eighth"
          sig(args)
          code_sixty_eighth
        when "sixty_ninth"
          sig(args)
          code_sixty_ninth
        when "seventieth"
          sig(args)
          code_seventieth
        when "seventy_first"
          sig(args)
          code_seventy_first
        when "seventy_second"
          sig(args)
          code_seventy_second
        when "seventy_third"
          sig(args)
          code_seventy_third
        when "seventy_fourth"
          sig(args)
          code_seventy_fourth
        when "seventy_fifth"
          sig(args)
          code_seventy_fifth
        when "seventy_sixth"
          sig(args)
          code_seventy_sixth
        when "seventy_seventh"
          sig(args)
          code_seventy_seventh
        when "seventy_eighth"
          sig(args)
          code_seventy_eighth
        when "seventy_ninth"
          sig(args)
          code_seventy_ninth
        when "eightieth"
          sig(args)
          code_eightieth
        when "eighty_first"
          sig(args)
          code_eighty_first
        when "eighty_second"
          sig(args)
          code_eighty_second
        when "eighty_third"
          sig(args)
          code_eighty_third
        when "eighty_fourth"
          sig(args)
          code_eighty_fourth
        when "eighty_fifth"
          sig(args)
          code_eighty_fifth
        when "eighty_sixth"
          sig(args)
          code_eighty_sixth
        when "eighty_seventh"
          sig(args)
          code_eighty_seventh
        when "eighty_eighth"
          sig(args)
          code_eighty_eighth
        when "eighty_ninth"
          sig(args)
          code_eighty_ninth
        when "ninetieth"
          sig(args)
          code_ninetieth
        when "ninety_first"
          sig(args)
          code_ninety_first
        when "ninety_second"
          sig(args)
          code_ninety_second
        when "ninety_third"
          sig(args)
          code_ninety_third
        when "ninety_fourth"
          sig(args)
          code_ninety_fourth
        when "ninety_fifth"
          sig(args)
          code_ninety_fifth
        when "ninety_sixth"
          sig(args)
          code_ninety_sixth
        when "ninety_seventh"
          sig(args)
          code_ninety_seventh
        when "ninety_eighth"
          sig(args)
          code_ninety_eighth
        when "ninety_ninth"
          sig(args)
          code_ninety_ninth
        when "one_hundredth"
          sig(args)
          code_one_hundredth
        when "sample"
          sig(args) { Integer.maybe }
          code_sample(code_value)
        when "shuffle"
          sig(args)
          code_shuffle
        when "shuffle!"
          sig(args)
          code_shuffle!
        when "flatten"
          sig(args) { Integer.maybe }
          code_flatten(code_value)
        when "delete"
          sig(args) { Object }
          code_delete(code_value)
        when "delete_at"
          sig(args) { Integer }
          code_delete_at(code_value)
        when "delete_if"
          sig(args) { Function | Class }
          code_delete_if(code_value, **globals)
        when "keep_if"
          sig(args) { Function | Class }
          code_keep_if(code_value, **globals)
        when "pop"
          sig(args) { Integer.maybe }
          code_pop(code_value)
        when "pop!"
          sig(args) { Integer.maybe }
          code_pop!(code_value)
        when "shift"
          sig(args) { Integer.maybe }
          code_shift(code_value)
        when "include?"
          sig(args) { Object }
          code_include?(code_value)
        when "last"
          sig(args)
          code_last
        when "take"
          sig(args) { Integer }
          code_take(code_value)
        when "drop"
          sig(args) { Integer }
          code_drop(code_value)
        when "drop_while"
          sig(args) { Function | Class }
          code_drop_while(code_value, **globals)
        when "take_while"
          sig(args) { Function | Class }
          code_take_while(code_value, **globals)
        when "zip"
          sig(args) { List.repeat(1) }
          code_zip(*code_arguments.raw)
        when "map"
          sig(args) { (Function | Class).maybe }
          code_map(code_value, **globals)
        when "map!"
          sig(args) { (Function | Class).maybe }
          code_map!(code_value, **globals)
        when "flat_map"
          sig(args) { Function | Class }
          code_flat_map(code_value, **globals)
        when "max"
          sig(args) { (Function | Class).maybe }
          code_max(code_value, **globals)
        when "maximum"
          sig(args) { (Function | Class).maybe }
          code_maximum(code_value, **globals)
        when "minimum"
          sig(args) { (Function | Class).maybe }
          code_minimum(code_value, **globals)
        when "minimum_maximum"
          sig(args) { (Function | Class).maybe }
          code_minimum_maximum(code_value, **globals)
        when "none?"
          sig(args) { (Function | Class).maybe }
          code_none?(code_value, **globals)
        when "all?"
          sig(args) { (Function | Class).maybe }
          code_all?(code_value, **globals)
        when "reduce"
          sig(args) { (Function | Class).maybe }
          code_reduce(code_value, **globals)
        when "group"
          sig(args) { (Function | Class).maybe }
          code_group(code_value, **globals)
        when "partition"
          sig(args) { Function | Class }
          code_partition(code_value, **globals)
        when "cycle"
          sig(args) { [Integer.maybe, Function.maybe] }
          code_cycle(*code_arguments.raw, **globals)
        when "transpose"
          sig(args)
          code_transpose
        when "combination"
          sig(args) { Integer }
          code_combination(code_value)
        when "permutation"
          sig(args) { Integer.maybe }
          code_permutation(code_value)
        when "product"
          sig(args) { List.repeat(1) }
          code_product(*code_arguments.raw)
        when "repeated_combination"
          sig(args) { Integer }
          code_repeated_combination(code_value)
        when "repeated_permutation"
          sig(args) { Integer }
          code_repeated_permutation(code_value)
        when "reverse"
          sig(args)
          code_reverse
        when "reverse!"
          sig(args)
          code_reverse!
        when "reverse_each"
          sig(args) { Function }
          code_reverse_each(code_value, **globals)
        when "rotate"
          sig(args) { Integer.maybe }
          code_rotate(code_value)
        when "rotate!"
          sig(args) { Integer.maybe }
          code_rotate!(code_value)
        when "union"
          sig(args) { List.repeat(1) }
          code_union(*code_arguments.raw)
        when "intersection"
          sig(args) { List.repeat(1) }
          code_intersection(*code_arguments.raw)
        when "difference"
          sig(args) { List.repeat(1) }
          code_difference(*code_arguments.raw)
        when "intersect?"
          sig(args) { List }
          code_intersect?(code_value)
        when "associate"
          sig(args) { Object }
          code_associate(code_value)
        when "right_associate"
          sig(args) { Object }
          code_right_associate(code_value)
        when "select"
          sig(args) { (Function | Class).maybe }
          code_select(code_value, **globals)
        when "select!"
          sig(args) { (Function | Class).maybe }
          code_select!(code_value, **globals)
        when "compact"
          sig(args) { (Function | Class).maybe }
          code_compact(code_value, **globals)
        when "compact!"
          sig(args) { (Function | Class).maybe }
          code_compact!(code_value, **globals)
        when "reject"
          sig(args) { (Function | Class).maybe }
          code_reject(code_value, **globals)
        when "reject!"
          sig(args) { (Function | Class).maybe }
          code_reject!(code_value, **globals)
        when "size"
          sig(args)
          code_size
        when "empty?"
          sig(args)
          code_empty?
        when "count"
          sig(args) { (Function | Class).maybe }
          code_count(code_value, **globals)
        when "sum"
          sig(args)
          code_sum
        when "tally"
          sig(args)
          code_tally
        when "entries"
          sig(args)
          code_entries
        when "to_dictionary"
          sig(args)
          code_to_dictionary
        when "uniq"
          sig(args) { (Function | Class).maybe }
          code_uniq(code_value, **globals)
        when "sort_by!"
          sig(args) { (Function | Class).maybe }
          code_sort_by!(code_value, **globals)
        when "uniq!"
          sig(args) { (Function | Class).maybe }
          code_uniq!(code_value, **globals)
        when "many?"
          sig(args)
          code_many?
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

      def code_any?(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        Boolean.new(
          raw.any? do |code_element|
            if code_argument.is_a?(Function)
              code_argument
                .call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw).tap { index += 1 }
            else
              true.tap { index += 1 }
            end
          rescue Error::Next => e
            e.code_value.tap { index += 1 }
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_append(other)
        code_other = other.to_code

        raw << code_other

        self
      end

      def code_clear
        raw.clear
        self
      end

      def code_push(other)
        code_append(other)
      end

      def code_prepend(other)
        code_other = other.to_code
        raw.unshift(code_other)
        self
      end

      def code_insert(index, value)
        code_index = index.to_code
        code_value = value.to_code
        raw.insert(code_index.raw, code_value)
        self
      end

      def code_concat(*lists)
        lists.to_code.raw.each { |list| raw.concat(list.raw) }
        self
      end

      def code_fill(value, start = nil, length = nil)
        code_value = value.to_code
        code_start = start.to_code
        code_length = length.to_code

        if code_start.nothing?
          raw.fill(code_value)
        elsif code_length.nothing?
          raw.fill(code_value, code_start.raw)
        else
          raw.fill(code_value, code_start.raw, code_length.raw)
        end

        self
      end

      def code_plus(other)
        code_other = other.to_code

        List.new(raw + code_other.raw)
      end

      def code_minus(other)
        code_other = other.to_code

        List.new(raw - code_other.raw)
      end

      def code_detect(argument = nil, **globals)
        code_argument = argument.to_code

        raw.detect.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          elsif code_argument.is_a?(Class)
            code_element.is_a?(code_argument.raw)
          else
            false
          end
        rescue Error::Next => e
          e.code_value
        end || Nothing.new
      rescue Error::Break => e
        e.code_value
      end

      def code_index(argument = nil, **globals)
        code_argument = argument.to_code

        if code_argument.nothing?
          return Nothing.new
        elsif code_argument.is_a?(Function)
          index =
            raw.index.with_index do |code_element, index|
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              ).truthy?
            rescue Error::Next => e
              e.code_value.truthy?
            end
        elsif code_argument.is_a?(Class)
          index = raw.index { |code_element| code_element.is_a?(code_argument.raw) }
        else
          index = raw.index(code_argument)
        end

        index.nil? ? Nothing.new : Integer.new(index)
      rescue Error::Break => e
        e.code_value
      end

      def code_right_index(argument = nil, **globals)
        code_argument = argument.to_code

        if code_argument.nothing?
          return Nothing.new
        elsif code_argument.is_a?(Function)
          index =
            raw.rindex.with_index do |code_element, index|
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              ).truthy?
            rescue Error::Next => e
              e.code_value.truthy?
            end
        elsif code_argument.is_a?(Class)
          index =
            raw.rindex { |code_element| code_element.is_a?(code_argument.raw) }
        else
          index = raw.rindex(code_argument)
        end

        index.nil? ? Nothing.new : Integer.new(index)
      rescue Error::Break => e
        e.code_value
      end

      def code_each(argument = nil, **globals)
        code_argument = argument.to_code

        raw.each.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            )
          elsif code_argument.is_a?(Class)
            code_argument.raw.new(code_element)
          end
        rescue Error::Next => e
          e.code_value
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_each_index(argument, **globals)
        code_argument = argument.to_code

        raw.each_index do |index|
          code_index = Integer.new(index)
          code_argument.call(
            arguments: List.new([code_index, code_index, self]),
            **globals
          )
        rescue Error::Next => e
          e.code_value
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_first(value = nil)
        code_value = value.to_code

        if code_value.nothing?
          raw.first || Nothing.new
        else
          List.new(raw.first(code_value.raw))
        end
      end

      def code_nth(index)
        raw[index] || Nothing.new
      end

      def code_second
        code_nth(1)
      end

      def code_third
        code_nth(2)
      end

      def code_fourth
        code_nth(3)
      end

      def code_fifth
        code_nth(4)
      end

      def code_sixth
        code_nth(5)
      end

      def code_seventh
        code_nth(6)
      end

      def code_eighth
        code_nth(7)
      end

      def code_ninth
        code_nth(8)
      end

      def code_tenth
        code_nth(9)
      end

      def code_eleventh
        code_nth(10)
      end

      def code_twelfth
        code_nth(11)
      end

      def code_thirteenth
        code_nth(12)
      end

      def code_fourteenth
        code_nth(13)
      end

      def code_fifteenth
        code_nth(14)
      end

      def code_sixteenth
        code_nth(15)
      end

      def code_seventeenth
        code_nth(16)
      end

      def code_eighteenth
        code_nth(17)
      end

      def code_nineteenth
        code_nth(18)
      end

      def code_twentieth
        code_nth(19)
      end

      def code_twenty_first
        code_nth(20)
      end

      def code_twenty_second
        code_nth(21)
      end

      def code_twenty_third
        code_nth(22)
      end

      def code_twenty_fourth
        code_nth(23)
      end

      def code_twenty_fifth
        code_nth(24)
      end

      def code_twenty_sixth
        code_nth(25)
      end

      def code_twenty_seventh
        code_nth(26)
      end

      def code_twenty_eighth
        code_nth(27)
      end

      def code_twenty_ninth
        code_nth(28)
      end

      def code_thirtieth
        code_nth(29)
      end

      def code_thirty_first
        code_nth(30)
      end

      def code_thirty_second
        code_nth(31)
      end

      def code_thirty_third
        code_nth(32)
      end

      def code_thirty_fourth
        code_nth(33)
      end

      def code_thirty_fifth
        code_nth(34)
      end

      def code_thirty_sixth
        code_nth(35)
      end

      def code_thirty_seventh
        code_nth(36)
      end

      def code_thirty_eighth
        code_nth(37)
      end

      def code_thirty_ninth
        code_nth(38)
      end

      def code_fortieth
        code_nth(39)
      end

      def code_forty_first
        code_nth(40)
      end

      def code_forty_second
        code_nth(41)
      end

      def code_forty_third
        code_nth(42)
      end

      def code_forty_fourth
        code_nth(43)
      end

      def code_forty_fifth
        code_nth(44)
      end

      def code_forty_sixth
        code_nth(45)
      end

      def code_forty_seventh
        code_nth(46)
      end

      def code_forty_eighth
        code_nth(47)
      end

      def code_forty_ninth
        code_nth(48)
      end

      def code_fiftieth
        code_nth(49)
      end

      def code_fifty_first
        code_nth(50)
      end

      def code_fifty_second
        code_nth(51)
      end

      def code_fifty_third
        code_nth(52)
      end

      def code_fifty_fourth
        code_nth(53)
      end

      def code_fifty_fifth
        code_nth(54)
      end

      def code_fifty_sixth
        code_nth(55)
      end

      def code_fifty_seventh
        code_nth(56)
      end

      def code_fifty_eighth
        code_nth(57)
      end

      def code_fifty_ninth
        code_nth(58)
      end

      def code_sixtieth
        code_nth(59)
      end

      def code_sixty_first
        code_nth(60)
      end

      def code_sixty_second
        code_nth(61)
      end

      def code_sixty_third
        code_nth(62)
      end

      def code_sixty_fourth
        code_nth(63)
      end

      def code_sixty_fifth
        code_nth(64)
      end

      def code_sixty_sixth
        code_nth(65)
      end

      def code_sixty_seventh
        code_nth(66)
      end

      def code_sixty_eighth
        code_nth(67)
      end

      def code_sixty_ninth
        code_nth(68)
      end

      def code_seventieth
        code_nth(69)
      end

      def code_seventy_first
        code_nth(70)
      end

      def code_seventy_second
        code_nth(71)
      end

      def code_seventy_third
        code_nth(72)
      end

      def code_seventy_fourth
        code_nth(73)
      end

      def code_seventy_fifth
        code_nth(74)
      end

      def code_seventy_sixth
        code_nth(75)
      end

      def code_seventy_seventh
        code_nth(76)
      end

      def code_seventy_eighth
        code_nth(77)
      end

      def code_seventy_ninth
        code_nth(78)
      end

      def code_eightieth
        code_nth(79)
      end

      def code_eighty_first
        code_nth(80)
      end

      def code_eighty_second
        code_nth(81)
      end

      def code_eighty_third
        code_nth(82)
      end

      def code_eighty_fourth
        code_nth(83)
      end

      def code_eighty_fifth
        code_nth(84)
      end

      def code_eighty_sixth
        code_nth(85)
      end

      def code_eighty_seventh
        code_nth(86)
      end

      def code_eighty_eighth
        code_nth(87)
      end

      def code_eighty_ninth
        code_nth(88)
      end

      def code_ninetieth
        code_nth(89)
      end

      def code_ninety_first
        code_nth(90)
      end

      def code_ninety_second
        code_nth(91)
      end

      def code_ninety_third
        code_nth(92)
      end

      def code_ninety_fourth
        code_nth(93)
      end

      def code_ninety_fifth
        code_nth(94)
      end

      def code_ninety_sixth
        code_nth(95)
      end

      def code_ninety_seventh
        code_nth(96)
      end

      def code_ninety_eighth
        code_nth(97)
      end

      def code_ninety_ninth
        code_nth(98)
      end

      def code_one_hundredth
        code_nth(99)
      end

      def code_sample(value = nil)
        code_value = value.to_code

        if code_value.nothing?
          raw.sample || Nothing.new
        else
          List.new(raw.sample(code_value.raw))
        end
      end

      def code_shuffle
        List.new(raw.shuffle)
      end

      def code_shuffle!
        raw.shuffle!
        self
      end

      def code_flatten(level = nil)
        code_level = level.to_code
        code_level = Integer.new(-1) if code_level.nothing?
        level = code_level.raw

        List.new(
          raw.reduce([]) do |acc, code_element|
            if code_element.is_a?(List) && level != 0
              if level.positive?
                acc + code_element.code_flatten(level - 1).raw
              else
                acc + code_element.code_flatten(level).raw
              end
            else
              acc + [code_element]
            end
          end
        )
      end

      def code_delete(value)
        code_value = value.to_code
        raw.delete(code_value) || Nothing.new
      end

      def code_delete_at(index)
        code_index = index.to_code
        raw.delete_at(code_index.raw) || Nothing.new
      end

      def code_delete_if(argument, **globals)
        code_argument = argument.to_code

        raw.delete_if.with_index do |code_element, index|
          if code_argument.is_a?(Class)
            code_element.is_a?(code_argument.raw)
          else
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          end
        rescue Error::Next => e
          e.code_value.truthy?
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_keep_if(argument, **globals)
        code_argument = argument.to_code

        raw.keep_if.with_index do |code_element, index|
          if code_argument.is_a?(Class)
            code_element.is_a?(code_argument.raw)
          else
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          end
        rescue Error::Next => e
          e.code_value.truthy?
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_pop(n = nil)
        code_n = n.to_code
        n = code_n.raw

        code_n.nothing? ? raw.dup.pop || Nothing.new : List.new(raw.dup.pop(n))
      end

      def code_pop!(n = nil)
        code_n = n.to_code
        n = code_n.raw

        code_n.nothing? ? raw.pop || Nothing.new : List.new(raw.pop(n))
      end

      def code_shift(n = nil)
        code_n = n.to_code
        n = code_n.raw

        code_n.nothing? ? raw.shift || Nothing.new : List.new(raw.shift(n))
      end

      def code_include?(other)
        code_other = other.to_code

        Boolean.new(raw.include?(code_other))
      end

      def code_last
        raw.last || Nothing.new
      end

      def code_take(n)
        code_n = n.to_code
        List.new(raw.take(code_n.raw))
      end

      def code_drop(n)
        code_n = n.to_code
        List.new(raw.drop(code_n.raw))
      end

      def code_drop_while(argument, **globals)
        code_argument = argument.to_code

        List.new(
          raw.drop_while.with_index do |code_element, index|
            if code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw)
            else
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              ).truthy?
            end
          rescue Error::Next => e
            e.code_value.truthy?
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_take_while(argument, **globals)
        code_argument = argument.to_code

        List.new(
          raw.take_while.with_index do |code_element, index|
            if code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw)
            else
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              ).truthy?
            end
          rescue Error::Next => e
            e.code_value.truthy?
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_zip(*arguments)
        code_arguments = arguments.to_code
        List.new(raw.zip(*code_arguments.raw.map(&:raw)))
      end

      def code_map(argument = nil, **globals)
        code_argument = argument.to_code

        List.new(
          raw.map.with_index do |code_element, index|
            if code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
            elsif code_argument.is_a?(Class)
              code_argument.raw.new(code_element)
            else
              Nothing.new
            end
          rescue Error::Next => e
            e.code_value
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_map!(argument = nil, **globals)
        code_argument = argument.to_code

        raw.map!.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            )
          elsif code_argument.is_a?(Class)
            code_argument.raw.new(code_element)
          else
            Nothing.new
          end
        rescue Error::Next => e
          e.code_value
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_flat_map(argument = nil, **globals)
        code_argument = argument.to_code

        List.new(
          raw.flat_map.with_index do |code_element, index|
            result =
              if code_argument.is_a?(Function)
                code_argument.call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
              elsif code_argument.is_a?(Class)
                code_argument.raw.new(code_element)
              else
                Nothing.new
              end

            result.is_a?(List) ? result.raw : result
          rescue Error::Next => e
            e.code_value.is_a?(List) ? e.code_value.raw : e.code_value
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_max(argument = nil, **globals)
        code_argument = argument.to_code

        raw.max_by.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          else
            code_element
          end
        rescue Error::Next => e
          e.code_value
        end || Nothing.new
      rescue Error::Break => e
        e.code_value
      end

      def code_maximum(argument = nil, **globals)
        code_max(argument, **globals)
      end

      def code_minimum(argument = nil, **globals)
        code_argument = argument.to_code

        raw.min_by.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            )
          else
            code_element
          end
        rescue Error::Next => e
          e.code_value
        end || Nothing.new
      rescue Error::Break => e
        e.code_value
      end

      def code_minimum_maximum(argument = nil, **globals)
        code_argument = argument.to_code

        values =
          raw.minmax_by.with_index do |code_element, index|
            if code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
            else
              code_element
            end
          rescue Error::Next => e
            e.code_value
          end

        List.new(values)
      rescue Error::Break => e
        e.code_value
      end

      def code_none?(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        Boolean.new(
          raw.none? do |code_element|
            if code_argument.is_a?(Function)
              code_argument
                .call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw).tap { index += 1 }
            else
              true.tap { index += 1 }
            end
          rescue Error::Next => e
            e.code_value.truthy?.tap { index += 1 }
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_all?(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        Boolean.new(
          raw.all? do |code_element|
            if code_argument.is_a?(Function)
              code_argument
                .call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw).tap { index += 1 }
            else
              true.tap { index += 1 }
            end
          rescue Error::Next => e
            e.code_value.truthy?.tap { index += 1 }
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_reduce(argument = nil, **globals)
        code_argument = argument.to_code

        index = 0

        raw.reduce do |code_acc, code_element|
          if code_argument.is_a?(Function)
            code_argument
              .call(
                arguments:
                  List.new([code_acc, code_element, Integer.new(index), self]),
                **globals
              )
              .tap { index += 1 }
          else
            code_acc.tap { index += 1 }
          end
        rescue Error::Next => e
          e.code_value.tap { index += 1 }
        end || Nothing.new
      rescue Error::Break => e
        e.code_value
      end

      def code_group(argument = nil, **globals)
        code_argument = argument.to_code

        grouped =
          raw.group_by.with_index do |code_element, index|
            if code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
            elsif code_argument.is_a?(Class)
              Boolean.new(code_element.is_a?(code_argument.raw))
            else
              code_element
            end
          rescue Error::Next => e
            e.code_value
          end

        Dictionary.new(grouped.transform_values { |values| List.new(values) })
      rescue Error::Break => e
        e.code_value
      end

      def code_partition(argument, **globals)
        code_argument = argument.to_code

        lists =
          raw.partition.with_index do |code_element, index|
            if code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              ).truthy?
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw)
            else
              false
            end
          rescue Error::Next => e
            e.code_value.truthy?
          end

        List.new(lists.map { |list| List.new(list) })
      rescue Error::Break => e
        e.code_value
      end

      def code_cycle(times = nil, function = nil, **globals)
        code_times = times.to_code
        code_function = function.to_code

        if code_times.is_a?(Function)
          code_function = code_times
          code_times = Integer.new(1)
        elsif code_times.nothing?
          code_times = Integer.new(1)
        end

        cycled = raw.cycle(code_times.raw)

        if code_function.is_a?(Function)
          cycled.each.with_index do |code_element, index|
            code_function.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            )
          rescue Error::Next => e
            e.code_value
          end

          self
        else
          List.new(cycled.to_a)
        end
      rescue Error::Break => e
        e.code_value
      end

      def code_transpose
        List.new(raw.map(&:raw).transpose)
      end

      def code_combination(size)
        code_size = size.to_code
        List.new(raw.combination(code_size.raw).map { |values| List.new(values) })
      end

      def code_permutation(size = nil)
        code_size = size.to_code
        size = code_size.nothing? ? raw.size : code_size.raw

        List.new(raw.permutation(size).map { |values| List.new(values) })
      end

      def code_product(*lists)
        code_lists = lists.to_code

        List.new(
          raw
            .product(*code_lists.raw.map(&:raw))
            .map { |values| List.new(values) }
        )
      end

      def code_repeated_combination(size)
        code_size = size.to_code

        List.new(
          raw
            .repeated_combination(code_size.raw)
            .map { |values| List.new(values) }
        )
      end

      def code_repeated_permutation(size)
        code_size = size.to_code

        List.new(
          raw
            .repeated_permutation(code_size.raw)
            .map { |values| List.new(values) }
        )
      end

      def code_reverse
        List.new(raw.reverse)
      end

      def code_reverse!
        raw.reverse!
        self
      end

      def code_reverse_each(argument, **globals)
        code_argument = argument.to_code

        raw.reverse_each.with_index do |code_element, index|
          code_argument.call(
            arguments: List.new([code_element, Integer.new(index), self]),
            **globals
          )
        rescue Error::Next => e
          e.code_value
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_rotate(count = nil)
        code_count = count.to_code
        code_count = Integer.new(1) if code_count.nothing?

        List.new(raw.rotate(code_count.raw))
      end

      def code_rotate!(count = nil)
        self.raw = code_rotate(count).raw
        self
      end

      def code_union(*lists)
        List.new(raw.union(*lists.to_code.raw.map(&:raw)))
      end

      def code_intersection(*lists)
        List.new(raw.intersection(*lists.to_code.raw.map(&:raw)))
      end

      def code_difference(*lists)
        List.new(raw.difference(*lists.to_code.raw.map(&:raw)))
      end

      def code_intersect?(list)
        code_list = list.to_code

        Boolean.new(raw.intersect?(code_list.raw))
      end

      def code_associate(value)
        code_value = value.to_code
        pair =
          raw.detect do |element|
            element.is_a?(List) && element.raw.first == code_value
          end

        pair || Nothing.new
      end

      def code_right_associate(value)
        code_value = value.to_code
        pair =
          raw.detect do |element|
            element.is_a?(List) && element.raw.second == code_value
          end

        pair || Nothing.new
      end

      def code_compact(argument = nil, **globals)
        code_argument = argument.to_code

        List.new(
          raw.reject.with_index do |code_element, index|
            if code_argument.nothing?
              code_element.nothing?
            elsif code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              ).truthy?
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw)
            else
              false
            end
          rescue Error::Next => e
            e.code_value.truthy?
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_compact!(argument = nil, **globals)
        code_argument = argument.to_code

        raw.reject!.with_index do |code_element, index|
          if code_argument.nothing?
            code_element.nothing?
          elsif code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          elsif code_argument.is_a?(Class)
            code_element.is_a?(code_argument.raw)
          else
            false
          end
        rescue Error::Next => e
          e.code_value.truthy?
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_select(argument = nil, **globals)
        code_argument = argument.to_code

        List.new(
          raw.select.with_index do |code_element, index|
            if code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              ).truthy?
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw)
            else
              false
            end
          rescue Error::Next => e
            e.code_value.truthy?
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_select!(argument = nil, **globals)
        code_argument = argument.to_code

        raw.select!.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          elsif code_argument.is_a?(Class)
            code_element.is_a?(code_argument.raw)
          else
            false
          end
        rescue Error::Next => e
          e.code_value.truthy?
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_reject(argument = nil, **globals)
        code_argument = argument.to_code

        List.new(
          raw.reject.with_index do |code_element, index|
            if code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              ).truthy?
            elsif code_argument.is_a?(Class)
              code_element.is_a?(code_argument.raw)
            else
              false
            end
          rescue Error::Next => e
            e.code_value.truthy?
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_reject!(argument = nil, **globals)
        code_argument = argument.to_code

        raw.reject!.with_index do |code_element, index|
          if code_argument.is_a?(Function)
            code_argument.call(
              arguments: List.new([code_element, Integer.new(index), self]),
              **globals
            ).truthy?
          elsif code_argument.is_a?(Class)
            code_element.is_a?(code_argument.raw)
          else
            false
          end
        rescue Error::Next => e
          e.code_value.truthy?
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_join(separator = nil)
        code_separator = separator.to_s.to_code

        String.new(raw.join(code_separator.raw))
      end

      def code_sort(argument = nil, **globals)
        code_argument = argument.to_code

        List.new(
          raw.sort_by.with_index do |code_element, index|
            if code_argument.is_a?(Function)
              code_argument.call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
            else
              code_element
            end
          rescue Error::Next => e
            e.code_value
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_sort!(argument = nil, **globals)
        self.raw = code_sort(argument, **globals).raw
        self
      end

      def code_sort_by!(argument = nil, **globals)
        code_sort!(argument, **globals)
      end

      def code_size
        Integer.new(raw.size)
      end

      def code_empty?
        Boolean.new(raw.empty?)
      end

      def code_count(argument = nil, **globals)
        code_argument = argument.to_code

        if code_argument.nothing?
          return Integer.new(raw.count)
        elsif code_argument.is_a?(Class)
          return Integer.new(raw.count { |element| element.is_a?(code_argument.raw) })
        end

        index = 0
        Integer.new(
          raw.count do |code_element|
            code_argument
              .call(
                arguments: List.new([code_element, Integer.new(index), self]),
                **globals
              )
              .truthy?
              .tap { index += 1 }
          rescue Error::Next => e
            e.code_value.truthy?.tap { index += 1 }
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_tally
        Dictionary.new(raw.tally)
      end

      def code_entries
        List.new(raw)
      end

      def code_uniq(argument = nil, **globals)
        code_argument = argument.to_code

        unless code_argument.is_a?(Function) || code_argument.is_a?(Class)
          return List.new(raw.uniq)
        end

        if code_argument.is_a?(Class)
          return List.new(raw.grep(code_argument.raw).uniq)
        end

        index = 0

        List.new(
          raw.uniq do |code_element|
            if code_argument.is_a?(Function)
              code_argument
                .call(
                  arguments: List.new([code_element, Integer.new(index), self]),
                  **globals
                )
                .tap { index += 1 }
            else
              code_element.tap { index += 1 }
            end
          rescue Error::Next => e
            e.code_value.tap { index += 1 }
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_uniq!(argument = nil, **globals)
        self.raw = code_uniq(argument, **globals).raw
        self
      end

      def code_sum
        raw.inject(&:code_plus) || Nothing.new
      end

      def code_deep_duplicate
        List.new(raw.dup.map(&:code_deep_duplicate))
      end

      def code_get(argument)
        code_argument = argument.to_code

        raw[code_argument.raw] || Nothing.new
      end

      def code_values_at(*indices)
        code_indices = indices.to_code

        List.new(raw.values_at(*code_indices.raw.map(&:raw)))
      end

      def code_slice(*arguments)
        code_arguments = arguments.to_code.raw

        if code_arguments.first.is_a?(Range)
          range = code_arguments.first
          value =
            raw.slice(
              ::Range.new(
                range.code_left.to_i,
                range.code_right.to_i,
                range.exclude_end?
              )
            )

          return value.is_a?(::Array) ? List.new(value) : value.to_code
        end

        value = raw.slice(*code_arguments.map(&:raw))
        value.is_a?(::Array) ? List.new(value) : value.to_code
      end

      def code_slice!(*arguments)
        code_arguments = arguments.to_code.raw

        if code_arguments.first.is_a?(Range)
          range = code_arguments.first
          value =
            raw.slice!(
              ::Range.new(
                range.code_left.to_i,
                range.code_right.to_i,
                range.exclude_end?
              )
            )

          return value.is_a?(::Array) ? List.new(value) : value.to_code
        end

        value = raw.slice!(*code_arguments.map(&:raw))
        value.is_a?(::Array) ? List.new(value) : value.to_code
      end

      def code_set(key, value)
        code_key = key.to_code
        return super unless code_key.is_a?(Integer)

        code_value = value.to_code
        raw[code_key.code_to_integer.raw] = code_value
        code_value
      end

      def code_fetch(key)
        code_key = key.to_code
        return super unless code_key.is_a?(Integer)

        raw.fetch(code_key.code_to_integer.raw, Nothing.new)
      end

      def code_to_dictionary
        Dictionary.new(
          raw.map.with_index.to_h do |element, index|
            if element.is_a?(List) && element.raw.many?
              [element.raw.first, element.raw.second]
            else
              [Integer.new(index), element]
            end
          end
        )
      end

      def any?
        code_any?.truthy?
      end

      def present?
        raw.present?
      end
    end
  end
end
