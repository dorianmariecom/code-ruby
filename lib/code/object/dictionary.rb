# frozen_string_literal: true

class Code
  class Object
    class Dictionary < ::Code::Object
      CLASS_DOCUMENTATION = {
        name: "Dictionary",
        description:
          "stores keyed values and provides lookup, merge, and enumerable operations.",
        examples: [
          "{ a: 1 }",
          "Dictionary.from_entries([[:a, 1]])",
          "{ a: 1 }.fetch(:a)"
        ]
      }.freeze
      CLASS_FUNCTIONS = {
        "entries" => {
          name: "entries",
          description: "converts a dictionary to a list of key-value entries.",
          examples: [
            "Dictionary.entries({ a: 1 })",
            "Dictionary.entries({ a: 1, b: 2 })",
            "Dictionary.entries({})"
          ]
        },
        "from_entries" => {
          name: "from_entries",
          description: "builds a dictionary from key-value entries.",
          examples: [
            "Dictionary.from_entries([[:a, 1]])",
            "Dictionary.from_entries([[:a, 1], [:b, 2]])",
            "Dictionary.from_entries([])"
          ]
        },
        "assign" => {
          name: "assign",
          description: "merges one or more dictionaries into a new dictionary.",
          examples: [
            "Dictionary.assign({ a: 1 })",
            "Dictionary.assign({ a: 1 }, { b: 2 })",
            "Dictionary.assign({ a: 1 }, { a: 2 })"
          ]
        },
        "has_own?" => {
          name: "has_own?",
          description: "returns whether a dictionary contains a key.",
          examples: [
            "Dictionary.has_own?({ a: 1 }, :a)",
            "Dictionary.has_own?({ a: 1 }, :b)",
            "Dictionary.has_own?({}, :a)"
          ]
        }
      }.freeze
      INSTANCE_FUNCTIONS = {
        "[]" => {
          name: "[]",
          description: "returns the value for a key, otherwise nothing.",
          examples: ["{ a: 1 }[:a]", "{ a: 1 }[:b]", "{ a: 1, b: 2 }[:b]"]
        },
        "at" => {
          name: "at",
          description: "alias for get.",
          examples: [
            "{ a: 1 }.at(:a)",
            "{ a: 1 }.at(:b)",
            "{ a: 1, b: 2 }.at(:b)"
          ]
        },
        "get" => {
          name: "get",
          description: "returns the value for a key, otherwise nothing.",
          examples: [
            "{ a: 1 }.get(:a)",
            "{ a: 1 }.get(:b)",
            "{ a: 1, b: 2 }.get(:b)"
          ]
        },
        "any?" => {
          name: "any?",
          description:
            "returns whether any entry exists, has a class value, or matches a function.",
          examples: [
            "{ a: 1 }.any?",
            "{}.any?",
            "{ a: 1 }.any?((key, value) => { value == 1 })"
          ]
        },
        "clear" => {
          name: "clear",
          description:
            "removes every entry from the dictionary and returns it.",
          examples: ["{ a: 1 }.clear", "{ a: 1, b: 2 }.clear", "{}.clear"]
        },
        "compact" => {
          name: "compact",
          description:
            "returns a dictionary without nothing values or matching values.",
          examples: [
            "{ a: 1, b: nothing }.compact",
            "{ a: 1, b: :x }.compact(String)",
            "{ a: 1, b: 2 }.compact((value) => { value > 1 })"
          ]
        },
        "compact!" => {
          name: "compact!",
          description:
            "removes nothing values or matching values from the dictionary.",
          examples: [
            "{ a: 1, b: nothing }.compact!",
            "{ a: 1, b: :x }.compact!(String)",
            "{ a: 1, b: 2 }.compact!((value) => { value > 1 })"
          ]
        },
        "delete" => {
          name: "delete",
          description: "removes entries by key and returns their values.",
          examples: [
            "{ a: 1 }.delete(:a)",
            "{ a: 1 }.delete(:b)",
            "{ a: 1, b: 2 }.delete(:a, :b)"
          ]
        },
        "delete_if" => {
          name: "delete_if",
          description: "removes entries when a function returns truthy.",
          examples: [
            "{ a: 1, b: 2 }.delete_if((key, value) => { value > 1 })",
            "{ a: 1 }.delete_if((key) => { key == :a })",
            "{ a: 1, b: :x }.delete_if(String)"
          ]
        },
        "delete_unless" => {
          name: "delete_unless",
          description: "removes entries unless a function returns truthy.",
          examples: [
            "{ a: 1, b: 2 }.delete_unless((key, value) => { value > 1 })",
            "{ a: 1 }.delete_unless((key) => { key == :a })",
            "{ a: 1, b: :x }.delete_unless(String)"
          ]
        },
        "dig" => {
          name: "dig",
          description: "returns a nested value by following keys.",
          examples: [
            "{ a: { b: 1 } }.dig(:a, :b)",
            "{ a: [1] }.dig(:a, 0)",
            "{ a: 1 }.dig(:missing)"
          ]
        },
        "each" => {
          name: "each",
          description:
            "calls a function for each key-value pair and returns the dictionary.",
          examples: [
            "{ a: 1 }.each((key, value) => { value })",
            "{ a: 1 }.each((key, value, index) => { index })",
            "{ a: 1 }.each((key, value, index, dictionary) => { dictionary })"
          ]
        },
        "each_key" => {
          name: "each_key",
          description:
            "calls a function for each key and returns the dictionary.",
          examples: [
            "{ a: 1 }.each_key((key) => { key })",
            "{ a: 1, b: 2 }.each_key((key, index) => { index })",
            "{}.each_key((key) => { key })"
          ]
        },
        "each_value" => {
          name: "each_value",
          description:
            "calls a function for each value and returns the dictionary.",
          examples: [
            "{ a: 1 }.each_value((value) => { value })",
            "{ a: 1, b: 2 }.each_value((value, index) => { index })",
            "{}.each_value((value) => { value })"
          ]
        },
        "each_pair" => {
          name: "each_pair",
          description:
            "calls a function for each key-value pair and returns the dictionary.",
          examples: [
            "{ a: 1 }.each_pair((key, value) => { value })",
            "{ a: 1, b: 2 }.each_pair((key, value, index) => { index })",
            "{}.each_pair((key, value) => { value })"
          ]
        },
        "empty?" => {
          name: "empty?",
          description: "returns whether the dictionary has no entries.",
          examples: ["{}.empty?", "{ a: 1 }.empty?", "{ a: nothing }.empty?"]
        },
        "except" => {
          name: "except",
          description: "returns a dictionary without the given keys.",
          examples: [
            "{ a: 1, b: 2 }.except(:a)",
            "{ a: 1, b: 2 }.except(:a, :b)",
            "{ a: 1 }.except(:missing)"
          ]
        },
        "fetch" => {
          name: "fetch",
          description: "returns values by key, default function, or nothing.",
          examples: [
            "{ a: 1 }.fetch(:a)",
            "{ a: 1 }.fetch(:b, () => { 2 })",
            "{ a: 1 }.fetch(:missing)"
          ]
        },
        "fetch_values" => {
          name: "fetch_values",
          description: "returns values for the given keys.",
          examples: [
            "{ a: 1, b: 2 }.fetch_values(:a)",
            "{ a: 1, b: 2 }.fetch_values(:a, :b)",
            "{ a: 1, b: 2 }.fetch_values(:b)"
          ]
        },
        "flatten" => {
          name: "flatten",
          description:
            "returns a flattened list of dictionary keys and values.",
          examples: [
            "{ a: 1 }.flatten",
            "{ a: { b: 1 } }.flatten",
            "{ a: 1 }.flatten(1)"
          ]
        },
        "has_key?" => {
          name: "has_key?",
          description: "returns whether the dictionary contains a key.",
          examples: [
            "{ a: 1 }.has_key?(:a)",
            "{ a: 1 }.has_key?(:b)",
            "{}.has_key?(:a)"
          ]
        },
        "key?" => {
          name: "key?",
          description: "alias for has_key?.",
          examples: ["{ a: 1 }.key?(:a)", "{ a: 1 }.key?(:b)", "{}.key?(:a)"]
        },
        "include?" => {
          name: "include?",
          description: "alias for has_key?.",
          examples: [
            "{ a: 1 }.include?(:a)",
            "{ a: 1 }.include?(:b)",
            "{}.include?(:a)"
          ]
        },
        "member?" => {
          name: "member?",
          description: "alias for has_key?.",
          examples: [
            "{ a: 1 }.member?(:a)",
            "{ a: 1 }.member?(:b)",
            "{}.member?(:a)"
          ]
        },
        "has_own?" => {
          name: "has_own?",
          description: "returns whether the dictionary contains a key.",
          examples: [
            "{ a: 1 }.has_own?(:a)",
            "{ a: 1 }.has_own?(:b)",
            "{}.has_own?(:a)"
          ]
        },
        "has_value?" => {
          name: "has_value?",
          description: "returns whether the dictionary has a value.",
          examples: [
            "{ a: 1 }.has_value?(1)",
            "{ a: 1 }.has_value?(2)",
            "{}.has_value?(1)"
          ]
        },
        "value?" => {
          name: "value?",
          description: "alias for has_value?.",
          examples: ["{ a: 1 }.value?(1)", "{ a: 1 }.value?(2)", "{}.value?(1)"]
        },
        "invert" => {
          name: "invert",
          description: "returns a dictionary with keys and values swapped.",
          examples: ["{ a: 1 }.invert", "{ a: 1, b: 2 }.invert", "{}.invert"]
        },
        "keep_if" => {
          name: "keep_if",
          description: "keeps entries when a function returns truthy.",
          examples: [
            "{ a: 1, b: 2 }.keep_if((key, value) => { value > 1 })",
            "{ a: 1 }.keep_if((key) => { key == :a })",
            "{ a: 1, b: :x }.keep_if(String)"
          ]
        },
        "keep_unless" => {
          name: "keep_unless",
          description: "keeps entries unless a function returns truthy.",
          examples: [
            "{ a: 1, b: 2 }.keep_unless((key, value) => { value > 1 })",
            "{ a: 1 }.keep_unless((key) => { key == :a })",
            "{ a: 1, b: :x }.keep_unless(String)"
          ]
        },
        "key" => {
          name: "key",
          description:
            "returns the first key for a value, or a fallback result.",
          examples: [
            "{ a: 1 }.key(1)",
            "{ a: 1, b: 2 }.key(2)",
            "{ a: 1, b: 2 }.key(0, (value) => { :missing })"
          ]
        },
        "keys" => {
          name: "keys",
          description: "returns the dictionary keys.",
          examples: ["{ a: 1 }.keys", "{ a: 1, b: 2 }.keys", "{}.keys"]
        },
        "map" => {
          name: "map",
          description: "returns a list by calling a function for each entry.",
          examples: [
            "{ a: 1 }.map((key, value) => { key })",
            "{ a: 1 }.map((key, value) => { value })",
            "{ a: 1 }.map((key, value, index) => { index })"
          ]
        },
        "merge" => {
          name: "merge",
          description: "returns a dictionary merged with other dictionaries.",
          examples: [
            "{ a: 1 }.merge({ b: 2 })",
            "{ a: 1 }.merge({ a: 2 })",
            "{ a: 1 }.merge({ a: 2 }, (key, left, right) => { left })"
          ]
        },
        "merge!" => {
          name: "merge!",
          description: "merges other dictionaries into the receiver.",
          examples: [
            "{ a: 1 }.merge!({ b: 2 })",
            "{ a: 1 }.merge!({ a: 2 })",
            "{ a: 1 }.merge!({ a: 2 }, (key, left, right) => { left })"
          ]
        },
        "update" => {
          name: "update",
          description: "alias for merge!.",
          examples: [
            "{ a: 1 }.update({ b: 2 })",
            "{ a: 1 }.update({ a: 2 })",
            "{ a: 1 }.update({ a: 2 }, (key, left, right) => { left })"
          ]
        },
        "replace" => {
          name: "replace",
          description:
            "replaces the dictionary contents with another dictionary.",
          examples: [
            "{ a: 1 }.replace({ b: 2 })",
            "{ a: 1, b: 2 }.replace({})",
            "{}.replace({ a: 1 })"
          ]
        },
        "store" => {
          name: "store",
          description: "sets a key to a value and returns the value.",
          examples: [
            "{ a: 1 }.store(:b, 2)",
            "{}.store(:a, 1)",
            "{ a: 1 }.store(:a, 2)"
          ]
        },
        "shift" => {
          name: "shift",
          description: "removes and returns the first key-value entry.",
          examples: ["{ a: 1 }.shift", "{ a: 1, b: 2 }.shift", "{}.shift"]
        },
        "reject" => {
          name: "reject",
          description:
            "returns a dictionary without entries matching a function.",
          examples: [
            "{ a: 1, b: 2 }.reject((key, value) => { value > 1 })",
            "{ a: 1 }.reject((key) => { key == :a })",
            "{ a: 1, b: :x }.reject(String)"
          ]
        },
        "reject!" => {
          name: "reject!",
          description: "removes entries matching a function.",
          examples: [
            "{ a: 1, b: 2 }.reject!((key, value) => { value > 1 })",
            "{ a: 1 }.reject!((key) => { key == :a })",
            "{ a: 1, b: :x }.reject!(String)"
          ]
        },
        "select" => {
          name: "select",
          description: "returns a dictionary with entries matching a function.",
          examples: [
            "{ a: 1, b: 2 }.select((key, value) => { value > 1 })",
            "{ a: 1 }.select((key) => { key == :a })",
            "{ a: 1, b: :x }.select(String)"
          ]
        },
        "filter" => {
          name: "filter",
          description: "alias for select.",
          examples: [
            "{ a: 1, b: 2 }.filter((key, value) => { value > 1 })",
            "{ a: 1 }.filter((key) => { key == :a })",
            "{ a: 1, b: :x }.filter(String)"
          ]
        },
        "select!" => {
          name: "select!",
          description: "keeps entries matching a function.",
          examples: [
            "{ a: 1, b: 2 }.select!((key, value) => { value > 1 })",
            "{ a: 1 }.select!((key) => { key == :a })",
            "{ a: 1, b: :x }.select!(String)"
          ]
        },
        "filter!" => {
          name: "filter!",
          description: "alias for select!.",
          examples: [
            "{ a: 1, b: 2 }.filter!((key, value) => { value > 1 })",
            "{ a: 1 }.filter!((key) => { key == :a })",
            "{ a: 1, b: :x }.filter!(String)"
          ]
        },
        "set" => {
          name: "set",
          description: "sets a key to a value and returns the dictionary.",
          examples: [
            "{ a: 1 }.set(:b, 2)",
            "{}.set(:a, 1)",
            "{ a: 1 }.set(:a, 2)"
          ]
        },
        "size" => {
          name: "size",
          description: "returns the number of entries.",
          examples: ["{}.size", "{ a: 1 }.size", "{ a: 1, b: 2 }.size"]
        },
        "length" => {
          name: "length",
          description: "alias for size.",
          examples: ["{}.length", "{ a: 1 }.length", "{ a: 1, b: 2 }.length"]
        },
        "slice" => {
          name: "slice",
          description: "returns a dictionary with only the given keys.",
          examples: [
            "{ a: 1, b: 2 }.slice(:a)",
            "{ a: 1, b: 2 }.slice(:a, :b)",
            "{ a: 1 }.slice(:missing)"
          ]
        },
        "to_list" => {
          name: "to_list",
          description: "returns key-value entries as a list.",
          examples: ["{ a: 1 }.to_list", "{ a: 1, b: 2 }.to_list", "{}.to_list"]
        },
        "entries" => {
          name: "entries",
          description: "returns key-value entries as a list.",
          examples: ["{ a: 1 }.entries", "{ a: 1, b: 2 }.entries", "{}.entries"]
        },
        "to_dictionary" => {
          name: "to_dictionary",
          description: "returns the dictionary.",
          examples: [
            "{ a: 1 }.to_dictionary",
            "{ a: 1, b: 2 }.to_dictionary",
            "{}.to_dictionary"
          ]
        },
        "to_context" => {
          name: "to_context",
          description: "converts the dictionary to a context.",
          examples: [
            "{ a: 1 }.to_context",
            "{ a: 1, b: 2 }.to_context",
            "{}.to_context"
          ]
        },
        "to_query" => {
          name: "to_query",
          description: "converts the dictionary to a query string.",
          examples: [
            "{ a: 1 }.to_query",
            "{ a: 1, b: 2 }.to_query",
            "{ q: :ruby }.to_query(:search)"
          ]
        },
        "transform_keys" => {
          name: "transform_keys",
          description:
            "returns a dictionary with keys transformed by a function.",
          examples: [
            "{ a: 1 }.transform_keys((key) => { key.to_string })",
            "{ a: 1 }.transform_keys((key, value) => { value })",
            "{ a: 1 }.transform_keys((key, value, index) => { index })"
          ]
        },
        "transform_keys!" => {
          name: "transform_keys!",
          description: "transforms keys in the receiver with a function.",
          examples: [
            "{ a: 1 }.transform_keys!((key) => { key.to_string })",
            "{ a: 1 }.transform_keys!((key, value) => { value })",
            "{ a: 1 }.transform_keys!((key, value, index) => { index })"
          ]
        },
        "transform_values" => {
          name: "transform_values",
          description:
            "returns a dictionary with values transformed by a key-value function.",
          examples: [
            "{ a: 1 }.transform_values((key, value) => { value + 1 })",
            "{ a: 1 }.transform_values((key, value) => { key })",
            "{ a: 1 }.transform_values((key, value, index) => { index })"
          ]
        },
        "transform_values!" => {
          name: "transform_values!",
          description:
            "transforms values in the receiver with a key-value function.",
          examples: [
            "{ a: 1 }.transform_values!((key, value) => { value + 1 })",
            "{ a: 1 }.transform_values!((key, value) => { key })",
            "{ a: 1 }.transform_values!((key, value, index) => { index })"
          ]
        },
        "values" => {
          name: "values",
          description: "returns all values, values for keys, or mapped values.",
          examples: [
            "{ a: 1, b: 2 }.values",
            "{ a: 1, b: 2 }.values(:a)",
            "{ a: 1, b: 2 }.values(:a, () => { 0 })"
          ]
        },
        "values_at" => {
          name: "values_at",
          description: "returns values for the given keys.",
          examples: [
            "{ a: 1, b: 2 }.values_at(:a)",
            "{ a: 1, b: 2 }.values_at(:a, :b)",
            "{ a: 1 }.values_at(:missing)"
          ]
        },
        "associate" => {
          name: "associate",
          description:
            "returns the key-value entry for a key, otherwise nothing.",
          examples: [
            "{ a: 1 }.associate(:a)",
            "{ a: 1, b: 2 }.associate(:b)",
            "{}.associate(:a)"
          ]
        },
        "right_associate" => {
          name: "right_associate",
          description:
            "returns the first key-value entry for a value, otherwise nothing.",
          examples: [
            "{ a: 1 }.right_associate(1)",
            "{ a: 1, b: 2 }.right_associate(2)",
            "{}.right_associate(1)"
          ]
        },
        "deep_duplicate" => {
          name: "deep_duplicate",
          description: "returns a deep duplicate of the dictionary.",
          examples: [
            "{ a: 1 }.deep_duplicate",
            "{ a: [1] }.deep_duplicate",
            "{}.deep_duplicate"
          ]
        },
        "many?" => {
          name: "many?",
          description:
            "returns whether the dictionary has more than one entry.",
          examples: ["{ a: 1, b: 2 }.many?", "{ a: 1 }.many?", "{}.many?"]
        },
        "positive?" => {
          name: "positive?",
          description: "returns whether the dictionary size is positive.",
          examples: [
            "{ a: 1 }.positive?",
            "{}.positive?",
            "{ a: 1, b: 2 }.positive?"
          ]
        },
        "negative?" => {
          name: "negative?",
          description: "returns whether the dictionary size is negative.",
          examples: [
            "{}.negative?",
            "{ a: 1 }.negative?",
            "{ a: 1, b: 2 }.negative?"
          ]
        },
        "zero?" => {
          name: "zero?",
          description: "returns whether the dictionary size is zero.",
          examples: ["{}.zero?", "{ a: 1 }.zero?", "{ a: 1, b: 2 }.zero?"]
        },
        "one?" => {
          name: "one?",
          description: "returns whether the dictionary size is one.",
          examples: [
            "Dictionary.from_entries((1..1).to_list.map((x) => { [x, x] })).one?",
            "Dictionary.from_entries((1..2).to_list.map((x) => { [x, x] })).one?",
            "{}.one?"
          ]
        },
        "two?" => {
          name: "two?",
          description: "returns whether the dictionary size is two.",
          examples: [
            "Dictionary.from_entries((1..2).to_list.map((x) => { [x, x] })).two?",
            "Dictionary.from_entries((1..3).to_list.map((x) => { [x, x] })).two?",
            "{}.two?"
          ]
        },
        "three?" => {
          name: "three?",
          description: "returns whether the dictionary size is three.",
          examples: [
            "Dictionary.from_entries((1..3).to_list.map((x) => { [x, x] })).three?",
            "Dictionary.from_entries((1..4).to_list.map((x) => { [x, x] })).three?",
            "{}.three?"
          ]
        },
        "four?" => {
          name: "four?",
          description: "returns whether the dictionary size is four.",
          examples: [
            "Dictionary.from_entries((1..4).to_list.map((x) => { [x, x] })).four?",
            "Dictionary.from_entries((1..5).to_list.map((x) => { [x, x] })).four?",
            "{}.four?"
          ]
        },
        "five?" => {
          name: "five?",
          description: "returns whether the dictionary size is five.",
          examples: [
            "Dictionary.from_entries((1..5).to_list.map((x) => { [x, x] })).five?",
            "Dictionary.from_entries((1..6).to_list.map((x) => { [x, x] })).five?",
            "{}.five?"
          ]
        },
        "six?" => {
          name: "six?",
          description: "returns whether the dictionary size is six.",
          examples: [
            "Dictionary.from_entries((1..6).to_list.map((x) => { [x, x] })).six?",
            "Dictionary.from_entries((1..7).to_list.map((x) => { [x, x] })).six?",
            "{}.six?"
          ]
        },
        "seven?" => {
          name: "seven?",
          description: "returns whether the dictionary size is seven.",
          examples: [
            "Dictionary.from_entries((1..7).to_list.map((x) => { [x, x] })).seven?",
            "Dictionary.from_entries((1..8).to_list.map((x) => { [x, x] })).seven?",
            "{}.seven?"
          ]
        },
        "eight?" => {
          name: "eight?",
          description: "returns whether the dictionary size is eight.",
          examples: [
            "Dictionary.from_entries((1..8).to_list.map((x) => { [x, x] })).eight?",
            "Dictionary.from_entries((1..9).to_list.map((x) => { [x, x] })).eight?",
            "{}.eight?"
          ]
        },
        "nine?" => {
          name: "nine?",
          description: "returns whether the dictionary size is nine.",
          examples: [
            "Dictionary.from_entries((1..9).to_list.map((x) => { [x, x] })).nine?",
            "Dictionary.from_entries((1..10).to_list.map((x) => { [x, x] })).nine?",
            "{}.nine?"
          ]
        },
        "ten?" => {
          name: "ten?",
          description: "returns whether the dictionary size is ten.",
          examples: [
            "Dictionary.from_entries((1..10).to_list.map((x) => { [x, x] })).ten?",
            "Dictionary.from_entries((1..11).to_list.map((x) => { [x, x] })).ten?",
            "{}.ten?"
          ]
        },
        "eleven?" => {
          name: "eleven?",
          description: "returns whether the dictionary size is eleven.",
          examples: [
            "Dictionary.from_entries((1..11).to_list.map((x) => { [x, x] })).eleven?",
            "Dictionary.from_entries((1..12).to_list.map((x) => { [x, x] })).eleven?",
            "{}.eleven?"
          ]
        },
        "twelve?" => {
          name: "twelve?",
          description: "returns whether the dictionary size is twelve.",
          examples: [
            "Dictionary.from_entries((1..12).to_list.map((x) => { [x, x] })).twelve?",
            "Dictionary.from_entries((1..13).to_list.map((x) => { [x, x] })).twelve?",
            "{}.twelve?"
          ]
        },
        "thirteen?" => {
          name: "thirteen?",
          description: "returns whether the dictionary size is thirteen.",
          examples: [
            "Dictionary.from_entries((1..13).to_list.map((x) => { [x, x] })).thirteen?",
            "Dictionary.from_entries((1..14).to_list.map((x) => { [x, x] })).thirteen?",
            "{}.thirteen?"
          ]
        },
        "fourteen?" => {
          name: "fourteen?",
          description: "returns whether the dictionary size is fourteen.",
          examples: [
            "Dictionary.from_entries((1..14).to_list.map((x) => { [x, x] })).fourteen?",
            "Dictionary.from_entries((1..15).to_list.map((x) => { [x, x] })).fourteen?",
            "{}.fourteen?"
          ]
        },
        "fifteen?" => {
          name: "fifteen?",
          description: "returns whether the dictionary size is fifteen.",
          examples: [
            "Dictionary.from_entries((1..15).to_list.map((x) => { [x, x] })).fifteen?",
            "Dictionary.from_entries((1..16).to_list.map((x) => { [x, x] })).fifteen?",
            "{}.fifteen?"
          ]
        },
        "sixteen?" => {
          name: "sixteen?",
          description: "returns whether the dictionary size is sixteen.",
          examples: [
            "Dictionary.from_entries((1..16).to_list.map((x) => { [x, x] })).sixteen?",
            "Dictionary.from_entries((1..17).to_list.map((x) => { [x, x] })).sixteen?",
            "{}.sixteen?"
          ]
        },
        "seventeen?" => {
          name: "seventeen?",
          description: "returns whether the dictionary size is seventeen.",
          examples: [
            "Dictionary.from_entries((1..17).to_list.map((x) => { [x, x] })).seventeen?",
            "Dictionary.from_entries((1..18).to_list.map((x) => { [x, x] })).seventeen?",
            "{}.seventeen?"
          ]
        },
        "eighteen?" => {
          name: "eighteen?",
          description: "returns whether the dictionary size is eighteen.",
          examples: [
            "Dictionary.from_entries((1..18).to_list.map((x) => { [x, x] })).eighteen?",
            "Dictionary.from_entries((1..19).to_list.map((x) => { [x, x] })).eighteen?",
            "{}.eighteen?"
          ]
        },
        "nineteen?" => {
          name: "nineteen?",
          description: "returns whether the dictionary size is nineteen.",
          examples: [
            "Dictionary.from_entries((1..19).to_list.map((x) => { [x, x] })).nineteen?",
            "Dictionary.from_entries((1..20).to_list.map((x) => { [x, x] })).nineteen?",
            "{}.nineteen?"
          ]
        },
        "twenty?" => {
          name: "twenty?",
          description: "returns whether the dictionary size is twenty.",
          examples: [
            "Dictionary.from_entries((1..20).to_list.map((x) => { [x, x] })).twenty?",
            "Dictionary.from_entries((1..21).to_list.map((x) => { [x, x] })).twenty?",
            "{}.twenty?"
          ]
        },
        "twenty_one?" => {
          name: "twenty_one?",
          description: "returns whether the dictionary size is twenty one.",
          examples: [
            "Dictionary.from_entries((1..21).to_list.map((x) => { [x, x] })).twenty_one?",
            "Dictionary.from_entries((1..22).to_list.map((x) => { [x, x] })).twenty_one?",
            "{}.twenty_one?"
          ]
        },
        "twenty_two?" => {
          name: "twenty_two?",
          description: "returns whether the dictionary size is twenty two.",
          examples: [
            "Dictionary.from_entries((1..22).to_list.map((x) => { [x, x] })).twenty_two?",
            "Dictionary.from_entries((1..23).to_list.map((x) => { [x, x] })).twenty_two?",
            "{}.twenty_two?"
          ]
        },
        "twenty_three?" => {
          name: "twenty_three?",
          description: "returns whether the dictionary size is twenty three.",
          examples: [
            "Dictionary.from_entries((1..23).to_list.map((x) => { [x, x] })).twenty_three?",
            "Dictionary.from_entries((1..24).to_list.map((x) => { [x, x] })).twenty_three?",
            "{}.twenty_three?"
          ]
        },
        "twenty_four?" => {
          name: "twenty_four?",
          description: "returns whether the dictionary size is twenty four.",
          examples: [
            "Dictionary.from_entries((1..24).to_list.map((x) => { [x, x] })).twenty_four?",
            "Dictionary.from_entries((1..25).to_list.map((x) => { [x, x] })).twenty_four?",
            "{}.twenty_four?"
          ]
        },
        "twenty_five?" => {
          name: "twenty_five?",
          description: "returns whether the dictionary size is twenty five.",
          examples: [
            "Dictionary.from_entries((1..25).to_list.map((x) => { [x, x] })).twenty_five?",
            "Dictionary.from_entries((1..26).to_list.map((x) => { [x, x] })).twenty_five?",
            "{}.twenty_five?"
          ]
        },
        "twenty_six?" => {
          name: "twenty_six?",
          description: "returns whether the dictionary size is twenty six.",
          examples: [
            "Dictionary.from_entries((1..26).to_list.map((x) => { [x, x] })).twenty_six?",
            "Dictionary.from_entries((1..27).to_list.map((x) => { [x, x] })).twenty_six?",
            "{}.twenty_six?"
          ]
        },
        "twenty_seven?" => {
          name: "twenty_seven?",
          description: "returns whether the dictionary size is twenty seven.",
          examples: [
            "Dictionary.from_entries((1..27).to_list.map((x) => { [x, x] })).twenty_seven?",
            "Dictionary.from_entries((1..28).to_list.map((x) => { [x, x] })).twenty_seven?",
            "{}.twenty_seven?"
          ]
        },
        "twenty_eight?" => {
          name: "twenty_eight?",
          description: "returns whether the dictionary size is twenty eight.",
          examples: [
            "Dictionary.from_entries((1..28).to_list.map((x) => { [x, x] })).twenty_eight?",
            "Dictionary.from_entries((1..29).to_list.map((x) => { [x, x] })).twenty_eight?",
            "{}.twenty_eight?"
          ]
        },
        "twenty_nine?" => {
          name: "twenty_nine?",
          description: "returns whether the dictionary size is twenty nine.",
          examples: [
            "Dictionary.from_entries((1..29).to_list.map((x) => { [x, x] })).twenty_nine?",
            "Dictionary.from_entries((1..30).to_list.map((x) => { [x, x] })).twenty_nine?",
            "{}.twenty_nine?"
          ]
        },
        "thirty?" => {
          name: "thirty?",
          description: "returns whether the dictionary size is thirty.",
          examples: [
            "Dictionary.from_entries((1..30).to_list.map((x) => { [x, x] })).thirty?",
            "Dictionary.from_entries((1..31).to_list.map((x) => { [x, x] })).thirty?",
            "{}.thirty?"
          ]
        },
        "thirty_one?" => {
          name: "thirty_one?",
          description: "returns whether the dictionary size is thirty one.",
          examples: [
            "Dictionary.from_entries((1..31).to_list.map((x) => { [x, x] })).thirty_one?",
            "Dictionary.from_entries((1..32).to_list.map((x) => { [x, x] })).thirty_one?",
            "{}.thirty_one?"
          ]
        },
        "thirty_two?" => {
          name: "thirty_two?",
          description: "returns whether the dictionary size is thirty two.",
          examples: [
            "Dictionary.from_entries((1..32).to_list.map((x) => { [x, x] })).thirty_two?",
            "Dictionary.from_entries((1..33).to_list.map((x) => { [x, x] })).thirty_two?",
            "{}.thirty_two?"
          ]
        },
        "thirty_three?" => {
          name: "thirty_three?",
          description: "returns whether the dictionary size is thirty three.",
          examples: [
            "Dictionary.from_entries((1..33).to_list.map((x) => { [x, x] })).thirty_three?",
            "Dictionary.from_entries((1..34).to_list.map((x) => { [x, x] })).thirty_three?",
            "{}.thirty_three?"
          ]
        },
        "thirty_four?" => {
          name: "thirty_four?",
          description: "returns whether the dictionary size is thirty four.",
          examples: [
            "Dictionary.from_entries((1..34).to_list.map((x) => { [x, x] })).thirty_four?",
            "Dictionary.from_entries((1..35).to_list.map((x) => { [x, x] })).thirty_four?",
            "{}.thirty_four?"
          ]
        },
        "thirty_five?" => {
          name: "thirty_five?",
          description: "returns whether the dictionary size is thirty five.",
          examples: [
            "Dictionary.from_entries((1..35).to_list.map((x) => { [x, x] })).thirty_five?",
            "Dictionary.from_entries((1..36).to_list.map((x) => { [x, x] })).thirty_five?",
            "{}.thirty_five?"
          ]
        },
        "thirty_six?" => {
          name: "thirty_six?",
          description: "returns whether the dictionary size is thirty six.",
          examples: [
            "Dictionary.from_entries((1..36).to_list.map((x) => { [x, x] })).thirty_six?",
            "Dictionary.from_entries((1..37).to_list.map((x) => { [x, x] })).thirty_six?",
            "{}.thirty_six?"
          ]
        },
        "thirty_seven?" => {
          name: "thirty_seven?",
          description: "returns whether the dictionary size is thirty seven.",
          examples: [
            "Dictionary.from_entries((1..37).to_list.map((x) => { [x, x] })).thirty_seven?",
            "Dictionary.from_entries((1..38).to_list.map((x) => { [x, x] })).thirty_seven?",
            "{}.thirty_seven?"
          ]
        },
        "thirty_eight?" => {
          name: "thirty_eight?",
          description: "returns whether the dictionary size is thirty eight.",
          examples: [
            "Dictionary.from_entries((1..38).to_list.map((x) => { [x, x] })).thirty_eight?",
            "Dictionary.from_entries((1..39).to_list.map((x) => { [x, x] })).thirty_eight?",
            "{}.thirty_eight?"
          ]
        },
        "thirty_nine?" => {
          name: "thirty_nine?",
          description: "returns whether the dictionary size is thirty nine.",
          examples: [
            "Dictionary.from_entries((1..39).to_list.map((x) => { [x, x] })).thirty_nine?",
            "Dictionary.from_entries((1..40).to_list.map((x) => { [x, x] })).thirty_nine?",
            "{}.thirty_nine?"
          ]
        },
        "forty?" => {
          name: "forty?",
          description: "returns whether the dictionary size is forty.",
          examples: [
            "Dictionary.from_entries((1..40).to_list.map((x) => { [x, x] })).forty?",
            "Dictionary.from_entries((1..41).to_list.map((x) => { [x, x] })).forty?",
            "{}.forty?"
          ]
        },
        "forty_one?" => {
          name: "forty_one?",
          description: "returns whether the dictionary size is forty one.",
          examples: [
            "Dictionary.from_entries((1..41).to_list.map((x) => { [x, x] })).forty_one?",
            "Dictionary.from_entries((1..42).to_list.map((x) => { [x, x] })).forty_one?",
            "{}.forty_one?"
          ]
        },
        "forty_two?" => {
          name: "forty_two?",
          description: "returns whether the dictionary size is forty two.",
          examples: [
            "Dictionary.from_entries((1..42).to_list.map((x) => { [x, x] })).forty_two?",
            "Dictionary.from_entries((1..43).to_list.map((x) => { [x, x] })).forty_two?",
            "{}.forty_two?"
          ]
        },
        "forty_three?" => {
          name: "forty_three?",
          description: "returns whether the dictionary size is forty three.",
          examples: [
            "Dictionary.from_entries((1..43).to_list.map((x) => { [x, x] })).forty_three?",
            "Dictionary.from_entries((1..44).to_list.map((x) => { [x, x] })).forty_three?",
            "{}.forty_three?"
          ]
        },
        "forty_four?" => {
          name: "forty_four?",
          description: "returns whether the dictionary size is forty four.",
          examples: [
            "Dictionary.from_entries((1..44).to_list.map((x) => { [x, x] })).forty_four?",
            "Dictionary.from_entries((1..45).to_list.map((x) => { [x, x] })).forty_four?",
            "{}.forty_four?"
          ]
        },
        "forty_five?" => {
          name: "forty_five?",
          description: "returns whether the dictionary size is forty five.",
          examples: [
            "Dictionary.from_entries((1..45).to_list.map((x) => { [x, x] })).forty_five?",
            "Dictionary.from_entries((1..46).to_list.map((x) => { [x, x] })).forty_five?",
            "{}.forty_five?"
          ]
        },
        "forty_six?" => {
          name: "forty_six?",
          description: "returns whether the dictionary size is forty six.",
          examples: [
            "Dictionary.from_entries((1..46).to_list.map((x) => { [x, x] })).forty_six?",
            "Dictionary.from_entries((1..47).to_list.map((x) => { [x, x] })).forty_six?",
            "{}.forty_six?"
          ]
        },
        "forty_seven?" => {
          name: "forty_seven?",
          description: "returns whether the dictionary size is forty seven.",
          examples: [
            "Dictionary.from_entries((1..47).to_list.map((x) => { [x, x] })).forty_seven?",
            "Dictionary.from_entries((1..48).to_list.map((x) => { [x, x] })).forty_seven?",
            "{}.forty_seven?"
          ]
        },
        "forty_eight?" => {
          name: "forty_eight?",
          description: "returns whether the dictionary size is forty eight.",
          examples: [
            "Dictionary.from_entries((1..48).to_list.map((x) => { [x, x] })).forty_eight?",
            "Dictionary.from_entries((1..49).to_list.map((x) => { [x, x] })).forty_eight?",
            "{}.forty_eight?"
          ]
        },
        "forty_nine?" => {
          name: "forty_nine?",
          description: "returns whether the dictionary size is forty nine.",
          examples: [
            "Dictionary.from_entries((1..49).to_list.map((x) => { [x, x] })).forty_nine?",
            "Dictionary.from_entries((1..50).to_list.map((x) => { [x, x] })).forty_nine?",
            "{}.forty_nine?"
          ]
        },
        "fifty?" => {
          name: "fifty?",
          description: "returns whether the dictionary size is fifty.",
          examples: [
            "Dictionary.from_entries((1..50).to_list.map((x) => { [x, x] })).fifty?",
            "Dictionary.from_entries((1..51).to_list.map((x) => { [x, x] })).fifty?",
            "{}.fifty?"
          ]
        },
        "fifty_one?" => {
          name: "fifty_one?",
          description: "returns whether the dictionary size is fifty one.",
          examples: [
            "Dictionary.from_entries((1..51).to_list.map((x) => { [x, x] })).fifty_one?",
            "Dictionary.from_entries((1..52).to_list.map((x) => { [x, x] })).fifty_one?",
            "{}.fifty_one?"
          ]
        },
        "fifty_two?" => {
          name: "fifty_two?",
          description: "returns whether the dictionary size is fifty two.",
          examples: [
            "Dictionary.from_entries((1..52).to_list.map((x) => { [x, x] })).fifty_two?",
            "Dictionary.from_entries((1..53).to_list.map((x) => { [x, x] })).fifty_two?",
            "{}.fifty_two?"
          ]
        },
        "fifty_three?" => {
          name: "fifty_three?",
          description: "returns whether the dictionary size is fifty three.",
          examples: [
            "Dictionary.from_entries((1..53).to_list.map((x) => { [x, x] })).fifty_three?",
            "Dictionary.from_entries((1..54).to_list.map((x) => { [x, x] })).fifty_three?",
            "{}.fifty_three?"
          ]
        },
        "fifty_four?" => {
          name: "fifty_four?",
          description: "returns whether the dictionary size is fifty four.",
          examples: [
            "Dictionary.from_entries((1..54).to_list.map((x) => { [x, x] })).fifty_four?",
            "Dictionary.from_entries((1..55).to_list.map((x) => { [x, x] })).fifty_four?",
            "{}.fifty_four?"
          ]
        },
        "fifty_five?" => {
          name: "fifty_five?",
          description: "returns whether the dictionary size is fifty five.",
          examples: [
            "Dictionary.from_entries((1..55).to_list.map((x) => { [x, x] })).fifty_five?",
            "Dictionary.from_entries((1..56).to_list.map((x) => { [x, x] })).fifty_five?",
            "{}.fifty_five?"
          ]
        },
        "fifty_six?" => {
          name: "fifty_six?",
          description: "returns whether the dictionary size is fifty six.",
          examples: [
            "Dictionary.from_entries((1..56).to_list.map((x) => { [x, x] })).fifty_six?",
            "Dictionary.from_entries((1..57).to_list.map((x) => { [x, x] })).fifty_six?",
            "{}.fifty_six?"
          ]
        },
        "fifty_seven?" => {
          name: "fifty_seven?",
          description: "returns whether the dictionary size is fifty seven.",
          examples: [
            "Dictionary.from_entries((1..57).to_list.map((x) => { [x, x] })).fifty_seven?",
            "Dictionary.from_entries((1..58).to_list.map((x) => { [x, x] })).fifty_seven?",
            "{}.fifty_seven?"
          ]
        },
        "fifty_eight?" => {
          name: "fifty_eight?",
          description: "returns whether the dictionary size is fifty eight.",
          examples: [
            "Dictionary.from_entries((1..58).to_list.map((x) => { [x, x] })).fifty_eight?",
            "Dictionary.from_entries((1..59).to_list.map((x) => { [x, x] })).fifty_eight?",
            "{}.fifty_eight?"
          ]
        },
        "fifty_nine?" => {
          name: "fifty_nine?",
          description: "returns whether the dictionary size is fifty nine.",
          examples: [
            "Dictionary.from_entries((1..59).to_list.map((x) => { [x, x] })).fifty_nine?",
            "Dictionary.from_entries((1..60).to_list.map((x) => { [x, x] })).fifty_nine?",
            "{}.fifty_nine?"
          ]
        },
        "sixty?" => {
          name: "sixty?",
          description: "returns whether the dictionary size is sixty.",
          examples: [
            "Dictionary.from_entries((1..60).to_list.map((x) => { [x, x] })).sixty?",
            "Dictionary.from_entries((1..61).to_list.map((x) => { [x, x] })).sixty?",
            "{}.sixty?"
          ]
        },
        "sixty_one?" => {
          name: "sixty_one?",
          description: "returns whether the dictionary size is sixty one.",
          examples: [
            "Dictionary.from_entries((1..61).to_list.map((x) => { [x, x] })).sixty_one?",
            "Dictionary.from_entries((1..62).to_list.map((x) => { [x, x] })).sixty_one?",
            "{}.sixty_one?"
          ]
        },
        "sixty_two?" => {
          name: "sixty_two?",
          description: "returns whether the dictionary size is sixty two.",
          examples: [
            "Dictionary.from_entries((1..62).to_list.map((x) => { [x, x] })).sixty_two?",
            "Dictionary.from_entries((1..63).to_list.map((x) => { [x, x] })).sixty_two?",
            "{}.sixty_two?"
          ]
        },
        "sixty_three?" => {
          name: "sixty_three?",
          description: "returns whether the dictionary size is sixty three.",
          examples: [
            "Dictionary.from_entries((1..63).to_list.map((x) => { [x, x] })).sixty_three?",
            "Dictionary.from_entries((1..64).to_list.map((x) => { [x, x] })).sixty_three?",
            "{}.sixty_three?"
          ]
        },
        "sixty_four?" => {
          name: "sixty_four?",
          description: "returns whether the dictionary size is sixty four.",
          examples: [
            "Dictionary.from_entries((1..64).to_list.map((x) => { [x, x] })).sixty_four?",
            "Dictionary.from_entries((1..65).to_list.map((x) => { [x, x] })).sixty_four?",
            "{}.sixty_four?"
          ]
        },
        "sixty_five?" => {
          name: "sixty_five?",
          description: "returns whether the dictionary size is sixty five.",
          examples: [
            "Dictionary.from_entries((1..65).to_list.map((x) => { [x, x] })).sixty_five?",
            "Dictionary.from_entries((1..66).to_list.map((x) => { [x, x] })).sixty_five?",
            "{}.sixty_five?"
          ]
        },
        "sixty_six?" => {
          name: "sixty_six?",
          description: "returns whether the dictionary size is sixty six.",
          examples: [
            "Dictionary.from_entries((1..66).to_list.map((x) => { [x, x] })).sixty_six?",
            "Dictionary.from_entries((1..67).to_list.map((x) => { [x, x] })).sixty_six?",
            "{}.sixty_six?"
          ]
        },
        "sixty_seven?" => {
          name: "sixty_seven?",
          description: "returns whether the dictionary size is sixty seven.",
          examples: [
            "Dictionary.from_entries((1..67).to_list.map((x) => { [x, x] })).sixty_seven?",
            "Dictionary.from_entries((1..68).to_list.map((x) => { [x, x] })).sixty_seven?",
            "{}.sixty_seven?"
          ]
        },
        "sixty_eight?" => {
          name: "sixty_eight?",
          description: "returns whether the dictionary size is sixty eight.",
          examples: [
            "Dictionary.from_entries((1..68).to_list.map((x) => { [x, x] })).sixty_eight?",
            "Dictionary.from_entries((1..69).to_list.map((x) => { [x, x] })).sixty_eight?",
            "{}.sixty_eight?"
          ]
        },
        "sixty_nine?" => {
          name: "sixty_nine?",
          description: "returns whether the dictionary size is sixty nine.",
          examples: [
            "Dictionary.from_entries((1..69).to_list.map((x) => { [x, x] })).sixty_nine?",
            "Dictionary.from_entries((1..70).to_list.map((x) => { [x, x] })).sixty_nine?",
            "{}.sixty_nine?"
          ]
        },
        "seventy?" => {
          name: "seventy?",
          description: "returns whether the dictionary size is seventy.",
          examples: [
            "Dictionary.from_entries((1..70).to_list.map((x) => { [x, x] })).seventy?",
            "Dictionary.from_entries((1..71).to_list.map((x) => { [x, x] })).seventy?",
            "{}.seventy?"
          ]
        },
        "seventy_one?" => {
          name: "seventy_one?",
          description: "returns whether the dictionary size is seventy one.",
          examples: [
            "Dictionary.from_entries((1..71).to_list.map((x) => { [x, x] })).seventy_one?",
            "Dictionary.from_entries((1..72).to_list.map((x) => { [x, x] })).seventy_one?",
            "{}.seventy_one?"
          ]
        },
        "seventy_two?" => {
          name: "seventy_two?",
          description: "returns whether the dictionary size is seventy two.",
          examples: [
            "Dictionary.from_entries((1..72).to_list.map((x) => { [x, x] })).seventy_two?",
            "Dictionary.from_entries((1..73).to_list.map((x) => { [x, x] })).seventy_two?",
            "{}.seventy_two?"
          ]
        },
        "seventy_three?" => {
          name: "seventy_three?",
          description: "returns whether the dictionary size is seventy three.",
          examples: [
            "Dictionary.from_entries((1..73).to_list.map((x) => { [x, x] })).seventy_three?",
            "Dictionary.from_entries((1..74).to_list.map((x) => { [x, x] })).seventy_three?",
            "{}.seventy_three?"
          ]
        },
        "seventy_four?" => {
          name: "seventy_four?",
          description: "returns whether the dictionary size is seventy four.",
          examples: [
            "Dictionary.from_entries((1..74).to_list.map((x) => { [x, x] })).seventy_four?",
            "Dictionary.from_entries((1..75).to_list.map((x) => { [x, x] })).seventy_four?",
            "{}.seventy_four?"
          ]
        },
        "seventy_five?" => {
          name: "seventy_five?",
          description: "returns whether the dictionary size is seventy five.",
          examples: [
            "Dictionary.from_entries((1..75).to_list.map((x) => { [x, x] })).seventy_five?",
            "Dictionary.from_entries((1..76).to_list.map((x) => { [x, x] })).seventy_five?",
            "{}.seventy_five?"
          ]
        },
        "seventy_six?" => {
          name: "seventy_six?",
          description: "returns whether the dictionary size is seventy six.",
          examples: [
            "Dictionary.from_entries((1..76).to_list.map((x) => { [x, x] })).seventy_six?",
            "Dictionary.from_entries((1..77).to_list.map((x) => { [x, x] })).seventy_six?",
            "{}.seventy_six?"
          ]
        },
        "seventy_seven?" => {
          name: "seventy_seven?",
          description: "returns whether the dictionary size is seventy seven.",
          examples: [
            "Dictionary.from_entries((1..77).to_list.map((x) => { [x, x] })).seventy_seven?",
            "Dictionary.from_entries((1..78).to_list.map((x) => { [x, x] })).seventy_seven?",
            "{}.seventy_seven?"
          ]
        },
        "seventy_eight?" => {
          name: "seventy_eight?",
          description: "returns whether the dictionary size is seventy eight.",
          examples: [
            "Dictionary.from_entries((1..78).to_list.map((x) => { [x, x] })).seventy_eight?",
            "Dictionary.from_entries((1..79).to_list.map((x) => { [x, x] })).seventy_eight?",
            "{}.seventy_eight?"
          ]
        },
        "seventy_nine?" => {
          name: "seventy_nine?",
          description: "returns whether the dictionary size is seventy nine.",
          examples: [
            "Dictionary.from_entries((1..79).to_list.map((x) => { [x, x] })).seventy_nine?",
            "Dictionary.from_entries((1..80).to_list.map((x) => { [x, x] })).seventy_nine?",
            "{}.seventy_nine?"
          ]
        },
        "eighty?" => {
          name: "eighty?",
          description: "returns whether the dictionary size is eighty.",
          examples: [
            "Dictionary.from_entries((1..80).to_list.map((x) => { [x, x] })).eighty?",
            "Dictionary.from_entries((1..81).to_list.map((x) => { [x, x] })).eighty?",
            "{}.eighty?"
          ]
        },
        "eighty_one?" => {
          name: "eighty_one?",
          description: "returns whether the dictionary size is eighty one.",
          examples: [
            "Dictionary.from_entries((1..81).to_list.map((x) => { [x, x] })).eighty_one?",
            "Dictionary.from_entries((1..82).to_list.map((x) => { [x, x] })).eighty_one?",
            "{}.eighty_one?"
          ]
        },
        "eighty_two?" => {
          name: "eighty_two?",
          description: "returns whether the dictionary size is eighty two.",
          examples: [
            "Dictionary.from_entries((1..82).to_list.map((x) => { [x, x] })).eighty_two?",
            "Dictionary.from_entries((1..83).to_list.map((x) => { [x, x] })).eighty_two?",
            "{}.eighty_two?"
          ]
        },
        "eighty_three?" => {
          name: "eighty_three?",
          description: "returns whether the dictionary size is eighty three.",
          examples: [
            "Dictionary.from_entries((1..83).to_list.map((x) => { [x, x] })).eighty_three?",
            "Dictionary.from_entries((1..84).to_list.map((x) => { [x, x] })).eighty_three?",
            "{}.eighty_three?"
          ]
        },
        "eighty_four?" => {
          name: "eighty_four?",
          description: "returns whether the dictionary size is eighty four.",
          examples: [
            "Dictionary.from_entries((1..84).to_list.map((x) => { [x, x] })).eighty_four?",
            "Dictionary.from_entries((1..85).to_list.map((x) => { [x, x] })).eighty_four?",
            "{}.eighty_four?"
          ]
        },
        "eighty_five?" => {
          name: "eighty_five?",
          description: "returns whether the dictionary size is eighty five.",
          examples: [
            "Dictionary.from_entries((1..85).to_list.map((x) => { [x, x] })).eighty_five?",
            "Dictionary.from_entries((1..86).to_list.map((x) => { [x, x] })).eighty_five?",
            "{}.eighty_five?"
          ]
        },
        "eighty_six?" => {
          name: "eighty_six?",
          description: "returns whether the dictionary size is eighty six.",
          examples: [
            "Dictionary.from_entries((1..86).to_list.map((x) => { [x, x] })).eighty_six?",
            "Dictionary.from_entries((1..87).to_list.map((x) => { [x, x] })).eighty_six?",
            "{}.eighty_six?"
          ]
        },
        "eighty_seven?" => {
          name: "eighty_seven?",
          description: "returns whether the dictionary size is eighty seven.",
          examples: [
            "Dictionary.from_entries((1..87).to_list.map((x) => { [x, x] })).eighty_seven?",
            "Dictionary.from_entries((1..88).to_list.map((x) => { [x, x] })).eighty_seven?",
            "{}.eighty_seven?"
          ]
        },
        "eighty_eight?" => {
          name: "eighty_eight?",
          description: "returns whether the dictionary size is eighty eight.",
          examples: [
            "Dictionary.from_entries((1..88).to_list.map((x) => { [x, x] })).eighty_eight?",
            "Dictionary.from_entries((1..89).to_list.map((x) => { [x, x] })).eighty_eight?",
            "{}.eighty_eight?"
          ]
        },
        "eighty_nine?" => {
          name: "eighty_nine?",
          description: "returns whether the dictionary size is eighty nine.",
          examples: [
            "Dictionary.from_entries((1..89).to_list.map((x) => { [x, x] })).eighty_nine?",
            "Dictionary.from_entries((1..90).to_list.map((x) => { [x, x] })).eighty_nine?",
            "{}.eighty_nine?"
          ]
        },
        "ninety?" => {
          name: "ninety?",
          description: "returns whether the dictionary size is ninety.",
          examples: [
            "Dictionary.from_entries((1..90).to_list.map((x) => { [x, x] })).ninety?",
            "Dictionary.from_entries((1..91).to_list.map((x) => { [x, x] })).ninety?",
            "{}.ninety?"
          ]
        },
        "ninety_one?" => {
          name: "ninety_one?",
          description: "returns whether the dictionary size is ninety one.",
          examples: [
            "Dictionary.from_entries((1..91).to_list.map((x) => { [x, x] })).ninety_one?",
            "Dictionary.from_entries((1..92).to_list.map((x) => { [x, x] })).ninety_one?",
            "{}.ninety_one?"
          ]
        },
        "ninety_two?" => {
          name: "ninety_two?",
          description: "returns whether the dictionary size is ninety two.",
          examples: [
            "Dictionary.from_entries((1..92).to_list.map((x) => { [x, x] })).ninety_two?",
            "Dictionary.from_entries((1..93).to_list.map((x) => { [x, x] })).ninety_two?",
            "{}.ninety_two?"
          ]
        },
        "ninety_three?" => {
          name: "ninety_three?",
          description: "returns whether the dictionary size is ninety three.",
          examples: [
            "Dictionary.from_entries((1..93).to_list.map((x) => { [x, x] })).ninety_three?",
            "Dictionary.from_entries((1..94).to_list.map((x) => { [x, x] })).ninety_three?",
            "{}.ninety_three?"
          ]
        },
        "ninety_four?" => {
          name: "ninety_four?",
          description: "returns whether the dictionary size is ninety four.",
          examples: [
            "Dictionary.from_entries((1..94).to_list.map((x) => { [x, x] })).ninety_four?",
            "Dictionary.from_entries((1..95).to_list.map((x) => { [x, x] })).ninety_four?",
            "{}.ninety_four?"
          ]
        },
        "ninety_five?" => {
          name: "ninety_five?",
          description: "returns whether the dictionary size is ninety five.",
          examples: [
            "Dictionary.from_entries((1..95).to_list.map((x) => { [x, x] })).ninety_five?",
            "Dictionary.from_entries((1..96).to_list.map((x) => { [x, x] })).ninety_five?",
            "{}.ninety_five?"
          ]
        },
        "ninety_six?" => {
          name: "ninety_six?",
          description: "returns whether the dictionary size is ninety six.",
          examples: [
            "Dictionary.from_entries((1..96).to_list.map((x) => { [x, x] })).ninety_six?",
            "Dictionary.from_entries((1..97).to_list.map((x) => { [x, x] })).ninety_six?",
            "{}.ninety_six?"
          ]
        },
        "ninety_seven?" => {
          name: "ninety_seven?",
          description: "returns whether the dictionary size is ninety seven.",
          examples: [
            "Dictionary.from_entries((1..97).to_list.map((x) => { [x, x] })).ninety_seven?",
            "Dictionary.from_entries((1..98).to_list.map((x) => { [x, x] })).ninety_seven?",
            "{}.ninety_seven?"
          ]
        },
        "ninety_eight?" => {
          name: "ninety_eight?",
          description: "returns whether the dictionary size is ninety eight.",
          examples: [
            "Dictionary.from_entries((1..98).to_list.map((x) => { [x, x] })).ninety_eight?",
            "Dictionary.from_entries((1..99).to_list.map((x) => { [x, x] })).ninety_eight?",
            "{}.ninety_eight?"
          ]
        },
        "ninety_nine?" => {
          name: "ninety_nine?",
          description: "returns whether the dictionary size is ninety nine.",
          examples: [
            "Dictionary.from_entries((1..99).to_list.map((x) => { [x, x] })).ninety_nine?",
            "Dictionary.from_entries((1..100).to_list.map((x) => { [x, x] })).ninety_nine?",
            "{}.ninety_nine?"
          ]
        },
        "one_hundred?" => {
          name: "one_hundred?",
          description: "returns whether the dictionary size is one hundred.",
          examples: [
            "Dictionary.from_entries((1..100).to_list.map((x) => { [x, x] })).one_hundred?",
            "Dictionary.from_entries((1..101).to_list.map((x) => { [x, x] })).one_hundred?",
            "{}.one_hundred?"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance
        return CLASS_FUNCTIONS if scope == :class

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

      def initialize(*args, **kargs, &)
        self.raw =
          args
            .map do |arg|
              if arg.is_an?(::Hash)
                arg.transform_keys(&:to_code).transform_values(&:to_code)
              elsif arg.is_a?(Dictionary)
                arg.raw.transform_keys(&:to_code).transform_values(&:to_code)
              elsif arg.is_a?(Node::FunctionParameter)
                arg.to_h.transform_keys(&:to_code).transform_values(&:to_code)
              else
                {}
              end
            end
            .reduce({}, &:merge)
            .merge(kargs.transform_keys(&:to_code).transform_values(&:to_code))
      end

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, List.new).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "entries"
          sig(args) { Dictionary }
          code_entries(code_value)
        when "from_entries"
          sig(args) { List }
          code_from_entries(code_value)
        when "assign"
          sig(args) { Dictionary.repeat(1) }
          code_assign(*code_arguments.raw)
        when "has_own?"
          sig(args) { [Dictionary, Object] }
          code_has_own?(*code_arguments.raw)
        else
          super
        end
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, List.new).to_code
        globals = multi_fetch(args, *GLOBALS)
        code_value = code_arguments.code_first
        stored_value = code_fetch(code_operator)

        if stored_value.is_a?(Function)
          return stored_value.call(**args, operator: nil, bound_self: self)
        end

        case code_operator.to_s
        when "[]", "at", "get"
          sig(args) { Object }
          code_get(code_value)
        when "any?"
          sig(args) { (Function | Class).maybe }
          code_any?(code_value, **globals)
        when "clear"
          sig(args)
          code_clear
        when "compact!"
          sig(args) { (Function | Class).maybe }
          code_compact!(code_value, **globals)
        when "compact"
          sig(args) { (Function | Class).maybe }
          code_compact(code_value, **globals)
        when "delete"
          sig(args) { Object.repeat(1) }
          code_delete(*code_arguments.raw, **globals)
        when "delete_if"
          sig(args) { Function | Class }
          code_delete_if(code_value, **globals)
        when "delete_unless"
          sig(args) { Function | Class }
          code_delete_unless(code_value, **globals)
        when "dig"
          sig(args) { Object.repeat(1) }
          code_dig(*code_arguments.raw)
        when "each"
          sig(args) { Function }
          code_each(code_value, **globals)
        when "each_key"
          sig(args) { Function }
          code_each_key(code_value, **globals)
        when "each_value"
          sig(args) { Function }
          code_each_value(code_value, **globals)
        when "each_pair"
          sig(args) { Function }
          code_each_pair(code_value, **globals)
        when "empty?"
          sig(args)
          code_empty?
        when "except"
          sig(args) { Object.repeat(1) }
          code_except(*code_arguments.raw)
        when "fetch"
          sig(args) { Object.repeat(1) }
          code_fetch(*code_arguments.raw, **globals)
        when "fetch_values"
          sig(args) { Object.repeat(1) }
          code_fetch_values(*code_arguments.raw)
        when "flatten"
          sig(args) { Integer.maybe }
          code_flatten(code_value)
        when "has_key?", "key?", "include?", "member?"
          sig(args) { Object }
          code_has_key?(code_value)
        when "has_own?"
          sig(args) { Object }
          code_has_own?(code_value)
        when "has_value?", "value?"
          sig(args) { Object }
          code_has_value?(code_value)
        when "invert"
          sig(args)
          code_invert
        when "keep_if"
          sig(args) { Function | Class }
          code_keep_if(code_value, **globals)
        when "keep_unless"
          sig(args) { Function | Class }
          code_keep_unless(code_value, **globals)
        when "key"
          sig(args) { [Object, Function.maybe] }
          code_key(*code_arguments.raw, **globals)
        when "keys"
          sig(args)
          code_keys
        when "map"
          sig(args) { Function }
          code_map(code_value, **globals)
        when "merge"
          sig(args) { [Dictionary.repeat, Function.maybe] }
          code_merge(*code_arguments.raw, **globals)
        when "merge!"
          sig(args) { [Dictionary.repeat, Function.maybe] }
          code_merge!(*code_arguments.raw, **globals)
        when "update"
          sig(args) { [Dictionary.repeat, Function.maybe] }
          code_update(*code_arguments.raw, **globals)
        when "replace"
          sig(args) { Dictionary }
          code_replace(code_value)
        when "store"
          sig(args) { [Object, Object] }
          code_store(*code_arguments.raw)
        when "set"
          sig(args) { [Object, Object] }
          code_set(*code_arguments.raw)
          self
        when "shift"
          sig(args)
          code_shift
        when "reject!"
          sig(args) { Function | Class }
          code_reject!(code_value, **globals)
        when "reject"
          sig(args) { Function | Class }
          code_reject(code_value, **globals)
        when "select!", "filter!"
          sig(args) { Function | Class }
          code_select!(code_value, **globals)
        when "select", "filter"
          sig(args) { Function | Class }
          code_select(code_value, **globals)
        when "size", "length"
          sig(args)
          code_size
        when "slice"
          sig(args) { Object.repeat(1) }
          code_slice(*code_arguments.raw)
        when "transform_keys"
          sig(args) { Function }
          code_transform_keys(code_value, **globals)
        when "transform_keys!"
          sig(args) { Function }
          code_transform_keys!(code_value, **globals)
        when "transform_values"
          sig(args) { Function }
          code_transform_values(code_value, **globals)
        when "transform_values!"
          sig(args) { Function }
          code_transform_values!(code_value, **globals)
        when "to_query"
          sig(args) { String.maybe }
          code_to_query(code_value)
        when "to_list", "entries"
          sig(args)
          code_to_list
        when "to_dictionary"
          sig(args)
          code_to_dictionary
        when "to_context"
          sig(args)
          code_to_context
        when "values"
          sig(args) { [Object.repeat, Function.maybe] }
          code_values(*code_arguments.raw, **globals)
        when "values_at"
          sig(args) { Object.repeat(1) }
          code_values_at(*code_arguments.raw)
        when "associate"
          sig(args) { Object }
          code_associate(code_value)
        when "right_associate"
          sig(args) { Object }
          code_right_associate(code_value)
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
        when ->(code_operator) { code_has_key?(code_operator).truthy? }
          result = code_fetch(code_operator)

          if result.is_a?(Function)
            result.call(**args, operator: nil, bound_self: self)
          else
            sig(args)
            result
          end
        else
          super
        end
      end

      def code_any?(argument, **globals)
        code_argument = argument.to_code

        if code_argument.nothing?
          Boolean.new(raw.any?)
        elsif code_argument.is_a?(Class)
          Boolean.new(raw.any? { |_, value| value.is_a?(code_argument.raw) })
        else
          index = 0

          Boolean.new(
            raw.any? do |key, value|
              code_argument
                .call(
                  arguments: List.new([key, value, Integer.new(index), self]),
                  **globals
                )
                .truthy?
                .tap { index += 1 }
            rescue Error::Next => e
              e.code_value.truthy?.tap { index += 1 }
            end
          )
        end
      rescue Error::Break => e
        e.code_value
      end

      def code_clear
        self.raw = {}
        self
      end

      def self.code_entries(dictionary)
        dictionary.to_code.code_to_list
      end

      def self.code_from_entries(entries)
        entries.to_code.code_to_dictionary
      end

      def self.code_assign(*dictionaries)
        Dictionary.new(
          dictionaries
            .to_code
            .raw
            .reduce({}) { |acc, item| acc.merge(item.raw) }
        )
      end

      def self.code_has_own?(dictionary, key)
        dictionary.to_code.code_has_key?(key)
      end

      def code_compact(argument = nil, **globals)
        code_argument = argument.to_code

        Dictionary.new(
          raw.reject.with_index do |(key, value), index|
            if code_argument.nothing?
              value.nothing?
            elsif code_argument.is_a?(Class)
              value.is_a?(code_argument.raw)
            else
              code_argument.call(
                arguments: List.new([value, key, Integer.new(index), self]),
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

      def code_compact!(argument = nil, **globals)
        code_argument = argument.to_code

        raw.reject!.with_index do |(key, value), index|
          if code_argument.nothing?
            value.nothing?
          elsif code_argument.is_a?(Class)
            value.is_a?(code_argument.raw)
          else
            code_argument.call(
              arguments: List.new([value, key, Integer.new(index), self]),
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

      def code_delete(*arguments, index: 0, **globals)
        arguments = arguments.to_code.raw
        code_index = index.to_code

        code_default =
          (
            arguments.last if arguments.last.is_a?(Function) && arguments.many?
          ).to_code

        arguments = arguments[...-1] unless code_default.nothing?
        code_first = arguments.first.to_code

        if arguments.one?
          raw.delete(code_first) do
            if code_default.nothing?
              Nothing.new
            else
              code_default.call(
                arguments: List.new([code_first, code_index, self]),
                **globals
              )
            end
          rescue Error::Next => e
            e.code_value
          end
        else
          Dictionary.new(
            arguments
              .map
              .with_index do |code_argument, index|
                if code_default.nothing?
                  [
                    code_argument,
                    code_delete(code_argument, index: index, **globals)
                  ]
                else
                  [
                    code_argument,
                    code_delete(
                      code_argument,
                      code_default,
                      index: index,
                      **globals
                    )
                  ]
                end
              end
              .to_h
          )
        end
      rescue Error::Break => e
        e.code_value
      end

      def code_delete_if(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          raw.delete_if { |_, value| value.is_a?(code_argument.raw) }
        else
          raw.delete_if.with_index do |(code_key, code_value), index|
            argument.call(
              arguments:
                List.new([code_key, code_value, Integer.new(index), self]),
              **globals
            ).truthy?
          rescue Error::Next => e
            e.code_value.truthy?
          end
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_delete_unless(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          raw.delete_if { |_, value| !value.is_a?(code_argument.raw) }
        else
          raw.delete_if.with_index do |(key, value), index|
            code_argument.call(
              arguments: List.new([key, value, Integer.new(index), self]),
              **globals
            ).falsy?
          rescue Error::Next => e
            e.code_value.falsy?
          end
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_dig(*arguments)
        code_arguments = arguments.to_code

        code_arguments
          .raw
          .reduce(self) do |code_acc, code_element|
            if code_acc.is_a?(Dictionary) || code_acc.is_a?(List)
              code_acc.code_get(code_element)
            else
              Nothing.new
            end
          end
      end

      def code_each(argument, **globals)
        code_argument = argument.to_code

        raw.each.with_index do |(key, value), index|
          code_argument.call(
            arguments: List.new([key, value, Integer.new(index), self]),
            **globals
          )
        rescue Error::Next => e
          e.code_value
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_each_key(argument, **globals)
        code_argument = argument.to_code

        raw.each.with_index do |(key, value), index|
          code_argument.call(
            arguments: List.new([key, value, Integer.new(index), self]),
            **globals
          )
        rescue Error::Next => e
          e.code_value
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_each_value(argument, **globals)
        code_each_key(argument, **globals)
      end

      def code_each_pair(argument, **globals)
        code_each_key(argument, **globals)
      end

      def code_empty?
        Boolean.new(raw.empty?)
      end

      def code_except(*arguments)
        code_arguments = arguments.to_code
        Dictionary.new(raw.except(*code_arguments.raw))
      end

      def code_fetch(*arguments, index: 0, **globals)
        code_index = index.to_code
        arguments = arguments.to_code.raw

        code_default =
          (
            arguments.last if arguments.last.is_a?(Function) && arguments.many?
          ).to_code

        arguments = arguments[..-2] unless code_default.nothing?
        code_first = arguments.first.to_code

        if arguments.one?
          raw.fetch(code_first) do
            if code_default.nothing?
              Nothing.new
            else
              code_default.call(
                arguments: List.new([code_first, code_index, self]),
                **globals
              )
            end
          rescue Error::Next => e
            e.code_value
          end
        else
          Dictionary.new(
            arguments
              .map
              .with_index do |code_argument, index|
                if code_default.nothing?
                  [
                    code_argument,
                    code_fetch(code_argument, index: index, **globals)
                  ]
                else
                  [
                    code_argument,
                    code_fetch(
                      code_argument,
                      code_default,
                      index: index,
                      **globals
                    )
                  ]
                end
              end
              .to_h
          )
        end
      rescue Error::Break => e
        e.code_value
      end

      def code_fetch_values(*arguments)
        code_arguments = arguments.to_code

        List.new(raw.fetch_values(*code_arguments.raw))
      end

      def code_flatten(level = nil)
        code_level = level.to_code
        code_level = Integer.new(-1) if code_level.nothing?
        code_to_list.code_flatten(code_level)
      end

      def code_get(key)
        code_key = key.to_code
        raw[code_key] || Nothing.new
      end

      def code_has_key?(key)
        code_key = key.to_code
        Boolean.new(raw.key?(code_key))
      end

      def code_has_own?(key)
        code_has_key?(key)
      end

      def code_has_value?(key)
        code_key = key.to_code
        Boolean.new(raw.value?(code_key))
      end

      def code_invert
        Dictionary.new(raw.invert)
      end

      def code_keep_if(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          raw.keep_if { |_, value| value.is_a?(code_argument.raw) }
        else
          raw.keep_if.with_index do |(key, value), index|
            code_argument.call(
              arguments: List.new([key, value, Integer.new(index), self]),
              **globals
            ).truthy?
          rescue Error::Next => e
            e.code_value.truthy?
          end
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_keep_unless(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          raw.keep_if { |_, value| !value.is_a?(code_argument.raw) }
        else
          raw.keep_if.with_index do |(key, value), index|
            code_argument.call(
              arguments: List.new([key, value, Integer.new(index), self]),
              **globals
            ).falsy?
          rescue Error::Next => e
            e.code_value.falsy?
          end
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_key(value, function = nil, **globals)
        code_value = value.to_code
        code_function = function.to_code

        if code_function.nothing?
          raw.key(code_value) || Nothing.new
        else
          raw.key(code_value) ||
            function.call(arguments: List.new([code_value, self]), **globals)
        end
      rescue Error::Next, Error::Break => e
        e.code_value
      end

      def code_keys
        List.new(raw.keys)
      end

      def code_map(function, **globals)
        code_function = function.to_code

        List.new(
          raw.map.with_index do |(key, value), index|
            code_function.call(
              arguments:
                List.new([key.to_code, value.to_code, index.to_code, self]),
              **globals
            )
          rescue Error::Next => e
            e.code_value
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_merge(*arguments, **globals)
        arguments = arguments.to_code.raw

        code_conflict =
          (
            arguments.last if arguments.last.is_a?(Function) && arguments.many?
          ).to_code

        arguments = arguments[..-2] unless code_conflict.nothing?

        index = 0

        Dictionary.new(
          raw.merge(*arguments.map(&:raw)) do |key, old_value, new_value|
            if code_conflict.nothing?
              new_value.to_code.tap { index += 1 }
            else
              code_conflict
                .call(
                  arguments:
                    List.new(
                      [
                        key.to_code,
                        old_value.to_code,
                        new_value.to_code,
                        index.to_code,
                        self
                      ]
                    ),
                  **globals
                )
                .tap { index += 1 }
            end
          rescue Error::Next => e
            e.code_value.tap { index += 1 }
          end
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_merge!(*arguments, **globals)
        arguments = arguments.to_code.raw

        code_conflict =
          (
            arguments.last if arguments.last.is_a?(Function) && arguments.many?
          ).to_code

        arguments = arguments[..-2] unless code_conflict.nothing?

        index = 0

        raw.merge!(*arguments.map(&:raw)) do |key, old_value, new_value|
          if code_conflict.nothing?
            new_value.to_code.tap { index += 1 }
          else
            code_conflict
              .call(
                arguments:
                  List.new(
                    [
                      key.to_code,
                      old_value.to_code,
                      new_value.to_code,
                      index.to_code,
                      self
                    ]
                  ),
                **globals
              )
              .tap { index += 1 }
          end
        rescue Error::Next => e
          e.code_value.tap { index += 1 }
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_update(*, **globals)
        code_merge!(*, **globals)
      end

      def code_replace(dictionary)
        code_dictionary = dictionary.to_code

        self.raw = code_dictionary.raw.dup
        self
      end

      def code_store(key, value)
        code_set(key, value)
      end

      def code_shift
        pair = raw.shift

        pair ? List.new(pair) : Nothing.new
      end

      def code_select!(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          raw.select! { |_, value| value.is_a?(code_argument.raw) }
        else
          raw.select!.with_index do |(key, value), index|
            argument.call(
              arguments:
                List.new([key.to_code, value.to_code, index.to_code, self]),
              **globals
            ).truthy?
          rescue Error::Next => e
            e.code_value.truthy?
          end
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_select(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          Dictionary.new(
            raw.select { |_, value| value.is_a?(code_argument.raw) }
          )
        else
          Dictionary.new(
            raw.select.with_index do |(key, value), index|
              argument.call(
                arguments:
                  List.new([key.to_code, value.to_code, index.to_code, self]),
                **globals
              ).truthy?
            rescue Error::Next => e
              e.code_value.truthy?
            end
          )
        end
      rescue Error::Break => e
        e.code_value
      end

      def code_reject!(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          raw.reject! { |_, value| value.is_a?(code_argument.raw) }
        else
          raw.reject!.with_index do |(key, value), index|
            code_argument.call(
              arguments:
                List.new([key.to_code, value.to_code, index.to_code, self]),
              **globals
            ).truthy?
          rescue Error::Next => e
            e.code_value.truthy?
          end
        end

        self
      rescue Error::Break => e
        e.code_value
      end

      def code_reject(argument, **globals)
        code_argument = argument.to_code

        if code_argument.is_a?(Class)
          Dictionary.new(
            raw.reject { |_, value| value.is_a?(code_argument.raw) }
          )
        else
          Dictionary.new(
            raw.reject.with_index do |(key, value), index|
              code_argument.call(
                arguments:
                  List.new([key.to_code, value.to_code, index.to_code, self]),
                **globals
              ).truthy?
            rescue Error::Next => e
              e.code_value.truthy?
            end
          )
        end
      rescue Error::Break => e
        e.code_value
      end

      def code_set(key, value)
        code_key = key.to_code
        code_value = value.to_code
        raw[code_key] = code_value
        code_value
      end

      def code_size
        Integer.new(raw.size)
      end

      def code_slice(*arguments)
        code_arguments = arguments.to_code
        Dictionary.new(raw.slice(*code_arguments.raw))
      end

      def code_to_list
        List.new(raw.map { |key, value| List.new([key, value]) })
      end

      def code_to_dictionary
        self
      end

      def code_to_context
        Context.new(raw)
      end

      def code_to_query(namespace = nil)
        code_namespace = namespace.to_code

        String.new(raw.to_query(code_namespace.raw))
      end

      def code_transform_keys(function, **globals)
        code_function = function.to_code

        Dictionary.new(
          raw
            .map
            .with_index do |(key, value), index|
              [
                code_function.call(
                  arguments:
                    List.new([key.to_code, value.to_code, index.to_code, self]),
                  **globals
                ),
                value.to_code
              ]
            rescue Error::Next => e
              [e.code_value, value.to_code]
            end
            .to_h
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_transform_keys!(function, **globals)
        self.raw = code_transform_keys(function, **globals).raw
        self
      end

      def code_transform_values(function, **globals)
        code_function = function.to_code

        Dictionary.new(
          raw
            .map
            .with_index do |(key, value), index|
              [
                key.to_code,
                code_function.call(
                  arguments:
                    List.new([key.to_code, value.to_code, index.to_code, self]),
                  **globals
                )
              ]
            rescue Error::Next => e
              [key.to_code, e.code_value]
            end
            .to_h
        )
      rescue Error::Break => e
        e.code_value
      end

      def code_transform_values!(function, **globals)
        self.raw = code_transform_values(function, **globals).raw
        self
      end

      def code_values(*arguments, **globals)
        arguments = arguments.to_code.raw
        code_function =
          (arguments.last if arguments.last.is_a?(Function)).to_code

        arguments = arguments[..-2] unless code_function.nothing?

        entries =
          if arguments.empty?
            raw.to_a
          else
            arguments.map { |key| [key, raw.fetch(key, Nothing.new)] }
          end

        if code_function.nothing?
          List.new(entries.map(&:second))
        else
          List.new(
            entries.map.with_index do |(key, value), index|
              code_function.call(
                arguments:
                  List.new([key.to_code, value.to_code, index.to_code, self]),
                **globals
              )
            rescue Error::Next => e
              e.code_value
            end
          )
        end
      rescue Error::Break => e
        e.code_value
      end

      def code_values_at(*keys)
        code_keys = keys.to_code

        List.new(raw.values_at(*code_keys.raw))
      end

      def code_associate(key)
        code_key = key.to_code

        raw.key?(code_key) ? List.new([code_key, raw[code_key]]) : Nothing.new
      end

      def code_right_associate(value)
        code_value = value.to_code
        pair = raw.detect { |_, entry_value| entry_value == code_value }

        pair ? List.new(pair) : Nothing.new
      end

      def code_deep_duplicate
        duplicate = Dictionary.new

        raw.each do |key, value|
          duplicate.code_set(
            key.code_deep_duplicate,
            value.code_deep_duplicate
          )
        end

        duplicate
      end

      def <=>(other)
        code_other = other.to_code
        return -1 if self.class != code_other.class
        return 0 if raw == code_other.raw
        return -1 if raw < code_other.raw
        return 1 if raw > code_other.raw

        -1
      end

      def present?
        raw.present?
      end
    end
  end
end
