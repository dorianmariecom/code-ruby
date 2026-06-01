# frozen_string_literal: true

class Code
  class Object
    class List < Object
      CLASS_DOCUMENTATION = {
        name: "List",
        description: "stores ordered values and provides enumerable operations.",
        examples: [
          "[1, 2, 3]",
          "[1, 2, 3].map((value) => { value * 2 })",
          "List.new([1, 2])"
        ]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "[]" => {
          name: "[]",
          description: "returns the item at an index.",
          examples: ["[1, 2, 3][0]", "[1, 2, 3][1]", "[:a, :b][0]"]
        },
        "at" => {
          name: "at",
          description: "returns the item at an index.",
          examples: ["[1, 2, 3].at(0)", "[1, 2, 3].at(1)", "[:a, :b].at(0)"]
        },
        "get" => {
          name: "get",
          description: "returns the item at an index.",
          examples: ["[1, 2, 3].get(0)", "[1, 2, 3].get(1)", "[:a, :b].get(0)"]
        },
        "fetch" => {
          name: "fetch",
          description: "returns the item at an index or nothing when missing.",
          examples: [
            "[1, 2, 3].fetch(0)",
            "[1, 2, 3].fetch(2)",
            "[1].fetch(2)"
          ]
        },
        "values_at" => {
          name: "values_at",
          description: "returns items at multiple indexes.",
          examples: [
            "[1, 2, 3].values_at(0, 2)",
            "[:a, :b, :c].values_at(1, 2)",
            "[1, 2, 3].values_at(0)"
          ]
        },
        "slice" => {
          name: "slice",
          description: "returns a slice from the list.",
          examples: [
            "[1, 2, 3].slice(0)",
            "[1, 2, 3].slice(0, 2)",
            "[:a, :b, :c].slice(1, 2)"
          ]
        },
        "slice!" => {
          name: "slice!",
          description: "removes and returns a slice from the list.",
          examples: [
            "[1, 2, 3].slice!(0)",
            "[1, 2, 3].slice!(0, 2)",
            "[:a, :b, :c].slice!(1, 2)"
          ]
        },
        "clear" => {
          name: "clear",
          description: "removes every item from the list and returns it.",
          examples: ["[1, 2, 3].clear", "[].clear", "[:a].clear"]
        },
        "join" => {
          name: "join",
          description: "returns a string made by joining list items.",
          examples: [
            "[1, 2, 3].join",
            "[1, 2, 3].join(\",\")",
            "[:a, :b].join(\"-\")"
          ]
        },
        "sort" => {
          name: "sort",
          description: "returns a new list sorted by item values or function results.",
          examples: [
            "[3, 1, 2].sort",
            "[:b, :a].sort",
            "[3, 1, 2].sort((x) => { x })"
          ]
        },
        "sort!" => {
          name: "sort!",
          description: "sorts the list in place by item values or function results.",
          examples: [
            "[3, 1, 2].sort!",
            "[:b, :a].sort!",
            "[3, 1, 2].sort!((x) => { x })"
          ]
        },
        "<<" => {
          name: "<<",
          description: "appends an item to the list and returns it.",
          examples: ["[1, 2] << 3", "[] << :a", "[:a] << :b"]
        },
        "append" => {
          name: "append",
          description: "appends an item to the list and returns it.",
          examples: [
            "[1, 2].append(3)",
            "[].append(:a)",
            "[:a].append(:b)"
          ]
        },
        "push" => {
          name: "push",
          description: "appends an item to the list and returns it.",
          examples: ["[1, 2].push(3)", "[].push(:a)", "[:a].push(:b)"]
        },
        "prepend" => {
          name: "prepend",
          description: "prepends an item to the list and returns it.",
          examples: [
            "[2, 3].prepend(1)",
            "[].prepend(:a)",
            "[:b].prepend(:a)"
          ]
        },
        "insert" => {
          name: "insert",
          description: "inserts an item at an index and returns the list.",
          examples: [
            "[1, 3].insert(1, 2)",
            "[:b].insert(0, :a)",
            "[1, 2].insert(2, 3)"
          ]
        },
        "concat" => {
          name: "concat",
          description: "appends lists to the list and returns it.",
          examples: [
            "[1].concat([2])",
            "[1].concat([2], [3])",
            "[].concat([:a])"
          ]
        },
        "fill" => {
          name: "fill",
          description: "replaces list items with a value and returns the list.",
          examples: [
            "[1, 2, 3].fill(0)",
            "[1, 2, 3].fill(0, 1)",
            "[1, 2, 3].fill(0, 1, 2)"
          ]
        },
        "+" => {
          name: "+",
          description: "returns a new list with another list appended.",
          examples: ["[1] + [2]", "[] + [:a]", "[1, 2] + [3]"]
        },
        "plus" => {
          name: "plus",
          description: "returns a new list with another list appended.",
          examples: [
            "[1].plus([2])",
            "[].plus([:a])",
            "[1, 2].plus([3])"
          ]
        },
        "-" => {
          name: "-",
          description: "returns a new list without items from another list.",
          examples: ["[1, 2] - [2]", "[:a, :b] - [:a]", "[1, 2] - []"]
        },
        "minus" => {
          name: "minus",
          description: "returns a new list without items from another list.",
          examples: [
            "[1, 2].minus([2])",
            "[:a, :b].minus([:a])",
            "[1, 2].minus([])"
          ]
        },
        "any?" => {
          name: "any?",
          description: "returns whether any item is present or matches a function or class.",
          examples: [
            "[1, 2, 3].any?",
            "[1, 2, 3].any?((x) => { x > 2 })",
            "[].any?"
          ]
        },
        "detect" => {
          name: "detect",
          description: "returns the first item matched by a function or class.",
          examples: [
            "[1, 2, 3].detect((x) => { x > 1 })",
            "[1, 2, 3].detect(Integer)",
            "[1, 2, 3].detect((x) => { x > 3 })"
          ]
        },
        "index" => {
          name: "index",
          description: "returns the index of an item or first item matched by a function or class.",
          examples: [
            "[:a, :b].index(:b)",
            "[1, 2, 3].index((x) => { x > 1 })",
            "[:a].index(:missing)"
          ]
        },
        "find_index" => {
          name: "find_index",
          description: "returns the index of an item or first item matched by a function or class.",
          examples: [
            "[:a, :b].find_index(:b)",
            "[1, 2, 3].find_index((x) => { x > 1 })",
            "[:a].find_index(:missing)"
          ]
        },
        "right_index" => {
          name: "right_index",
          description: "returns the last index of an item or of an item matched by a function or class.",
          examples: [
            "[:a, :b, :a].right_index(:a)",
            "[1, 2, 3].right_index((x) => { x > 1 })",
            "[:a].right_index(:missing)"
          ]
        },
        "each" => {
          name: "each",
          description: "calls a function or class for each item and returns the list.",
          examples: [
            "[1, 2, 3].each((x) => { x })",
            "[:a, :b].each((x) => { x })",
            "[].each((x) => { x })"
          ]
        },
        "each_index" => {
          name: "each_index",
          description: "calls a function for each item index and returns the list.",
          examples: [
            "[1, 2, 3].each_index((i) => { i })",
            "[:a, :b].each_index((i) => { i })",
            "[].each_index((i) => { i })"
          ]
        },
        "first" => {
          name: "first",
          description: "returns the first item or first items.",
          examples: ["[1, 2, 3].first", "[1, 2, 3].first(2)", "[].first"]
        },
        "second" => {
          name: "second",
          description: "returns the second item.",
          examples: ["[1, 2, 3].second", "[:a, :b].second", "[1].second"]
        },
        "third" => {
          name: "third",
          description: "returns the third item.",
          examples: ["[1, 2, 3].third", "[:a, :b, :c].third", "[1].third"]
        },
        "fourth" => {
          name: "fourth",
          description: "returns the fourth item.",
          examples: ["[1, 2, 3, 4].fourth", "(1..5).to_list.fourth", "[1].fourth"]
        },
        "fifth" => {
          name: "fifth",
          description: "returns the fifth item.",
          examples: ["[1, 2, 3, 4, 5].fifth", "(1..6).to_list.fifth", "[1].fifth"]
        },
        "sixth" => {
          name: "sixth",
          description: "returns the sixth item.",
          examples: ["(1..6).to_list.sixth", "(1..7).to_list.sixth", "[1].sixth"]
        },
        "seventh" => {
          name: "seventh",
          description: "returns the seventh item.",
          examples: [
            "(1..7).to_list.seventh",
            "(1..8).to_list.seventh",
            "[1].seventh"
          ]
        },
        "eighth" => {
          name: "eighth",
          description: "returns the eighth item.",
          examples: [
            "(1..8).to_list.eighth",
            "(1..9).to_list.eighth",
            "[1].eighth"
          ]
        },
        "ninth" => {
          name: "ninth",
          description: "returns the ninth item.",
          examples: [
            "(1..9).to_list.ninth",
            "(1..10).to_list.ninth",
            "[1].ninth"
          ]
        },
        "tenth" => {
          name: "tenth",
          description: "returns the tenth item.",
          examples: [
            "(1..10).to_list.tenth",
            "(1..11).to_list.tenth",
            "[1].tenth"
          ]
        },
        "map" => {
          name: "map",
          description: "returns a new list with each item transformed by a function or class.",
          examples: [
            "[1, 2, 3].map(Integer)",
            "[:1, :2].map(Integer)",
            "[1, 2].map((value) => { value + 1 })"
          ]
        },
        "sample" => {
          name: "sample",
          description: "returns a random item or random items from the list.",
          examples: ["[1, 2, 3].sample", "[1, 2, 3].sample(2)", "[:a].sample"]
        },
        "shuffle" => {
          name: "shuffle",
          description: "returns a new list with items shuffled.",
          examples: ["[1, 2, 3].shuffle", "[:a, :b].shuffle", "[].shuffle"]
        },
        "shuffle!" => {
          name: "shuffle!",
          description: "shuffles the list in place and returns it.",
          examples: ["[1, 2, 3].shuffle!", "[:a, :b].shuffle!", "[].shuffle!"]
        },
        "flatten" => {
          name: "flatten",
          description: "returns a new list with nested lists flattened.",
          examples: [
            "[1, [2, 3]].flatten",
            "[[1], [2]].flatten",
            "[1, 2].flatten"
          ]
        },
        "delete" => {
          name: "delete",
          description: "removes matching items from the list and returns the removed value.",
          examples: [
            "[1, 2, 2].delete(2)",
            "[:a, :b].delete(:a)",
            "[1].delete(2)"
          ]
        },
        "delete_at" => {
          name: "delete_at",
          description: "removes and returns the item at an index.",
          examples: [
            "[1, 2, 3].delete_at(1)",
            "[:a, :b].delete_at(0)",
            "[1].delete_at(2)"
          ]
        },
        "delete_if" => {
          name: "delete_if",
          description: "removes items matched by a function or class and returns the list.",
          examples: [
            "[1, 2, 3].delete_if((x) => { x > 1 })",
            "[:a, :b].delete_if((x) => { x == :a })",
            "[].delete_if((x) => { x })"
          ]
        },
        "keep_if" => {
          name: "keep_if",
          description: "keeps items matched by a function or class and returns the list.",
          examples: [
            "[1, 2, 3].keep_if((x) => { x > 1 })",
            "[:a, :b].keep_if((x) => { x == :a })",
            "[].keep_if((x) => { x })"
          ]
        },
        "pop" => {
          name: "pop",
          description: "returns the last item or last items without mutating the list.",
          examples: ["[1, 2, 3].pop", "[1, 2, 3].pop(2)", "[].pop"]
        },
        "pop!" => {
          name: "pop!",
          description: "removes and returns the last item or last items.",
          examples: ["[1, 2, 3].pop!", "[1, 2, 3].pop!(2)", "[].pop!"]
        },
        "shift" => {
          name: "shift",
          description: "removes and returns the first item or first items.",
          examples: ["[1, 2, 3].shift", "[1, 2, 3].shift(2)", "[].shift"]
        },
        "include?" => {
          name: "include?",
          description: "returns whether the list includes an item.",
          examples: [
            "[1, 2, 3].include?(2)",
            "[:a, :b].include?(:c)",
            "[].include?(1)"
          ]
        },
        "member?" => {
          name: "member?",
          description: "returns whether the list includes an item.",
          examples: [
            "[1, 2, 3].member?(2)",
            "[:a, :b].member?(:c)",
            "[].member?(1)"
          ]
        },
        "last" => {
          name: "last",
          description: "returns the last item.",
          examples: ["[1, 2, 3].last", "[:a, :b].last", "[].last"]
        },
        "take" => {
          name: "take",
          description: "returns the first items from the list.",
          examples: ["[1, 2, 3].take(2)", "[1, 2, 3].take(0)", "[].take(2)"]
        },
        "drop" => {
          name: "drop",
          description: "returns the list after dropping leading items.",
          examples: ["[1, 2, 3].drop(1)", "[1, 2, 3].drop(3)", "[].drop(1)"]
        },
        "drop_while" => {
          name: "drop_while",
          description: "drops leading items while a function or class matches.",
          examples: [
            "[1, 2, 3].drop_while((x) => { x < 3 })",
            "[1, 2, 3].drop_while((x) => { x < 1 })",
            "[].drop_while((x) => { x })"
          ]
        },
        "take_while" => {
          name: "take_while",
          description: "takes leading items while a function or class matches.",
          examples: [
            "[1, 2, 3].take_while((x) => { x < 3 })",
            "[1, 2, 3].take_while((x) => { x < 1 })",
            "[].take_while((x) => { x })"
          ]
        },
        "zip" => {
          name: "zip",
          description: "returns a list by zipping items with other lists.",
          examples: [
            "[1, 2].zip([3, 4])",
            "[:a, :b].zip([1, 2])",
            "[].zip([])"
          ]
        },
        "map!" => {
          name: "map!",
          description: "transforms each item in place and returns the list.",
          examples: [
            "[1, 2, 3].map!((x) => { x + 1 })",
            "[:1, :2].map!(Integer)",
            "[].map!((x) => { x })"
          ]
        },
        "flat_map" => {
          name: "flat_map",
          description: "maps each item and flattens the result one level.",
          examples: [
            "[1, 2].flat_map((x) => { [x, x] })",
            "[[1], [2]].flat_map((x) => { x })",
            "[].flat_map((x) => { [x] })"
          ]
        },
        "max" => {
          name: "max",
          description: "returns the maximum item.",
          examples: ["[1, 3, 2].max", "[:a, :b].max", "[].max"]
        },
        "maximum" => {
          name: "maximum",
          description: "returns the maximum item.",
          examples: [
            "[1, 3, 2].maximum",
            "[:a, :b].maximum",
            "[].maximum"
          ]
        },
        "minimum" => {
          name: "minimum",
          description: "returns the minimum item.",
          examples: [
            "[1, 3, 2].minimum",
            "[:a, :b].minimum",
            "[].minimum"
          ]
        },
        "minimum_maximum" => {
          name: "minimum_maximum",
          description: "returns the minimum and maximum items.",
          examples: [
            "[1, 3, 2].minimum_maximum",
            "[:a, :b].minimum_maximum",
            "[].minimum_maximum"
          ]
        },
        "none?" => {
          name: "none?",
          description: "returns whether no items are present or match a function or class.",
          examples: [
            "[].none?",
            "[1, 2, 3].none?((x) => { x > 3 })",
            "[1, 2, 3].none?((x) => { x > 1 })"
          ]
        },
        "all?" => {
          name: "all?",
          description: "returns whether all items are present or match a function or class.",
          examples: [
            "[1, 2, 3].all?",
            "[1, 2, 3].all?((x) => { x > 0 })",
            "[1, 2, 3].all?((x) => { x > 1 })"
          ]
        },
        "reduce" => {
          name: "reduce",
          description: "combines list items with a function.",
          examples: [
            "[1, 2, 3].reduce((sum, x) => { sum + x })",
            "[1, 2, 3].reduce((sum, x) => { sum * x })",
            "[:a, :b].reduce((left, right) => { left + right })"
          ]
        },
        "group" => {
          name: "group",
          description: "returns a dictionary grouping items by a function result or class match.",
          examples: [
            "[1, 2, 3].group((x) => { x.even? })",
            "[:a, :b].group(String)",
            "[].group((x) => { x })"
          ]
        },
        "partition" => {
          name: "partition",
          description: "splits items into matching and non-matching lists.",
          examples: [
            "[1, 2, 3].partition((x) => { x > 1 })",
            "[:a, :b].partition((x) => { x == :a })",
            "[].partition((x) => { x })"
          ]
        },
        "cycle" => {
          name: "cycle",
          description: "returns cycled items or calls a function for each cycled item.",
          examples: [
            "[1, 2].cycle(2)",
            "[1, 2].cycle(2, (x) => { x })",
            "[:a].cycle(3, (x) => { x })"
          ]
        },
        "transpose" => {
          name: "transpose",
          description: "returns rows and columns swapped.",
          examples: [
            "[[1, 2], [3, 4]].transpose",
            "[[:a, :b], [:c, :d]].transpose",
            "[].transpose"
          ]
        },
        "combination" => {
          name: "combination",
          description: "returns combinations of list items.",
          examples: [
            "[1, 2, 3].combination(2)",
            "[:a, :b, :c].combination(1)",
            "[].combination(2)"
          ]
        },
        "permutation" => {
          name: "permutation",
          description: "returns permutations of list items.",
          examples: [
            "[1, 2, 3].permutation(2)",
            "[:a, :b].permutation",
            "[].permutation"
          ]
        },
        "product" => {
          name: "product",
          description: "returns cartesian products with other lists.",
          examples: [
            "[1, 2].product([3, 4])",
            "[:a, :b].product([1])",
            "[].product([1, 2])"
          ]
        },
        "repeated_combination" => {
          name: "repeated_combination",
          description: "returns repeated combinations of list items.",
          examples: [
            "[1, 2].repeated_combination(2)",
            "[:a, :b].repeated_combination(3)",
            "[].repeated_combination(2)"
          ]
        },
        "repeated_permutation" => {
          name: "repeated_permutation",
          description: "returns repeated permutations of list items.",
          examples: [
            "[1, 2].repeated_permutation(2)",
            "[:a, :b].repeated_permutation(3)",
            "[].repeated_permutation(2)"
          ]
        },
        "reverse" => {
          name: "reverse",
          description: "returns a new list with items in reverse order.",
          examples: ["[1, 2, 3].reverse", "[:a, :b].reverse", "[].reverse"]
        },
        "reverse!" => {
          name: "reverse!",
          description: "reverses the list in place and returns it.",
          examples: ["[1, 2, 3].reverse!", "[:a, :b].reverse!", "[].reverse!"]
        },
        "reverse_each" => {
          name: "reverse_each",
          description: "calls a function for each item in reverse order.",
          examples: [
            "[1, 2, 3].reverse_each((x) => { x })",
            "[:a, :b].reverse_each((x) => { x })",
            "[].reverse_each((x) => { x })"
          ]
        },
        "rotate" => {
          name: "rotate",
          description: "returns a new list rotated by an offset.",
          examples: [
            "[1, 2, 3].rotate",
            "[1, 2, 3].rotate(2)",
            "[:a, :b].rotate"
          ]
        },
        "rotate!" => {
          name: "rotate!",
          description: "rotates the list in place and returns it.",
          examples: [
            "[1, 2, 3].rotate!",
            "[1, 2, 3].rotate!(2)",
            "[:a, :b].rotate!"
          ]
        },
        "union" => {
          name: "union",
          description: "returns a list containing unique items from each list.",
          examples: [
            "[1, 2].union([2, 3])",
            "[:a].union([:b])",
            "[].union([1])"
          ]
        },
        "intersection" => {
          name: "intersection",
          description: "returns items present in every list.",
          examples: [
            "[1, 2].intersection([2, 3])",
            "[:a, :b].intersection([:b])",
            "[].intersection([1])"
          ]
        },
        "difference" => {
          name: "difference",
          description: "returns items not present in another list.",
          examples: [
            "[1, 2].difference([2])",
            "[:a, :b].difference([:a])",
            "[].difference([1])"
          ]
        },
        "intersect?" => {
          name: "intersect?",
          description: "returns whether the list shares items with another list.",
          examples: [
            "[1, 2].intersect?([2, 3])",
            "[:a].intersect?([:b])",
            "[].intersect?([1])"
          ]
        },
        "associate" => {
          name: "associate",
          description: "returns the first nested list whose first item matches a value.",
          examples: [
            "[[:a, 1], [:b, 2]].associate(:a)",
            "[[1, :a], [2, :b]].associate(2)",
            "[[:a, 1]].associate(:missing)"
          ]
        },
        "right_associate" => {
          name: "right_associate",
          description: "returns the first nested list whose second item matches a value.",
          examples: [
            "[[1, :a], [2, :b]].right_associate(:a)",
            "[[:a, 1], [:b, 2]].right_associate(2)",
            "[[:a, 1]].right_associate(:missing)"
          ]
        },
        "select" => {
          name: "select",
          description: "returns items matched by a function or class.",
          examples: [
            "[1, 2, 3].select((x) => { x > 1 })",
            "[1, :a, 2].select(Integer)",
            "[].select((x) => { x })"
          ]
        },
        "filter" => {
          name: "filter",
          description: "returns items matched by a function or class.",
          examples: [
            "[1, 2, 3].filter((x) => { x > 1 })",
            "[1, :a, 2].filter(Integer)",
            "[].filter((x) => { x })"
          ]
        },
        "select!" => {
          name: "select!",
          description: "keeps items matched by a function or class and returns the list.",
          examples: [
            "[1, 2, 3].select!((x) => { x > 1 })",
            "[1, :a, 2].select!(Integer)",
            "[].select!((x) => { x })"
          ]
        },
        "filter!" => {
          name: "filter!",
          description: "keeps items matched by a function or class and returns the list.",
          examples: [
            "[1, 2, 3].filter!((x) => { x > 1 })",
            "[1, :a, 2].filter!(Integer)",
            "[].filter!((x) => { x })"
          ]
        },
        "compact" => {
          name: "compact",
          description: "returns a new list without nothing values or matched items.",
          examples: [
            "[1, nothing, 2].compact",
            "[1, :a, 2].compact(String)",
            "[1, 2, 3].compact((x) => { x > 1 })"
          ]
        },
        "compact!" => {
          name: "compact!",
          description: "removes nothing values or matched items in place and returns the list.",
          examples: [
            "[1, nothing, 2].compact!",
            "[1, :a, 2].compact!(String)",
            "[1, 2, 3].compact!((x) => { x > 1 })"
          ]
        },
        "reject" => {
          name: "reject",
          description: "returns items not matched by a function or class.",
          examples: [
            "[1, 2, 3].reject((x) => { x > 1 })",
            "[1, :a, 2].reject(Integer)",
            "[].reject((x) => { x })"
          ]
        },
        "reject!" => {
          name: "reject!",
          description: "removes items matched by a function or class and returns the list.",
          examples: [
            "[1, 2, 3].reject!((x) => { x > 1 })",
            "[1, :a, 2].reject!(Integer)",
            "[].reject!((x) => { x })"
          ]
        },
        "size" => {
          name: "size",
          description: "returns the number of items in the list.",
          examples: ["[1, 2, 3].size", "[].size", "[:a].size"]
        },
        "length" => {
          name: "length",
          description: "returns the number of items in the list.",
          examples: ["[1, 2, 3].length", "[].length", "[:a].length"]
        },
        "empty?" => {
          name: "empty?",
          description: "returns whether the list has no items.",
          examples: ["[].empty?", "[1].empty?", "[:a, :b].empty?"]
        },
        "count" => {
          name: "count",
          description: "returns the number of items or matching items.",
          examples: [
            "[1, 2, 3].count",
            "[1, 2, 2].count((x) => { x == 2 })",
            "[1, 2, 3].count((x) => { x > 1 })"
          ]
        },
        "sum" => {
          name: "sum",
          description: "returns the sum of list items.",
          examples: ["[1, 2, 3].sum", "[].sum", "[10, 20].sum"]
        },
        "tally" => {
          name: "tally",
          description: "returns a dictionary counting each item.",
          examples: [
            "[:a, :b, :a].tally",
            "[1, 1, 2].tally",
            "[].tally"
          ]
        },
        "entries" => {
          name: "entries",
          description: "returns the list itself.",
          examples: ["[1, 2, 3].entries", "[].entries", "[:a].entries"]
        },
        "to_dictionary" => {
          name: "to_dictionary",
          description: "converts the list to a dictionary using entry pairs or indexes.",
          examples: [
            "[[:a, 1], [:b, 2]].to_dictionary",
            "[\"a\", \"b\"].to_dictionary",
            "[].to_dictionary"
          ]
        },
        "uniq" => {
          name: "uniq",
          description: "returns a new list with duplicate items removed.",
          examples: [
            "[1, 1, 2].uniq",
            "[:a, :a].uniq",
            "[1, 2, 3].uniq((x) => { x > 1 })"
          ]
        },
        "sort_by!" => {
          name: "sort_by!",
          description: "sorts the list in place by function results.",
          examples: [
            "[3, 1, 2].sort_by!((x) => { x })",
            "[:bb, :a].sort_by!((x) => { x.size })",
            "[].sort_by!((x) => { x })"
          ]
        },
        "uniq!" => {
          name: "uniq!",
          description: "removes duplicate items in place and returns the list.",
          examples: [
            "[1, 1, 2].uniq!",
            "[:a, :a].uniq!",
            "[1, 2, 3].uniq!((x) => { x > 1 })"
          ]
        },
        "eleventh" => {
          name: "eleventh",
          description: "returns the eleventh item.",
          examples: [
            "(1..11).to_list.eleventh",
            "(1..12).to_list.eleventh",
            "[].eleventh"
          ]
        },
        "twelfth" => {
          name: "twelfth",
          description: "returns the twelfth item.",
          examples: [
            "(1..12).to_list.twelfth",
            "(1..13).to_list.twelfth",
            "[].twelfth"
          ]
        },
        "thirteenth" => {
          name: "thirteenth",
          description: "returns the thirteenth item.",
          examples: [
            "(1..13).to_list.thirteenth",
            "(1..14).to_list.thirteenth",
            "[].thirteenth"
          ]
        },
        "fourteenth" => {
          name: "fourteenth",
          description: "returns the fourteenth item.",
          examples: [
            "(1..14).to_list.fourteenth",
            "(1..15).to_list.fourteenth",
            "[].fourteenth"
          ]
        },
        "fifteenth" => {
          name: "fifteenth",
          description: "returns the fifteenth item.",
          examples: [
            "(1..15).to_list.fifteenth",
            "(1..16).to_list.fifteenth",
            "[].fifteenth"
          ]
        },
        "sixteenth" => {
          name: "sixteenth",
          description: "returns the sixteenth item.",
          examples: [
            "(1..16).to_list.sixteenth",
            "(1..17).to_list.sixteenth",
            "[].sixteenth"
          ]
        },
        "seventeenth" => {
          name: "seventeenth",
          description: "returns the seventeenth item.",
          examples: [
            "(1..17).to_list.seventeenth",
            "(1..18).to_list.seventeenth",
            "[].seventeenth"
          ]
        },
        "eighteenth" => {
          name: "eighteenth",
          description: "returns the eighteenth item.",
          examples: [
            "(1..18).to_list.eighteenth",
            "(1..19).to_list.eighteenth",
            "[].eighteenth"
          ]
        },
        "nineteenth" => {
          name: "nineteenth",
          description: "returns the nineteenth item.",
          examples: [
            "(1..19).to_list.nineteenth",
            "(1..20).to_list.nineteenth",
            "[].nineteenth"
          ]
        },
        "twentieth" => {
          name: "twentieth",
          description: "returns the twentieth item.",
          examples: [
            "(1..20).to_list.twentieth",
            "(1..21).to_list.twentieth",
            "[].twentieth"
          ]
        },
        "twenty_first" => {
          name: "twenty_first",
          description: "returns the twenty first item.",
          examples: [
            "(1..21).to_list.twenty_first",
            "(1..22).to_list.twenty_first",
            "[].twenty_first"
          ]
        },
        "twenty_second" => {
          name: "twenty_second",
          description: "returns the twenty second item.",
          examples: [
            "(1..22).to_list.twenty_second",
            "(1..23).to_list.twenty_second",
            "[].twenty_second"
          ]
        },
        "twenty_third" => {
          name: "twenty_third",
          description: "returns the twenty third item.",
          examples: [
            "(1..23).to_list.twenty_third",
            "(1..24).to_list.twenty_third",
            "[].twenty_third"
          ]
        },
        "twenty_fourth" => {
          name: "twenty_fourth",
          description: "returns the twenty fourth item.",
          examples: [
            "(1..24).to_list.twenty_fourth",
            "(1..25).to_list.twenty_fourth",
            "[].twenty_fourth"
          ]
        },
        "twenty_fifth" => {
          name: "twenty_fifth",
          description: "returns the twenty fifth item.",
          examples: [
            "(1..25).to_list.twenty_fifth",
            "(1..26).to_list.twenty_fifth",
            "[].twenty_fifth"
          ]
        },
        "twenty_sixth" => {
          name: "twenty_sixth",
          description: "returns the twenty sixth item.",
          examples: [
            "(1..26).to_list.twenty_sixth",
            "(1..27).to_list.twenty_sixth",
            "[].twenty_sixth"
          ]
        },
        "twenty_seventh" => {
          name: "twenty_seventh",
          description: "returns the twenty seventh item.",
          examples: [
            "(1..27).to_list.twenty_seventh",
            "(1..28).to_list.twenty_seventh",
            "[].twenty_seventh"
          ]
        },
        "twenty_eighth" => {
          name: "twenty_eighth",
          description: "returns the twenty eighth item.",
          examples: [
            "(1..28).to_list.twenty_eighth",
            "(1..29).to_list.twenty_eighth",
            "[].twenty_eighth"
          ]
        },
        "twenty_ninth" => {
          name: "twenty_ninth",
          description: "returns the twenty ninth item.",
          examples: [
            "(1..29).to_list.twenty_ninth",
            "(1..30).to_list.twenty_ninth",
            "[].twenty_ninth"
          ]
        },
        "thirtieth" => {
          name: "thirtieth",
          description: "returns the thirtieth item.",
          examples: [
            "(1..30).to_list.thirtieth",
            "(1..31).to_list.thirtieth",
            "[].thirtieth"
          ]
        },
        "thirty_first" => {
          name: "thirty_first",
          description: "returns the thirty first item.",
          examples: [
            "(1..31).to_list.thirty_first",
            "(1..32).to_list.thirty_first",
            "[].thirty_first"
          ]
        },
        "thirty_second" => {
          name: "thirty_second",
          description: "returns the thirty second item.",
          examples: [
            "(1..32).to_list.thirty_second",
            "(1..33).to_list.thirty_second",
            "[].thirty_second"
          ]
        },
        "thirty_third" => {
          name: "thirty_third",
          description: "returns the thirty third item.",
          examples: [
            "(1..33).to_list.thirty_third",
            "(1..34).to_list.thirty_third",
            "[].thirty_third"
          ]
        },
        "thirty_fourth" => {
          name: "thirty_fourth",
          description: "returns the thirty fourth item.",
          examples: [
            "(1..34).to_list.thirty_fourth",
            "(1..35).to_list.thirty_fourth",
            "[].thirty_fourth"
          ]
        },
        "thirty_fifth" => {
          name: "thirty_fifth",
          description: "returns the thirty fifth item.",
          examples: [
            "(1..35).to_list.thirty_fifth",
            "(1..36).to_list.thirty_fifth",
            "[].thirty_fifth"
          ]
        },
        "thirty_sixth" => {
          name: "thirty_sixth",
          description: "returns the thirty sixth item.",
          examples: [
            "(1..36).to_list.thirty_sixth",
            "(1..37).to_list.thirty_sixth",
            "[].thirty_sixth"
          ]
        },
        "thirty_seventh" => {
          name: "thirty_seventh",
          description: "returns the thirty seventh item.",
          examples: [
            "(1..37).to_list.thirty_seventh",
            "(1..38).to_list.thirty_seventh",
            "[].thirty_seventh"
          ]
        },
        "thirty_eighth" => {
          name: "thirty_eighth",
          description: "returns the thirty eighth item.",
          examples: [
            "(1..38).to_list.thirty_eighth",
            "(1..39).to_list.thirty_eighth",
            "[].thirty_eighth"
          ]
        },
        "thirty_ninth" => {
          name: "thirty_ninth",
          description: "returns the thirty ninth item.",
          examples: [
            "(1..39).to_list.thirty_ninth",
            "(1..40).to_list.thirty_ninth",
            "[].thirty_ninth"
          ]
        },
        "fortieth" => {
          name: "fortieth",
          description: "returns the fortieth item.",
          examples: [
            "(1..40).to_list.fortieth",
            "(1..41).to_list.fortieth",
            "[].fortieth"
          ]
        },
        "forty_first" => {
          name: "forty_first",
          description: "returns the forty first item.",
          examples: [
            "(1..41).to_list.forty_first",
            "(1..42).to_list.forty_first",
            "[].forty_first"
          ]
        },
        "forty_second" => {
          name: "forty_second",
          description: "returns the forty second item.",
          examples: [
            "(1..42).to_list.forty_second",
            "(1..43).to_list.forty_second",
            "[].forty_second"
          ]
        },
        "forty_third" => {
          name: "forty_third",
          description: "returns the forty third item.",
          examples: [
            "(1..43).to_list.forty_third",
            "(1..44).to_list.forty_third",
            "[].forty_third"
          ]
        },
        "forty_fourth" => {
          name: "forty_fourth",
          description: "returns the forty fourth item.",
          examples: [
            "(1..44).to_list.forty_fourth",
            "(1..45).to_list.forty_fourth",
            "[].forty_fourth"
          ]
        },
        "forty_fifth" => {
          name: "forty_fifth",
          description: "returns the forty fifth item.",
          examples: [
            "(1..45).to_list.forty_fifth",
            "(1..46).to_list.forty_fifth",
            "[].forty_fifth"
          ]
        },
        "forty_sixth" => {
          name: "forty_sixth",
          description: "returns the forty sixth item.",
          examples: [
            "(1..46).to_list.forty_sixth",
            "(1..47).to_list.forty_sixth",
            "[].forty_sixth"
          ]
        },
        "forty_seventh" => {
          name: "forty_seventh",
          description: "returns the forty seventh item.",
          examples: [
            "(1..47).to_list.forty_seventh",
            "(1..48).to_list.forty_seventh",
            "[].forty_seventh"
          ]
        },
        "forty_eighth" => {
          name: "forty_eighth",
          description: "returns the forty eighth item.",
          examples: [
            "(1..48).to_list.forty_eighth",
            "(1..49).to_list.forty_eighth",
            "[].forty_eighth"
          ]
        },
        "forty_ninth" => {
          name: "forty_ninth",
          description: "returns the forty ninth item.",
          examples: [
            "(1..49).to_list.forty_ninth",
            "(1..50).to_list.forty_ninth",
            "[].forty_ninth"
          ]
        },
        "fiftieth" => {
          name: "fiftieth",
          description: "returns the fiftieth item.",
          examples: [
            "(1..50).to_list.fiftieth",
            "(1..51).to_list.fiftieth",
            "[].fiftieth"
          ]
        },
        "fifty_first" => {
          name: "fifty_first",
          description: "returns the fifty first item.",
          examples: [
            "(1..51).to_list.fifty_first",
            "(1..52).to_list.fifty_first",
            "[].fifty_first"
          ]
        },
        "fifty_second" => {
          name: "fifty_second",
          description: "returns the fifty second item.",
          examples: [
            "(1..52).to_list.fifty_second",
            "(1..53).to_list.fifty_second",
            "[].fifty_second"
          ]
        },
        "fifty_third" => {
          name: "fifty_third",
          description: "returns the fifty third item.",
          examples: [
            "(1..53).to_list.fifty_third",
            "(1..54).to_list.fifty_third",
            "[].fifty_third"
          ]
        },
        "fifty_fourth" => {
          name: "fifty_fourth",
          description: "returns the fifty fourth item.",
          examples: [
            "(1..54).to_list.fifty_fourth",
            "(1..55).to_list.fifty_fourth",
            "[].fifty_fourth"
          ]
        },
        "fifty_fifth" => {
          name: "fifty_fifth",
          description: "returns the fifty fifth item.",
          examples: [
            "(1..55).to_list.fifty_fifth",
            "(1..56).to_list.fifty_fifth",
            "[].fifty_fifth"
          ]
        },
        "fifty_sixth" => {
          name: "fifty_sixth",
          description: "returns the fifty sixth item.",
          examples: [
            "(1..56).to_list.fifty_sixth",
            "(1..57).to_list.fifty_sixth",
            "[].fifty_sixth"
          ]
        },
        "fifty_seventh" => {
          name: "fifty_seventh",
          description: "returns the fifty seventh item.",
          examples: [
            "(1..57).to_list.fifty_seventh",
            "(1..58).to_list.fifty_seventh",
            "[].fifty_seventh"
          ]
        },
        "fifty_eighth" => {
          name: "fifty_eighth",
          description: "returns the fifty eighth item.",
          examples: [
            "(1..58).to_list.fifty_eighth",
            "(1..59).to_list.fifty_eighth",
            "[].fifty_eighth"
          ]
        },
        "fifty_ninth" => {
          name: "fifty_ninth",
          description: "returns the fifty ninth item.",
          examples: [
            "(1..59).to_list.fifty_ninth",
            "(1..60).to_list.fifty_ninth",
            "[].fifty_ninth"
          ]
        },
        "sixtieth" => {
          name: "sixtieth",
          description: "returns the sixtieth item.",
          examples: [
            "(1..60).to_list.sixtieth",
            "(1..61).to_list.sixtieth",
            "[].sixtieth"
          ]
        },
        "sixty_first" => {
          name: "sixty_first",
          description: "returns the sixty first item.",
          examples: [
            "(1..61).to_list.sixty_first",
            "(1..62).to_list.sixty_first",
            "[].sixty_first"
          ]
        },
        "sixty_second" => {
          name: "sixty_second",
          description: "returns the sixty second item.",
          examples: [
            "(1..62).to_list.sixty_second",
            "(1..63).to_list.sixty_second",
            "[].sixty_second"
          ]
        },
        "sixty_third" => {
          name: "sixty_third",
          description: "returns the sixty third item.",
          examples: [
            "(1..63).to_list.sixty_third",
            "(1..64).to_list.sixty_third",
            "[].sixty_third"
          ]
        },
        "sixty_fourth" => {
          name: "sixty_fourth",
          description: "returns the sixty fourth item.",
          examples: [
            "(1..64).to_list.sixty_fourth",
            "(1..65).to_list.sixty_fourth",
            "[].sixty_fourth"
          ]
        },
        "sixty_fifth" => {
          name: "sixty_fifth",
          description: "returns the sixty fifth item.",
          examples: [
            "(1..65).to_list.sixty_fifth",
            "(1..66).to_list.sixty_fifth",
            "[].sixty_fifth"
          ]
        },
        "sixty_sixth" => {
          name: "sixty_sixth",
          description: "returns the sixty sixth item.",
          examples: [
            "(1..66).to_list.sixty_sixth",
            "(1..67).to_list.sixty_sixth",
            "[].sixty_sixth"
          ]
        },
        "sixty_seventh" => {
          name: "sixty_seventh",
          description: "returns the sixty seventh item.",
          examples: [
            "(1..67).to_list.sixty_seventh",
            "(1..68).to_list.sixty_seventh",
            "[].sixty_seventh"
          ]
        },
        "sixty_eighth" => {
          name: "sixty_eighth",
          description: "returns the sixty eighth item.",
          examples: [
            "(1..68).to_list.sixty_eighth",
            "(1..69).to_list.sixty_eighth",
            "[].sixty_eighth"
          ]
        },
        "sixty_ninth" => {
          name: "sixty_ninth",
          description: "returns the sixty ninth item.",
          examples: [
            "(1..69).to_list.sixty_ninth",
            "(1..70).to_list.sixty_ninth",
            "[].sixty_ninth"
          ]
        },
        "seventieth" => {
          name: "seventieth",
          description: "returns the seventieth item.",
          examples: [
            "(1..70).to_list.seventieth",
            "(1..71).to_list.seventieth",
            "[].seventieth"
          ]
        },
        "seventy_first" => {
          name: "seventy_first",
          description: "returns the seventy first item.",
          examples: [
            "(1..71).to_list.seventy_first",
            "(1..72).to_list.seventy_first",
            "[].seventy_first"
          ]
        },
        "seventy_second" => {
          name: "seventy_second",
          description: "returns the seventy second item.",
          examples: [
            "(1..72).to_list.seventy_second",
            "(1..73).to_list.seventy_second",
            "[].seventy_second"
          ]
        },
        "seventy_third" => {
          name: "seventy_third",
          description: "returns the seventy third item.",
          examples: [
            "(1..73).to_list.seventy_third",
            "(1..74).to_list.seventy_third",
            "[].seventy_third"
          ]
        },
        "seventy_fourth" => {
          name: "seventy_fourth",
          description: "returns the seventy fourth item.",
          examples: [
            "(1..74).to_list.seventy_fourth",
            "(1..75).to_list.seventy_fourth",
            "[].seventy_fourth"
          ]
        },
        "seventy_fifth" => {
          name: "seventy_fifth",
          description: "returns the seventy fifth item.",
          examples: [
            "(1..75).to_list.seventy_fifth",
            "(1..76).to_list.seventy_fifth",
            "[].seventy_fifth"
          ]
        },
        "seventy_sixth" => {
          name: "seventy_sixth",
          description: "returns the seventy sixth item.",
          examples: [
            "(1..76).to_list.seventy_sixth",
            "(1..77).to_list.seventy_sixth",
            "[].seventy_sixth"
          ]
        },
        "seventy_seventh" => {
          name: "seventy_seventh",
          description: "returns the seventy seventh item.",
          examples: [
            "(1..77).to_list.seventy_seventh",
            "(1..78).to_list.seventy_seventh",
            "[].seventy_seventh"
          ]
        },
        "seventy_eighth" => {
          name: "seventy_eighth",
          description: "returns the seventy eighth item.",
          examples: [
            "(1..78).to_list.seventy_eighth",
            "(1..79).to_list.seventy_eighth",
            "[].seventy_eighth"
          ]
        },
        "seventy_ninth" => {
          name: "seventy_ninth",
          description: "returns the seventy ninth item.",
          examples: [
            "(1..79).to_list.seventy_ninth",
            "(1..80).to_list.seventy_ninth",
            "[].seventy_ninth"
          ]
        },
        "eightieth" => {
          name: "eightieth",
          description: "returns the eightieth item.",
          examples: [
            "(1..80).to_list.eightieth",
            "(1..81).to_list.eightieth",
            "[].eightieth"
          ]
        },
        "eighty_first" => {
          name: "eighty_first",
          description: "returns the eighty first item.",
          examples: [
            "(1..81).to_list.eighty_first",
            "(1..82).to_list.eighty_first",
            "[].eighty_first"
          ]
        },
        "eighty_second" => {
          name: "eighty_second",
          description: "returns the eighty second item.",
          examples: [
            "(1..82).to_list.eighty_second",
            "(1..83).to_list.eighty_second",
            "[].eighty_second"
          ]
        },
        "eighty_third" => {
          name: "eighty_third",
          description: "returns the eighty third item.",
          examples: [
            "(1..83).to_list.eighty_third",
            "(1..84).to_list.eighty_third",
            "[].eighty_third"
          ]
        },
        "eighty_fourth" => {
          name: "eighty_fourth",
          description: "returns the eighty fourth item.",
          examples: [
            "(1..84).to_list.eighty_fourth",
            "(1..85).to_list.eighty_fourth",
            "[].eighty_fourth"
          ]
        },
        "eighty_fifth" => {
          name: "eighty_fifth",
          description: "returns the eighty fifth item.",
          examples: [
            "(1..85).to_list.eighty_fifth",
            "(1..86).to_list.eighty_fifth",
            "[].eighty_fifth"
          ]
        },
        "eighty_sixth" => {
          name: "eighty_sixth",
          description: "returns the eighty sixth item.",
          examples: [
            "(1..86).to_list.eighty_sixth",
            "(1..87).to_list.eighty_sixth",
            "[].eighty_sixth"
          ]
        },
        "eighty_seventh" => {
          name: "eighty_seventh",
          description: "returns the eighty seventh item.",
          examples: [
            "(1..87).to_list.eighty_seventh",
            "(1..88).to_list.eighty_seventh",
            "[].eighty_seventh"
          ]
        },
        "eighty_eighth" => {
          name: "eighty_eighth",
          description: "returns the eighty eighth item.",
          examples: [
            "(1..88).to_list.eighty_eighth",
            "(1..89).to_list.eighty_eighth",
            "[].eighty_eighth"
          ]
        },
        "eighty_ninth" => {
          name: "eighty_ninth",
          description: "returns the eighty ninth item.",
          examples: [
            "(1..89).to_list.eighty_ninth",
            "(1..90).to_list.eighty_ninth",
            "[].eighty_ninth"
          ]
        },
        "ninetieth" => {
          name: "ninetieth",
          description: "returns the ninetieth item.",
          examples: [
            "(1..90).to_list.ninetieth",
            "(1..91).to_list.ninetieth",
            "[].ninetieth"
          ]
        },
        "ninety_first" => {
          name: "ninety_first",
          description: "returns the ninety first item.",
          examples: [
            "(1..91).to_list.ninety_first",
            "(1..92).to_list.ninety_first",
            "[].ninety_first"
          ]
        },
        "ninety_second" => {
          name: "ninety_second",
          description: "returns the ninety second item.",
          examples: [
            "(1..92).to_list.ninety_second",
            "(1..93).to_list.ninety_second",
            "[].ninety_second"
          ]
        },
        "ninety_third" => {
          name: "ninety_third",
          description: "returns the ninety third item.",
          examples: [
            "(1..93).to_list.ninety_third",
            "(1..94).to_list.ninety_third",
            "[].ninety_third"
          ]
        },
        "ninety_fourth" => {
          name: "ninety_fourth",
          description: "returns the ninety fourth item.",
          examples: [
            "(1..94).to_list.ninety_fourth",
            "(1..95).to_list.ninety_fourth",
            "[].ninety_fourth"
          ]
        },
        "ninety_fifth" => {
          name: "ninety_fifth",
          description: "returns the ninety fifth item.",
          examples: [
            "(1..95).to_list.ninety_fifth",
            "(1..96).to_list.ninety_fifth",
            "[].ninety_fifth"
          ]
        },
        "ninety_sixth" => {
          name: "ninety_sixth",
          description: "returns the ninety sixth item.",
          examples: [
            "(1..96).to_list.ninety_sixth",
            "(1..97).to_list.ninety_sixth",
            "[].ninety_sixth"
          ]
        },
        "ninety_seventh" => {
          name: "ninety_seventh",
          description: "returns the ninety seventh item.",
          examples: [
            "(1..97).to_list.ninety_seventh",
            "(1..98).to_list.ninety_seventh",
            "[].ninety_seventh"
          ]
        },
        "ninety_eighth" => {
          name: "ninety_eighth",
          description: "returns the ninety eighth item.",
          examples: [
            "(1..98).to_list.ninety_eighth",
            "(1..99).to_list.ninety_eighth",
            "[].ninety_eighth"
          ]
        },
        "ninety_ninth" => {
          name: "ninety_ninth",
          description: "returns the ninety ninth item.",
          examples: [
            "(1..99).to_list.ninety_ninth",
            "(1..100).to_list.ninety_ninth",
            "[].ninety_ninth"
          ]
        },
        "one_hundredth" => {
          name: "one_hundredth",
          description: "returns the one hundredth item.",
          examples: [
            "(1..100).to_list.one_hundredth",
            "(1..101).to_list.one_hundredth",
            "[].one_hundredth"
          ]
        },
        "many?" => {
          name: "many?",
          description: "returns whether the list has more than one item.",
          examples: ["[1, 2].many?", "[1].many?", "[].many?"]
        },
        "positive?" => {
          name: "positive?",
          description: "returns whether the list size is positive.",
          examples: ["[1].positive?", "[].positive?", "[1, 2].positive?"]
        },
        "negative?" => {
          name: "negative?",
          description: "returns whether the list size is negative.",
          examples: ["[].negative?", "[1].negative?", "[1, 2].negative?"]
        },
        "zero?" => {
          name: "zero?",
          description: "returns whether the list size is zero.",
          examples: [
            "(1..0).to_list.zero?",
            "(1..1).to_list.zero?",
            "[].zero?"
          ]
        },
        "one?" => {
          name: "one?",
          description: "returns whether the list size is one.",
          examples: [
            "(1..1).to_list.one?",
            "(1..2).to_list.one?",
            "[].one?"
          ]
        },
        "two?" => {
          name: "two?",
          description: "returns whether the list size is two.",
          examples: [
            "(1..2).to_list.two?",
            "(1..3).to_list.two?",
            "[].two?"
          ]
        },
        "three?" => {
          name: "three?",
          description: "returns whether the list size is three.",
          examples: [
            "(1..3).to_list.three?",
            "(1..4).to_list.three?",
            "[].three?"
          ]
        },
        "four?" => {
          name: "four?",
          description: "returns whether the list size is four.",
          examples: [
            "(1..4).to_list.four?",
            "(1..5).to_list.four?",
            "[].four?"
          ]
        },
        "five?" => {
          name: "five?",
          description: "returns whether the list size is five.",
          examples: [
            "(1..5).to_list.five?",
            "(1..6).to_list.five?",
            "[].five?"
          ]
        },
        "six?" => {
          name: "six?",
          description: "returns whether the list size is six.",
          examples: [
            "(1..6).to_list.six?",
            "(1..7).to_list.six?",
            "[].six?"
          ]
        },
        "seven?" => {
          name: "seven?",
          description: "returns whether the list size is seven.",
          examples: [
            "(1..7).to_list.seven?",
            "(1..8).to_list.seven?",
            "[].seven?"
          ]
        },
        "eight?" => {
          name: "eight?",
          description: "returns whether the list size is eight.",
          examples: [
            "(1..8).to_list.eight?",
            "(1..9).to_list.eight?",
            "[].eight?"
          ]
        },
        "nine?" => {
          name: "nine?",
          description: "returns whether the list size is nine.",
          examples: [
            "(1..9).to_list.nine?",
            "(1..10).to_list.nine?",
            "[].nine?"
          ]
        },
        "ten?" => {
          name: "ten?",
          description: "returns whether the list size is ten.",
          examples: [
            "(1..10).to_list.ten?",
            "(1..11).to_list.ten?",
            "[].ten?"
          ]
        },
        "eleven?" => {
          name: "eleven?",
          description: "returns whether the list size is eleven.",
          examples: [
            "(1..11).to_list.eleven?",
            "(1..12).to_list.eleven?",
            "[].eleven?"
          ]
        },
        "twelve?" => {
          name: "twelve?",
          description: "returns whether the list size is twelve.",
          examples: [
            "(1..12).to_list.twelve?",
            "(1..13).to_list.twelve?",
            "[].twelve?"
          ]
        },
        "thirteen?" => {
          name: "thirteen?",
          description: "returns whether the list size is thirteen.",
          examples: [
            "(1..13).to_list.thirteen?",
            "(1..14).to_list.thirteen?",
            "[].thirteen?"
          ]
        },
        "fourteen?" => {
          name: "fourteen?",
          description: "returns whether the list size is fourteen.",
          examples: [
            "(1..14).to_list.fourteen?",
            "(1..15).to_list.fourteen?",
            "[].fourteen?"
          ]
        },
        "fifteen?" => {
          name: "fifteen?",
          description: "returns whether the list size is fifteen.",
          examples: [
            "(1..15).to_list.fifteen?",
            "(1..16).to_list.fifteen?",
            "[].fifteen?"
          ]
        },
        "sixteen?" => {
          name: "sixteen?",
          description: "returns whether the list size is sixteen.",
          examples: [
            "(1..16).to_list.sixteen?",
            "(1..17).to_list.sixteen?",
            "[].sixteen?"
          ]
        },
        "seventeen?" => {
          name: "seventeen?",
          description: "returns whether the list size is seventeen.",
          examples: [
            "(1..17).to_list.seventeen?",
            "(1..18).to_list.seventeen?",
            "[].seventeen?"
          ]
        },
        "eighteen?" => {
          name: "eighteen?",
          description: "returns whether the list size is eighteen.",
          examples: [
            "(1..18).to_list.eighteen?",
            "(1..19).to_list.eighteen?",
            "[].eighteen?"
          ]
        },
        "nineteen?" => {
          name: "nineteen?",
          description: "returns whether the list size is nineteen.",
          examples: [
            "(1..19).to_list.nineteen?",
            "(1..20).to_list.nineteen?",
            "[].nineteen?"
          ]
        },
        "twenty?" => {
          name: "twenty?",
          description: "returns whether the list size is twenty.",
          examples: [
            "(1..20).to_list.twenty?",
            "(1..21).to_list.twenty?",
            "[].twenty?"
          ]
        },
        "twenty_one?" => {
          name: "twenty_one?",
          description: "returns whether the list size is twenty one.",
          examples: [
            "(1..21).to_list.twenty_one?",
            "(1..22).to_list.twenty_one?",
            "[].twenty_one?"
          ]
        },
        "twenty_two?" => {
          name: "twenty_two?",
          description: "returns whether the list size is twenty two.",
          examples: [
            "(1..22).to_list.twenty_two?",
            "(1..23).to_list.twenty_two?",
            "[].twenty_two?"
          ]
        },
        "twenty_three?" => {
          name: "twenty_three?",
          description: "returns whether the list size is twenty three.",
          examples: [
            "(1..23).to_list.twenty_three?",
            "(1..24).to_list.twenty_three?",
            "[].twenty_three?"
          ]
        },
        "twenty_four?" => {
          name: "twenty_four?",
          description: "returns whether the list size is twenty four.",
          examples: [
            "(1..24).to_list.twenty_four?",
            "(1..25).to_list.twenty_four?",
            "[].twenty_four?"
          ]
        },
        "twenty_five?" => {
          name: "twenty_five?",
          description: "returns whether the list size is twenty five.",
          examples: [
            "(1..25).to_list.twenty_five?",
            "(1..26).to_list.twenty_five?",
            "[].twenty_five?"
          ]
        },
        "twenty_six?" => {
          name: "twenty_six?",
          description: "returns whether the list size is twenty six.",
          examples: [
            "(1..26).to_list.twenty_six?",
            "(1..27).to_list.twenty_six?",
            "[].twenty_six?"
          ]
        },
        "twenty_seven?" => {
          name: "twenty_seven?",
          description: "returns whether the list size is twenty seven.",
          examples: [
            "(1..27).to_list.twenty_seven?",
            "(1..28).to_list.twenty_seven?",
            "[].twenty_seven?"
          ]
        },
        "twenty_eight?" => {
          name: "twenty_eight?",
          description: "returns whether the list size is twenty eight.",
          examples: [
            "(1..28).to_list.twenty_eight?",
            "(1..29).to_list.twenty_eight?",
            "[].twenty_eight?"
          ]
        },
        "twenty_nine?" => {
          name: "twenty_nine?",
          description: "returns whether the list size is twenty nine.",
          examples: [
            "(1..29).to_list.twenty_nine?",
            "(1..30).to_list.twenty_nine?",
            "[].twenty_nine?"
          ]
        },
        "thirty?" => {
          name: "thirty?",
          description: "returns whether the list size is thirty.",
          examples: [
            "(1..30).to_list.thirty?",
            "(1..31).to_list.thirty?",
            "[].thirty?"
          ]
        },
        "thirty_one?" => {
          name: "thirty_one?",
          description: "returns whether the list size is thirty one.",
          examples: [
            "(1..31).to_list.thirty_one?",
            "(1..32).to_list.thirty_one?",
            "[].thirty_one?"
          ]
        },
        "thirty_two?" => {
          name: "thirty_two?",
          description: "returns whether the list size is thirty two.",
          examples: [
            "(1..32).to_list.thirty_two?",
            "(1..33).to_list.thirty_two?",
            "[].thirty_two?"
          ]
        },
        "thirty_three?" => {
          name: "thirty_three?",
          description: "returns whether the list size is thirty three.",
          examples: [
            "(1..33).to_list.thirty_three?",
            "(1..34).to_list.thirty_three?",
            "[].thirty_three?"
          ]
        },
        "thirty_four?" => {
          name: "thirty_four?",
          description: "returns whether the list size is thirty four.",
          examples: [
            "(1..34).to_list.thirty_four?",
            "(1..35).to_list.thirty_four?",
            "[].thirty_four?"
          ]
        },
        "thirty_five?" => {
          name: "thirty_five?",
          description: "returns whether the list size is thirty five.",
          examples: [
            "(1..35).to_list.thirty_five?",
            "(1..36).to_list.thirty_five?",
            "[].thirty_five?"
          ]
        },
        "thirty_six?" => {
          name: "thirty_six?",
          description: "returns whether the list size is thirty six.",
          examples: [
            "(1..36).to_list.thirty_six?",
            "(1..37).to_list.thirty_six?",
            "[].thirty_six?"
          ]
        },
        "thirty_seven?" => {
          name: "thirty_seven?",
          description: "returns whether the list size is thirty seven.",
          examples: [
            "(1..37).to_list.thirty_seven?",
            "(1..38).to_list.thirty_seven?",
            "[].thirty_seven?"
          ]
        },
        "thirty_eight?" => {
          name: "thirty_eight?",
          description: "returns whether the list size is thirty eight.",
          examples: [
            "(1..38).to_list.thirty_eight?",
            "(1..39).to_list.thirty_eight?",
            "[].thirty_eight?"
          ]
        },
        "thirty_nine?" => {
          name: "thirty_nine?",
          description: "returns whether the list size is thirty nine.",
          examples: [
            "(1..39).to_list.thirty_nine?",
            "(1..40).to_list.thirty_nine?",
            "[].thirty_nine?"
          ]
        },
        "forty?" => {
          name: "forty?",
          description: "returns whether the list size is forty.",
          examples: [
            "(1..40).to_list.forty?",
            "(1..41).to_list.forty?",
            "[].forty?"
          ]
        },
        "forty_one?" => {
          name: "forty_one?",
          description: "returns whether the list size is forty one.",
          examples: [
            "(1..41).to_list.forty_one?",
            "(1..42).to_list.forty_one?",
            "[].forty_one?"
          ]
        },
        "forty_two?" => {
          name: "forty_two?",
          description: "returns whether the list size is forty two.",
          examples: [
            "(1..42).to_list.forty_two?",
            "(1..43).to_list.forty_two?",
            "[].forty_two?"
          ]
        },
        "forty_three?" => {
          name: "forty_three?",
          description: "returns whether the list size is forty three.",
          examples: [
            "(1..43).to_list.forty_three?",
            "(1..44).to_list.forty_three?",
            "[].forty_three?"
          ]
        },
        "forty_four?" => {
          name: "forty_four?",
          description: "returns whether the list size is forty four.",
          examples: [
            "(1..44).to_list.forty_four?",
            "(1..45).to_list.forty_four?",
            "[].forty_four?"
          ]
        },
        "forty_five?" => {
          name: "forty_five?",
          description: "returns whether the list size is forty five.",
          examples: [
            "(1..45).to_list.forty_five?",
            "(1..46).to_list.forty_five?",
            "[].forty_five?"
          ]
        },
        "forty_six?" => {
          name: "forty_six?",
          description: "returns whether the list size is forty six.",
          examples: [
            "(1..46).to_list.forty_six?",
            "(1..47).to_list.forty_six?",
            "[].forty_six?"
          ]
        },
        "forty_seven?" => {
          name: "forty_seven?",
          description: "returns whether the list size is forty seven.",
          examples: [
            "(1..47).to_list.forty_seven?",
            "(1..48).to_list.forty_seven?",
            "[].forty_seven?"
          ]
        },
        "forty_eight?" => {
          name: "forty_eight?",
          description: "returns whether the list size is forty eight.",
          examples: [
            "(1..48).to_list.forty_eight?",
            "(1..49).to_list.forty_eight?",
            "[].forty_eight?"
          ]
        },
        "forty_nine?" => {
          name: "forty_nine?",
          description: "returns whether the list size is forty nine.",
          examples: [
            "(1..49).to_list.forty_nine?",
            "(1..50).to_list.forty_nine?",
            "[].forty_nine?"
          ]
        },
        "fifty?" => {
          name: "fifty?",
          description: "returns whether the list size is fifty.",
          examples: [
            "(1..50).to_list.fifty?",
            "(1..51).to_list.fifty?",
            "[].fifty?"
          ]
        },
        "fifty_one?" => {
          name: "fifty_one?",
          description: "returns whether the list size is fifty one.",
          examples: [
            "(1..51).to_list.fifty_one?",
            "(1..52).to_list.fifty_one?",
            "[].fifty_one?"
          ]
        },
        "fifty_two?" => {
          name: "fifty_two?",
          description: "returns whether the list size is fifty two.",
          examples: [
            "(1..52).to_list.fifty_two?",
            "(1..53).to_list.fifty_two?",
            "[].fifty_two?"
          ]
        },
        "fifty_three?" => {
          name: "fifty_three?",
          description: "returns whether the list size is fifty three.",
          examples: [
            "(1..53).to_list.fifty_three?",
            "(1..54).to_list.fifty_three?",
            "[].fifty_three?"
          ]
        },
        "fifty_four?" => {
          name: "fifty_four?",
          description: "returns whether the list size is fifty four.",
          examples: [
            "(1..54).to_list.fifty_four?",
            "(1..55).to_list.fifty_four?",
            "[].fifty_four?"
          ]
        },
        "fifty_five?" => {
          name: "fifty_five?",
          description: "returns whether the list size is fifty five.",
          examples: [
            "(1..55).to_list.fifty_five?",
            "(1..56).to_list.fifty_five?",
            "[].fifty_five?"
          ]
        },
        "fifty_six?" => {
          name: "fifty_six?",
          description: "returns whether the list size is fifty six.",
          examples: [
            "(1..56).to_list.fifty_six?",
            "(1..57).to_list.fifty_six?",
            "[].fifty_six?"
          ]
        },
        "fifty_seven?" => {
          name: "fifty_seven?",
          description: "returns whether the list size is fifty seven.",
          examples: [
            "(1..57).to_list.fifty_seven?",
            "(1..58).to_list.fifty_seven?",
            "[].fifty_seven?"
          ]
        },
        "fifty_eight?" => {
          name: "fifty_eight?",
          description: "returns whether the list size is fifty eight.",
          examples: [
            "(1..58).to_list.fifty_eight?",
            "(1..59).to_list.fifty_eight?",
            "[].fifty_eight?"
          ]
        },
        "fifty_nine?" => {
          name: "fifty_nine?",
          description: "returns whether the list size is fifty nine.",
          examples: [
            "(1..59).to_list.fifty_nine?",
            "(1..60).to_list.fifty_nine?",
            "[].fifty_nine?"
          ]
        },
        "sixty?" => {
          name: "sixty?",
          description: "returns whether the list size is sixty.",
          examples: [
            "(1..60).to_list.sixty?",
            "(1..61).to_list.sixty?",
            "[].sixty?"
          ]
        },
        "sixty_one?" => {
          name: "sixty_one?",
          description: "returns whether the list size is sixty one.",
          examples: [
            "(1..61).to_list.sixty_one?",
            "(1..62).to_list.sixty_one?",
            "[].sixty_one?"
          ]
        },
        "sixty_two?" => {
          name: "sixty_two?",
          description: "returns whether the list size is sixty two.",
          examples: [
            "(1..62).to_list.sixty_two?",
            "(1..63).to_list.sixty_two?",
            "[].sixty_two?"
          ]
        },
        "sixty_three?" => {
          name: "sixty_three?",
          description: "returns whether the list size is sixty three.",
          examples: [
            "(1..63).to_list.sixty_three?",
            "(1..64).to_list.sixty_three?",
            "[].sixty_three?"
          ]
        },
        "sixty_four?" => {
          name: "sixty_four?",
          description: "returns whether the list size is sixty four.",
          examples: [
            "(1..64).to_list.sixty_four?",
            "(1..65).to_list.sixty_four?",
            "[].sixty_four?"
          ]
        },
        "sixty_five?" => {
          name: "sixty_five?",
          description: "returns whether the list size is sixty five.",
          examples: [
            "(1..65).to_list.sixty_five?",
            "(1..66).to_list.sixty_five?",
            "[].sixty_five?"
          ]
        },
        "sixty_six?" => {
          name: "sixty_six?",
          description: "returns whether the list size is sixty six.",
          examples: [
            "(1..66).to_list.sixty_six?",
            "(1..67).to_list.sixty_six?",
            "[].sixty_six?"
          ]
        },
        "sixty_seven?" => {
          name: "sixty_seven?",
          description: "returns whether the list size is sixty seven.",
          examples: [
            "(1..67).to_list.sixty_seven?",
            "(1..68).to_list.sixty_seven?",
            "[].sixty_seven?"
          ]
        },
        "sixty_eight?" => {
          name: "sixty_eight?",
          description: "returns whether the list size is sixty eight.",
          examples: [
            "(1..68).to_list.sixty_eight?",
            "(1..69).to_list.sixty_eight?",
            "[].sixty_eight?"
          ]
        },
        "sixty_nine?" => {
          name: "sixty_nine?",
          description: "returns whether the list size is sixty nine.",
          examples: [
            "(1..69).to_list.sixty_nine?",
            "(1..70).to_list.sixty_nine?",
            "[].sixty_nine?"
          ]
        },
        "seventy?" => {
          name: "seventy?",
          description: "returns whether the list size is seventy.",
          examples: [
            "(1..70).to_list.seventy?",
            "(1..71).to_list.seventy?",
            "[].seventy?"
          ]
        },
        "seventy_one?" => {
          name: "seventy_one?",
          description: "returns whether the list size is seventy one.",
          examples: [
            "(1..71).to_list.seventy_one?",
            "(1..72).to_list.seventy_one?",
            "[].seventy_one?"
          ]
        },
        "seventy_two?" => {
          name: "seventy_two?",
          description: "returns whether the list size is seventy two.",
          examples: [
            "(1..72).to_list.seventy_two?",
            "(1..73).to_list.seventy_two?",
            "[].seventy_two?"
          ]
        },
        "seventy_three?" => {
          name: "seventy_three?",
          description: "returns whether the list size is seventy three.",
          examples: [
            "(1..73).to_list.seventy_three?",
            "(1..74).to_list.seventy_three?",
            "[].seventy_three?"
          ]
        },
        "seventy_four?" => {
          name: "seventy_four?",
          description: "returns whether the list size is seventy four.",
          examples: [
            "(1..74).to_list.seventy_four?",
            "(1..75).to_list.seventy_four?",
            "[].seventy_four?"
          ]
        },
        "seventy_five?" => {
          name: "seventy_five?",
          description: "returns whether the list size is seventy five.",
          examples: [
            "(1..75).to_list.seventy_five?",
            "(1..76).to_list.seventy_five?",
            "[].seventy_five?"
          ]
        },
        "seventy_six?" => {
          name: "seventy_six?",
          description: "returns whether the list size is seventy six.",
          examples: [
            "(1..76).to_list.seventy_six?",
            "(1..77).to_list.seventy_six?",
            "[].seventy_six?"
          ]
        },
        "seventy_seven?" => {
          name: "seventy_seven?",
          description: "returns whether the list size is seventy seven.",
          examples: [
            "(1..77).to_list.seventy_seven?",
            "(1..78).to_list.seventy_seven?",
            "[].seventy_seven?"
          ]
        },
        "seventy_eight?" => {
          name: "seventy_eight?",
          description: "returns whether the list size is seventy eight.",
          examples: [
            "(1..78).to_list.seventy_eight?",
            "(1..79).to_list.seventy_eight?",
            "[].seventy_eight?"
          ]
        },
        "seventy_nine?" => {
          name: "seventy_nine?",
          description: "returns whether the list size is seventy nine.",
          examples: [
            "(1..79).to_list.seventy_nine?",
            "(1..80).to_list.seventy_nine?",
            "[].seventy_nine?"
          ]
        },
        "eighty?" => {
          name: "eighty?",
          description: "returns whether the list size is eighty.",
          examples: [
            "(1..80).to_list.eighty?",
            "(1..81).to_list.eighty?",
            "[].eighty?"
          ]
        },
        "eighty_one?" => {
          name: "eighty_one?",
          description: "returns whether the list size is eighty one.",
          examples: [
            "(1..81).to_list.eighty_one?",
            "(1..82).to_list.eighty_one?",
            "[].eighty_one?"
          ]
        },
        "eighty_two?" => {
          name: "eighty_two?",
          description: "returns whether the list size is eighty two.",
          examples: [
            "(1..82).to_list.eighty_two?",
            "(1..83).to_list.eighty_two?",
            "[].eighty_two?"
          ]
        },
        "eighty_three?" => {
          name: "eighty_three?",
          description: "returns whether the list size is eighty three.",
          examples: [
            "(1..83).to_list.eighty_three?",
            "(1..84).to_list.eighty_three?",
            "[].eighty_three?"
          ]
        },
        "eighty_four?" => {
          name: "eighty_four?",
          description: "returns whether the list size is eighty four.",
          examples: [
            "(1..84).to_list.eighty_four?",
            "(1..85).to_list.eighty_four?",
            "[].eighty_four?"
          ]
        },
        "eighty_five?" => {
          name: "eighty_five?",
          description: "returns whether the list size is eighty five.",
          examples: [
            "(1..85).to_list.eighty_five?",
            "(1..86).to_list.eighty_five?",
            "[].eighty_five?"
          ]
        },
        "eighty_six?" => {
          name: "eighty_six?",
          description: "returns whether the list size is eighty six.",
          examples: [
            "(1..86).to_list.eighty_six?",
            "(1..87).to_list.eighty_six?",
            "[].eighty_six?"
          ]
        },
        "eighty_seven?" => {
          name: "eighty_seven?",
          description: "returns whether the list size is eighty seven.",
          examples: [
            "(1..87).to_list.eighty_seven?",
            "(1..88).to_list.eighty_seven?",
            "[].eighty_seven?"
          ]
        },
        "eighty_eight?" => {
          name: "eighty_eight?",
          description: "returns whether the list size is eighty eight.",
          examples: [
            "(1..88).to_list.eighty_eight?",
            "(1..89).to_list.eighty_eight?",
            "[].eighty_eight?"
          ]
        },
        "eighty_nine?" => {
          name: "eighty_nine?",
          description: "returns whether the list size is eighty nine.",
          examples: [
            "(1..89).to_list.eighty_nine?",
            "(1..90).to_list.eighty_nine?",
            "[].eighty_nine?"
          ]
        },
        "ninety?" => {
          name: "ninety?",
          description: "returns whether the list size is ninety.",
          examples: [
            "(1..90).to_list.ninety?",
            "(1..91).to_list.ninety?",
            "[].ninety?"
          ]
        },
        "ninety_one?" => {
          name: "ninety_one?",
          description: "returns whether the list size is ninety one.",
          examples: [
            "(1..91).to_list.ninety_one?",
            "(1..92).to_list.ninety_one?",
            "[].ninety_one?"
          ]
        },
        "ninety_two?" => {
          name: "ninety_two?",
          description: "returns whether the list size is ninety two.",
          examples: [
            "(1..92).to_list.ninety_two?",
            "(1..93).to_list.ninety_two?",
            "[].ninety_two?"
          ]
        },
        "ninety_three?" => {
          name: "ninety_three?",
          description: "returns whether the list size is ninety three.",
          examples: [
            "(1..93).to_list.ninety_three?",
            "(1..94).to_list.ninety_three?",
            "[].ninety_three?"
          ]
        },
        "ninety_four?" => {
          name: "ninety_four?",
          description: "returns whether the list size is ninety four.",
          examples: [
            "(1..94).to_list.ninety_four?",
            "(1..95).to_list.ninety_four?",
            "[].ninety_four?"
          ]
        },
        "ninety_five?" => {
          name: "ninety_five?",
          description: "returns whether the list size is ninety five.",
          examples: [
            "(1..95).to_list.ninety_five?",
            "(1..96).to_list.ninety_five?",
            "[].ninety_five?"
          ]
        },
        "ninety_six?" => {
          name: "ninety_six?",
          description: "returns whether the list size is ninety six.",
          examples: [
            "(1..96).to_list.ninety_six?",
            "(1..97).to_list.ninety_six?",
            "[].ninety_six?"
          ]
        },
        "ninety_seven?" => {
          name: "ninety_seven?",
          description: "returns whether the list size is ninety seven.",
          examples: [
            "(1..97).to_list.ninety_seven?",
            "(1..98).to_list.ninety_seven?",
            "[].ninety_seven?"
          ]
        },
        "ninety_eight?" => {
          name: "ninety_eight?",
          description: "returns whether the list size is ninety eight.",
          examples: [
            "(1..98).to_list.ninety_eight?",
            "(1..99).to_list.ninety_eight?",
            "[].ninety_eight?"
          ]
        },
        "ninety_nine?" => {
          name: "ninety_nine?",
          description: "returns whether the list size is ninety nine.",
          examples: [
            "(1..99).to_list.ninety_nine?",
            "(1..100).to_list.ninety_nine?",
            "[].ninety_nine?"
          ]
        },
        "one_hundred?" => {
          name: "one_hundred?",
          description: "returns whether the list size is one hundred.",
          examples: [
            "(1..100).to_list.one_hundred?",
            "(1..101).to_list.one_hundred?",
            "[].one_hundred?"
          ]
        }
      }.freeze
      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

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
        when "include?", "member?"
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
        when "select", "filter"
          sig(args) { (Function | Class).maybe }
          code_select(code_value, **globals)
        when "select!", "filter!"
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
        when "size", "length"
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

      def code_deep_duplicate(seen = {})
        seen.compare_by_identity unless seen.compare_by_identity?
        return seen[self] if seen.key?(self)

        duplicate = List.new
        seen[self] = duplicate
        duplicate.raw.concat(raw.map { |value| value.code_deep_duplicate(seen) })
        duplicate
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
