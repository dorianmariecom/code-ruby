# frozen_string_literal: true

class Code
  class Object
    class String < Object
      CLASS_DOCUMENTATION = {
        name: "String",
        description:
          "represents text and provides parsing, search, and transformation operations.",
        examples: ["\"hello\"", ":hello.upcase", "\"a,b\".split(\",\")"]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "&" => {
          name: "&",
          description: "returns a function that calls the named selector.",
          examples: ["&\"to_string\"", "&\"upcase\"", "&\"value\""]
        },
        "to_function" => {
          name: "to_function",
          description: "returns a function that calls the named selector.",
          examples: [
            "\"to_string\".to_function",
            "\"upcase\".to_function",
            "\"value\".to_function"
          ]
        },
        "*" => {
          name: "*",
          description: "returns the string repeated a number of times.",
          examples: ["\"a\" * 3", "\":\" * 2", "\"ab\" * 2"]
        },
        "+" => {
          name: "+",
          description: "returns the string with another value appended.",
          examples: ["\"a\" + \"b\"", "\"count: \" + 1", "\":\" + :ok"]
        },
        "downcase" => {
          name: "downcase",
          description: "returns the string converted to lowercase.",
          examples: [
            "\"HELLO\".downcase",
            "\"Code\".downcase",
            "\"A1\".downcase"
          ]
        },
        "lower_case" => {
          name: "lower_case",
          description: "returns the string converted to lowercase.",
          examples: [
            "\"HELLO\".lower_case",
            "\"Code\".lower_case",
            "\"A1\".lower_case"
          ]
        },
        "include?" => {
          name: "include?",
          description: "returns whether the string includes another string.",
          examples: [
            "\"hello\".include?(\"ell\")",
            "\"hello\".include?(\"x\")",
            "\":name\".include?(\":\")"
          ]
        },
        "member?" => {
          name: "member?",
          description: "returns whether the string includes another string.",
          examples: [
            "\"hello\".member?(\"ell\")",
            "\"hello\".member?(\"x\")",
            "\":name\".member?(\":\")"
          ]
        },
        "match?" => {
          name: "match?",
          description: "returns whether the string matches a regex.",
          examples: [
            "\"hello\".match?(Regex.new(\"ell\"))",
            "\"hello\".match?(Regex.new(\"^he\"))",
            "\"hello\".match?(Regex.new(\"world\"))"
          ]
        },
        "matches?" => {
          name: "matches?",
          description: "returns whether the string matches a regex.",
          examples: [
            "\"hello\".matches?(Regex.new(\"ell\"))",
            "\"hello\".matches?(Regex.new(\"^he\"))",
            "\"hello\".matches?(Regex.new(\"world\"))"
          ]
        },
        "starts_with?" => {
          name: "starts_with?",
          description: "returns whether the string starts with another string.",
          examples: [
            "\"hello\".starts_with?(\"he\")",
            "\"hello\".starts_with?(\"lo\")",
            "\":name\".starts_with?(\":\")"
          ]
        },
        "start_with?" => {
          name: "start_with?",
          description: "returns whether the string starts with another string.",
          examples: [
            "\"hello\".start_with?(\"he\")",
            "\"hello\".start_with?(\"lo\")",
            "\":name\".start_with?(\":\")"
          ]
        },
        "ends_with?" => {
          name: "ends_with?",
          description: "returns whether the string ends with another string.",
          examples: [
            "\"hello\".ends_with?(\"lo\")",
            "\"hello\".ends_with?(\"he\")",
            "\"file.rb\".ends_with?(\".rb\")"
          ]
        },
        "end_with?" => {
          name: "end_with?",
          description: "returns whether the string ends with another string.",
          examples: [
            "\"hello\".end_with?(\"lo\")",
            "\"hello\".end_with?(\"he\")",
            "\"file.rb\".end_with?(\".rb\")"
          ]
        },
        "[]" => {
          name: "[]",
          description: "returns the character at an index.",
          examples: ["\"abc\"[0]", "\"abc\"[1]", "\"abc\"[2]"]
        },
        "at" => {
          name: "at",
          description: "returns the character at an index.",
          examples: ["\"abc\".at(0)", "\"abc\".at(1)", "\"abc\".at(2)"]
        },
        "get" => {
          name: "get",
          description: "returns the character at an index.",
          examples: ["\"abc\".get(0)", "\"abc\".get(1)", "\"abc\".get(2)"]
        },
        "capitalize" => {
          name: "capitalize",
          description:
            "returns the string with its first character capitalized.",
          examples: [
            "\"hello\".capitalize",
            "\"code\".capitalize",
            "\"already\".capitalize"
          ]
        },
        "characters" => {
          name: "characters",
          description: "returns the string characters as a list.",
          examples: [
            "\"abc\".characters",
            "\"hi\".characters",
            "\"\".characters"
          ]
        },
        "bytes" => {
          name: "bytes",
          description: "returns the string bytes as a list.",
          examples: ["\"abc\".bytes", "\"A\".bytes", "\"\".bytes"]
        },
        "bytesize" => {
          name: "bytesize",
          description: "returns the number of bytes in the string.",
          examples: ["\"abc\".bytesize", "\"A\".bytesize", "\"\".bytesize"]
        },
        "byte_slice" => {
          name: "byte_slice",
          description: "returns a byte slice from the string.",
          examples: [
            "\"abc\".byte_slice(0)",
            "\"abc\".byte_slice(0, 2)",
            "\"hello\".byte_slice(1, 3)"
          ]
        },
        "codepoints" => {
          name: "codepoints",
          description: "returns the string codepoints as a list.",
          examples: [
            "\"abc\".codepoints",
            "\"A\".codepoints",
            "\"\".codepoints"
          ]
        },
        "character_code_at" => {
          name: "character_code_at",
          description: "returns the codepoint at an index.",
          examples: [
            "\"abc\".character_code_at(0)",
            "\"abc\".character_code_at(1)",
            "\"abc\".character_code_at"
          ]
        },
        "ordinal" => {
          name: "ordinal",
          description: "returns the codepoint for the first character.",
          examples: ["\"a\".ordinal", "\"A\".ordinal", "\"1\".ordinal"]
        },
        "chomp" => {
          name: "chomp",
          description:
            "returns the string with a trailing record separator removed.",
          examples: ["\"a\\n\".chomp", "\"a\".chomp", "\"a\\r\\n\".chomp"]
        },
        "chop" => {
          name: "chop",
          description: "returns the string with its last character removed.",
          examples: ["\"abc\".chop", "\"a\".chop", "\"\".chop"]
        },
        "delete" => {
          name: "delete",
          description: "returns the string with matching characters removed.",
          examples: [
            "\"hello\".delete(\"l\")",
            "\"123\".delete(\"2\")",
            "\"abc\".delete(\"z\")"
          ]
        },
        "delete_prefix" => {
          name: "delete_prefix",
          description: "returns the string with a matching prefix removed.",
          examples: [
            "\"hello\".delete_prefix(\"he\")",
            "\"hello\".delete_prefix(\"x\")",
            "\"file.rb\".delete_prefix(\"file\")"
          ]
        },
        "delete_suffix" => {
          name: "delete_suffix",
          description: "returns the string with a matching suffix removed.",
          examples: [
            "\"hello\".delete_suffix(\"lo\")",
            "\"hello\".delete_suffix(\"x\")",
            "\"file.rb\".delete_suffix(\".rb\")"
          ]
        },
        "empty?" => {
          name: "empty?",
          description: "returns whether the string is empty.",
          examples: ["\"\".empty?", "\"a\".empty?", "\" \".empty?"]
        },
        "clear" => {
          name: "clear",
          description: "empties the string and returns it.",
          examples: ["\"abc\".clear", "\"a\".clear", "\"\".clear"]
        },
        "count" => {
          name: "count",
          description: "returns the count of matching characters.",
          examples: [
            "\"hello\".count(\"l\")",
            "\"banana\".count(\"a\")",
            "\"abc\".count(\"z\")"
          ]
        },
        "insert" => {
          name: "insert",
          description: "inserts a value at an index and returns the string.",
          examples: [
            "\"ac\".insert(1, \"b\")",
            "\"bc\".insert(0, \"a\")",
            "\"ab\".insert(2, \"c\")"
          ]
        },
        "prepend" => {
          name: "prepend",
          description: "prepends a value and returns the string.",
          examples: [
            "\"b\".prepend(\"a\")",
            "\"world\".prepend(\"hello \")",
            "\"1\".prepend(0)"
          ]
        },
        "concat" => {
          name: "concat",
          description: "appends values and returns the string.",
          examples: [
            "\"a\".concat(\"b\")",
            "\"a\".concat(\"b\", \"c\")",
            "\"count\".concat(1)"
          ]
        },
        "first" => {
          name: "first",
          description: "returns the first character or first characters.",
          examples: ["\"abc\".first", "\"abc\".first(2)", "\"\".first"]
        },
        "index" => {
          name: "index",
          description: "returns the index of a matching substring or regex.",
          examples: [
            "\"hello\".index(\"l\")",
            "\"hello\".index(Regex.new(\"l+\"))",
            "\"banana\".index(\"na\")"
          ]
        },
        "last" => {
          name: "last",
          description: "returns the last character or last characters.",
          examples: ["\"abc\".last", "\"ab\".last", "\"\".last"]
        },
        "lines" => {
          name: "lines",
          description: "returns the string lines as a list.",
          examples: ["\"a\\nb\".lines", "\"a\".lines", "\"\".lines"]
        },
        "reverse" => {
          name: "reverse",
          description: "returns the string with characters reversed.",
          examples: ["\"abc\".reverse", "\"ab\".reverse", "\"\".reverse"]
        },
        "right_index" => {
          name: "right_index",
          description:
            "returns the last index of a matching substring or regex.",
          examples: [
            "\"hello\".right_index(\"l\")",
            "\"hello\".right_index(Regex.new(\"l\"))",
            "\"banana\".right_index(\"na\")"
          ]
        },
        "parameterize" => {
          name: "parameterize",
          description:
            "returns the string parameterized for identifiers or urls.",
          examples: [
            "\"Hello world\".parameterize",
            "\"a b c\".parameterize",
            "\"Code Ruby\".parameterize"
          ]
        },
        "squish" => {
          name: "squish",
          description:
            "returns the string with surrounding and repeated whitespace collapsed.",
          examples: [
            "\"  hello   world  \".squish",
            "\"a\\n b\".squish",
            "\"a   b\".squish"
          ]
        },
        "squeeze" => {
          name: "squeeze",
          description: "returns the string with repeated characters collapsed.",
          examples: [
            "\"hellooo\".squeeze",
            "\"book\".squeeze(\"o\")",
            "\"aaab\".squeeze"
          ]
        },
        "substitute" => {
          name: "substitute",
          description: "returns the string with the first match replaced.",
          examples: [
            "\"hello\".substitute(\"l\", \"x\")",
            "\"abc\".substitute(\"a\", \"z\")",
            "\"abc\".substitute(\"x\", \"z\")"
          ]
        },
        "substitute!" => {
          name: "substitute!",
          description: "replaces the first match in the string and returns it.",
          examples: [
            "\"hello\".substitute!(\"l\", \"x\")",
            "\"abc\".substitute!(\"a\", \"z\")",
            "\"abc\".substitute!(\"x\", \"z\")"
          ]
        },
        "substitute_all" => {
          name: "substitute_all",
          description: "returns the string with all matches replaced.",
          examples: [
            "\"hello\".substitute_all(\"l\", \"x\")",
            "\"abcabc\".substitute_all(\"a\", \"z\")",
            "\"abc\".substitute_all(\"x\", \"z\")"
          ]
        },
        "substitute_all!" => {
          name: "substitute_all!",
          description: "replaces all matches in the string and returns it.",
          examples: [
            "\"hello\".substitute_all!(\"l\", \"x\")",
            "\"abcabc\".substitute_all!(\"a\", \"z\")",
            "\"abc\".substitute_all!(\"x\", \"z\")"
          ]
        },
        "substitute_once" => {
          name: "substitute_once",
          description: "returns the string with the first match replaced.",
          examples: [
            "\"hello\".substitute_once(\"l\", \"x\")",
            "\"abc\".substitute_once(\"a\", \"z\")",
            "\"abc\".substitute_once(\"x\", \"z\")"
          ]
        },
        "substitute_once!" => {
          name: "substitute_once!",
          description: "replaces the first match in the string and returns it.",
          examples: [
            "\"hello\".substitute_once!(\"l\", \"x\")",
            "\"abc\".substitute_once!(\"a\", \"z\")",
            "\"abc\".substitute_once!(\"x\", \"z\")"
          ]
        },
        "swapcase" => {
          name: "swapcase",
          description: "returns the string with letter case swapped.",
          examples: [
            "\"AbC\".swapcase",
            "\"hello\".swapcase",
            "\"ABC\".swapcase"
          ]
        },
        "titleize" => {
          name: "titleize",
          description: "returns the string converted to title case.",
          examples: [
            "\"hello world\".titleize",
            "\"code ruby\".titleize",
            "\"one\".titleize"
          ]
        },
        "upcase" => {
          name: "upcase",
          description: "returns the string converted to uppercase.",
          examples: ["\"hello\".upcase", "\"Code\".upcase", "\"a1\".upcase"]
        },
        "upper_case" => {
          name: "upper_case",
          description: "returns the string converted to uppercase.",
          examples: [
            "\"hello\".upper_case",
            "\"Code\".upper_case",
            "\"a1\".upper_case"
          ]
        },
        "size" => {
          name: "size",
          description: "returns the number of characters in the string.",
          examples: ["\"abc\".size", "\"\".size", "\"hello\".size"]
        },
        "length" => {
          name: "length",
          description: "returns the number of characters in the string.",
          examples: ["\"abc\".length", "\"\".length", "\"hello\".length"]
        },
        "strip" => {
          name: "strip",
          description:
            "returns the string with surrounding whitespace removed.",
          examples: ["\" a \".strip", "\"\\na\".strip", "\"a\".strip"]
        },
        "left_strip" => {
          name: "left_strip",
          description: "returns the string with leading whitespace removed.",
          examples: [
            "\" a\".left_strip",
            "\"\\na\".left_strip",
            "\"a\".left_strip"
          ]
        },
        "right_strip" => {
          name: "right_strip",
          description: "returns the string with trailing whitespace removed.",
          examples: [
            "\"a \".right_strip",
            "\"a\\n\".right_strip",
            "\"a\".right_strip"
          ]
        },
        "slice" => {
          name: "slice",
          description: "returns a slice from the string.",
          examples: [
            "\"abc\".slice(0)",
            "\"abc\".slice(0, 2)",
            "\"abc\".slice(1)"
          ]
        },
        "left_justify" => {
          name: "left_justify",
          description: "returns the string left-justified to a width.",
          examples: [
            "\"a\".left_justify(3)",
            "\"a\".left_justify(3, \".\")",
            "\"abc\".left_justify(2)"
          ]
        },
        "right_justify" => {
          name: "right_justify",
          description: "returns the string right-justified to a width.",
          examples: [
            "\"a\".right_justify(3)",
            "\"a\".right_justify(3, \".\")",
            "\"abc\".right_justify(2)"
          ]
        },
        "center" => {
          name: "center",
          description: "returns the string centered within a width.",
          examples: [
            "\"a\".center(3)",
            "\"a\".center(3, \".\")",
            "\"abc\".center(2)"
          ]
        },
        "pad_start" => {
          name: "pad_start",
          description: "returns the string padded at the beginning.",
          examples: [
            "\"a\".pad_start(3)",
            "\"a\".pad_start(3, \"0\")",
            "\"abc\".pad_start(2)"
          ]
        },
        "pad_end" => {
          name: "pad_end",
          description: "returns the string padded at the end.",
          examples: [
            "\"a\".pad_end(3)",
            "\"a\".pad_end(3, \"0\")",
            "\"abc\".pad_end(2)"
          ]
        },
        "repeat" => {
          name: "repeat",
          description: "returns the string repeated a number of times.",
          examples: ["\"a\".repeat(3)", "\":\".repeat(2)", "\"ab\".repeat(2)"]
        },
        "substring" => {
          name: "substring",
          description: "returns a substring from the string.",
          examples: [
            "\"abc\".substring(0)",
            "\"abc\".substring(0, 2)",
            "\"hello\".substring(1, 3)"
          ]
        },
        "split" => {
          name: "split",
          description: "returns the string split into a list.",
          examples: [
            "\"a,b\".split(\",\")",
            "\"a b\".split",
            "\"a,b;c\".split(Regex.new(\"[,;]\"))"
          ]
        },
        "scan" => {
          name: "scan",
          description: "returns every regex match in the string.",
          examples: [
            "\"a1 b22\".scan(Regex.new(\"[0-9]+\"))",
            "\"abc\".scan(Regex.new(\"[a-z]\"))",
            "\"abc\".scan(Regex.new(\"x\"))"
          ]
        },
        "words" => {
          name: "words",
          description: "returns the words in the string as a list.",
          examples: ["\"hello world\".words", "\"one two\".words", "\"\".words"]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      def initialize(*args, **_kargs, &_block)
        self.raw =
          if args.first.is_an?(Class)
            args.first.raw.name
          elsif args.first.is_an?(Object)
            args.first.raw.to_s
          elsif args.first.is_a?(::Class)
            args.first.name
          elsif args.first
            args.first.to_s
          else
            ""
          end
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, List.new).to_code
        globals = multi_fetch(args, *GLOBALS)
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "&", "to_function"
          sig(args)
          code_to_function(**globals)
        when "*"
          sig(args) { Integer | Decimal }
          code_multiplication(code_value)
        when "+"
          sig(args) { Object }
          code_plus(code_value)
        when "downcase"
          sig(args)
          code_downcase
        when "lower_case"
          sig(args)
          code_lower_case
        when "include?", "member?"
          sig(args) { String }
          code_include?(code_value)
        when "match?", "matches?"
          sig(args) { Regex }
          code_match?(code_value)
        when "starts_with?"
          sig(args) { String }
          code_starts_with?(code_value)
        when "start_with?"
          sig(args) { String }
          code_start_with?(code_value)
        when "ends_with?"
          sig(args) { String }
          code_ends_with?(code_value)
        when "end_with?"
          sig(args) { String }
          code_end_with?(code_value)
        when "[]", "at", "get"
          sig(args) { Integer }
          code_get(code_value)
        when "capitalize"
          sig(args)
          code_capitalize
        when "characters"
          sig(args)
          code_characters
        when "bytes"
          sig(args)
          code_bytes
        when "bytesize"
          sig(args)
          code_bytesize
        when "byte_slice"
          sig(args) { [Integer, Integer.maybe] }
          code_byte_slice(*code_arguments.raw)
        when "codepoints"
          sig(args)
          code_codepoints
        when "character_code_at"
          sig(args) { Integer.maybe }
          code_character_code_at(code_value)
        when "ordinal"
          sig(args)
          code_ordinal
        when "chomp"
          sig(args)
          code_chomp
        when "chop"
          sig(args)
          code_chop
        when "delete"
          sig(args) { String }
          code_delete(code_value)
        when "delete_prefix"
          sig(args) { String }
          code_delete_prefix(code_value)
        when "delete_suffix"
          sig(args) { String }
          code_delete_suffix(code_value)
        when "empty?"
          sig(args)
          code_empty?
        when "clear"
          sig(args)
          code_clear
        when "count"
          sig(args) { String.repeat(1) }
          code_count(*code_arguments.raw)
        when "insert"
          sig(args) { [Integer, Object] }
          code_insert(*code_arguments.raw)
        when "prepend"
          sig(args) { Object }
          code_prepend(code_value)
        when "concat"
          sig(args) { Object.repeat(1) }
          code_concat(*code_arguments.raw)
        when "first"
          sig(args) { Integer.maybe }
          code_first(code_value)
        when "index"
          sig(args) { String | Regex }
          code_index(code_value)
        when "last"
          sig(args) { Integer.maybe }
          code_last(code_value)
        when "lines"
          sig(args)
          code_lines
        when "reverse"
          sig(args)
          code_reverse
        when "right_index"
          sig(args) { String | Regex }
          code_right_index(code_value)
        when "parameterize"
          sig(args)
          code_parameterize
        when "squish"
          sig(args)
          code_squish
        when "squeeze"
          sig(args) { String.repeat }
          code_squeeze(*code_arguments.raw)
        when "substitute"
          sig(args) { [String | Regex, String.maybe] }
          code_substitute(*code_arguments.raw)
        when "substitute!"
          sig(args) { [String | Regex, String.maybe] }
          code_substitute!(*code_arguments.raw)
        when "substitute_all"
          sig(args) { [String | Regex, String.maybe] }
          code_substitute_all(*code_arguments.raw)
        when "substitute_all!"
          sig(args) { [String | Regex, String.maybe] }
          code_substitute_all!(*code_arguments.raw)
        when "substitute_once"
          sig(args) { [String | Regex, String.maybe] }
          code_substitute_once(*code_arguments.raw)
        when "substitute_once!"
          sig(args) { [String | Regex, String.maybe] }
          code_substitute_once!(*code_arguments.raw)
        when "swapcase"
          sig(args)
          code_swapcase
        when "titleize"
          sig(args)
          code_titleize
        when "upcase"
          sig(args)
          code_upcase
        when "upper_case"
          sig(args)
          code_upper_case
        when "size", "length"
          sig(args)
          code_size
        when "strip"
          sig(args)
          code_strip
        when "left_strip"
          sig(args)
          code_left_strip
        when "right_strip"
          sig(args)
          code_right_strip
        when "slice"
          sig(args) { Object.repeat(1) }
          code_slice(*code_arguments.raw)
        when "left_justify"
          sig(args) { [Integer, String.maybe] }
          code_left_justify(*code_arguments.raw)
        when "right_justify"
          sig(args) { [Integer, String.maybe] }
          code_right_justify(*code_arguments.raw)
        when "center"
          sig(args) { [Integer, String.maybe] }
          code_center(*code_arguments.raw)
        when "pad_start"
          sig(args) { [Integer, String.maybe] }
          code_pad_start(*code_arguments.raw)
        when "pad_end"
          sig(args) { [Integer, String.maybe] }
          code_pad_end(*code_arguments.raw)
        when "repeat"
          sig(args) { Integer | Decimal }
          code_repeat(code_value)
        when "substring"
          sig(args) { [Integer.maybe, Integer.maybe] }
          code_substring(*code_arguments.raw)
        when "split"
          sig(args) { (String | Regex).maybe }
          code_split(code_value)
        when "scan"
          sig(args) { Regex }
          code_scan(code_value)
        when "words"
          sig(args)
          code_words
        else
          super
        end
      end

      def code_downcase
        String.new(raw.downcase)
      end

      def code_lower_case
        code_downcase
      end

      def code_upcase
        String.new(raw.upcase)
      end

      def code_upper_case
        code_upcase
      end

      def code_capitalize
        String.new(raw.capitalize)
      end

      def code_characters
        List.new(raw.chars)
      end

      def code_bytes
        List.new(raw.bytes)
      end

      def code_bytesize
        Integer.new(raw.bytesize)
      end

      def code_byte_slice(index, length = nil)
        code_index = index.to_code
        code_length = length.to_code
        value =
          if code_length.nothing?
            raw.byteslice(code_index.raw)
          else
            raw.byteslice(code_index.raw, code_length.raw)
          end

        value.to_code
      end

      def code_codepoints
        List.new(raw.codepoints)
      end

      def code_character_code_at(index = nil)
        code_index = index.to_code
        code_index = Integer.new(0) if code_index.nothing?

        raw.codepoints[code_index.raw].to_code
      end

      def code_ordinal
        raw.empty? ? Nothing.new : Integer.new(raw.ord)
      end

      def code_chomp
        String.new(raw.chomp)
      end

      def code_chop
        String.new(raw.chop)
      end

      def code_delete(value)
        code_value = value.to_code
        String.new(raw.delete(code_value.raw))
      end

      def code_delete_prefix(value)
        code_value = value.to_code
        String.new(raw.delete_prefix(code_value.raw))
      end

      def code_delete_suffix(value)
        code_value = value.to_code
        String.new(raw.delete_suffix(code_value.raw))
      end

      def code_empty?
        Boolean.new(raw.empty?)
      end

      def code_clear
        raw.clear
        self
      end

      def code_count(*selectors)
        code_selectors = selectors.to_code

        Integer.new(raw.count(*code_selectors.raw.map(&:to_s)))
      end

      def code_insert(index, value)
        code_index = index.to_code
        code_value = value.to_code

        raw.insert(code_index.raw, code_value.to_s)
        self
      end

      def code_prepend(value)
        code_value = value.to_code

        raw.prepend(code_value.to_s)
        self
      end

      def code_concat(*values)
        values.each { |value| raw.concat(value.to_code.to_s) }
        self
      end

      def code_get(value)
        code_value = value.to_code
        raw[code_value.raw].to_code
      end

      def code_include?(value)
        code_value = value.to_code
        Boolean.new(raw.include?(code_value.raw))
      end

      def code_match?(value)
        code_value = value.to_code
        Boolean.new(code_value.raw.match?(raw))
      end

      def code_index(value)
        code_value = value.to_code
        raw.index(code_value.raw).to_code
      end

      def code_last(n = nil)
        code_n = n.to_code
        code_n = Integer.new(1) if code_n.nothing?
        String.new(raw.last(code_n.raw))
      end

      def code_lines
        List.new(raw.lines)
      end

      def code_multiplication(other)
        code_other = other.to_code
        String.new(raw * code_other.raw)
      end

      def code_repeat(other)
        code_multiplication(other)
      end

      def code_starts_with?(value)
        code_value = value.to_code
        Boolean.new(raw.start_with?(code_value.raw))
      end

      def code_start_with?(value)
        code_starts_with?(value)
      end

      def code_end_with?(value)
        code_value = value.to_code
        Boolean.new(raw.end_with?(code_value.raw))
      end

      def code_ends_with?(value)
        code_end_with?(value)
      end

      def code_plus(other)
        code_other = other.to_code
        String.new(raw + code_other.to_s)
      end

      def code_reverse
        String.new(raw.reverse)
      end

      def code_right_index(value)
        code_value = value.to_code
        raw.rindex(code_value.raw).to_code
      end

      def code_to_function(**_globals)
        unless /\A[A-Za-z_][A-Za-z0-9_]*[!?]?\z/.match?(raw)
          raise Error, "String#to_function: invalid function name"
        end

        Function.new(
          [{ name: "_" }],
          Node::Code.new(
            [
              {
                left_operation: {
                  first: {
                    call: {
                      name: "_"
                    }
                  },
                  others: [
                    { operator: ".", statement: { call: { name: raw } } }
                  ]
                }
              }
            ]
          ),
          nil,
          Global.new
        )
      end

      def code_inspect
        String.new(raw.inspect)
      end

      def code_parameterize
        String.new(raw.parameterize)
      end

      def code_squish
        String.new(raw.squish)
      end

      def code_squeeze(*selectors)
        code_selectors = selectors.to_code

        String.new(raw.squeeze(*code_selectors.raw.map(&:to_s)))
      end

      def code_substitute(from = nil, to = nil)
        code_substitute_all(from, to)
      end

      def code_substitute!(from = nil, to = nil)
        code_substitute_all!(from, to)
      end

      def code_substitute_all(from = nil, to = nil)
        code_from = from.to_code
        code_to = to.to_code
        from_value = code_from.is_a?(Regex) ? code_from.raw : code_from.to_s

        String.new(raw.gsub(from_value, code_to.to_s))
      end

      def code_substitute_all!(from = nil, to = nil)
        self.raw = code_substitute_all(from, to).raw
        self
      end

      def code_substitute_once(from = nil, to = nil)
        code_from = from.to_code
        code_to = to.to_code
        from_value = code_from.is_a?(Regex) ? code_from.raw : code_from.to_s

        String.new(raw.sub(from_value, code_to.to_s))
      end

      def code_substitute_once!(from = nil, to = nil)
        self.raw = code_substitute_once(from, to).raw
        self
      end

      def code_swapcase
        String.new(raw.swapcase)
      end

      def code_titleize
        String.new(raw.titleize)
      end

      def code_first(n = nil)
        code_n = n.to_code
        code_n = Integer.new(1) if code_n.nothing?
        String.new(raw.first(code_n.raw))
      end

      def code_size
        Integer.new(raw.size)
      end

      def code_strip
        String.new(raw.strip)
      rescue ArgumentError, Encoding::CompatibilityError => e
        raise unless e.message.include?("invalid byte sequence")

        String.new(sanitized_utf8_raw.strip)
      end

      def code_left_strip
        String.new(raw.lstrip)
      end

      def code_right_strip
        String.new(raw.rstrip)
      end

      def code_slice(*arguments)
        code_arguments = arguments.to_code.raw

        if code_arguments.first.is_a?(Range)
          code_range = code_arguments.first
          range =
            ::Range.new(
              code_range.code_left.to_i,
              code_range.code_right.to_i,
              code_range.exclude_end?
            )

          return raw.slice(range).to_code
        end

        raw.slice(*code_arguments.map(&:to_i)).to_code
      end

      def code_left_justify(width, padding = nil)
        code_width = width.to_code
        code_padding = padding.to_code
        code_padding = String.new(" ") if code_padding.nothing?

        String.new(raw.ljust(code_width.raw, code_padding.to_s))
      end

      def code_right_justify(width, padding = nil)
        code_width = width.to_code
        code_padding = padding.to_code
        code_padding = String.new(" ") if code_padding.nothing?

        String.new(raw.rjust(code_width.raw, code_padding.to_s))
      end

      def code_center(width, padding = nil)
        code_width = width.to_code
        code_padding = padding.to_code
        code_padding = String.new(" ") if code_padding.nothing?

        String.new(raw.center(code_width.raw, code_padding.to_s))
      end

      def code_pad_start(width, padding = nil)
        code_width = width.to_code
        code_padding = padding.to_code
        code_padding = String.new(" ") if code_padding.nothing?

        String.new(raw.rjust(code_width.raw, code_padding.to_s))
      end

      def code_pad_end(width, padding = nil)
        code_width = width.to_code
        code_padding = padding.to_code
        code_padding = String.new(" ") if code_padding.nothing?

        String.new(raw.ljust(code_width.raw, code_padding.to_s))
      end

      def code_substring(start = nil, finish = nil)
        code_start = start.to_code
        code_finish = finish.to_code
        start_index = code_start.nothing? ? 0 : code_start.raw
        finish_index = code_finish.nothing? ? raw.length : code_finish.raw
        start_index = 0 if start_index.negative?
        finish_index = 0 if finish_index.negative?
        start_index, finish_index = finish_index, start_index if start_index >
          finish_index

        String.new(raw[start_index...finish_index].to_s)
      end

      def code_split(value)
        code_value = value.to_code

        if code_value.nothing?
          List.new(raw.split)
        else
          separator = code_value.is_a?(Regex) ? code_value.raw : code_value.to_s

          List.new(raw.split(separator))
        end
      end

      def code_scan(value)
        code_value = value.to_code

        List.new(
          raw.scan(code_value.raw).map do |match|
            match.is_a?(::Array) ? List.new(match) : String.new(match)
          end
        )
      end

      def code_words
        List.new(raw.split)
      end

      def present?
        raw.present?
      end

      private

      def sanitized_utf8_raw
        raw
          .dup
          .force_encoding(::Encoding::UTF_8)
          .encode(::Encoding::UTF_8, invalid: :replace, undef: :replace)
      end
    end
  end
end
