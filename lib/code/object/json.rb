# frozen_string_literal: true

class Code
  class Object
    class Json < Object
      CLASS_DOCUMENTATION = {
        name: "Json",
        description: "parses json text and serializes values as json text.",
        examples: [
          "Json.parse(\"{}\")",
          "Json.generate({ a: 1 })",
          "Json.generate([1, 2], { pretty: true })"
        ]
      }.freeze
      CLASS_FUNCTIONS = {
        "parse" => {
          name: "parse",
          description: "returns a value parsed from json text, or nothing when parsing fails.",
          examples: [
            "Json.parse(\"{}\")",
            "Json.parse(\"[1,2]\")",
            "Json.parse(\"bad json\")"
          ]
        },
        "generate" => {
          name: "generate",
          description: "returns json text for a value, optionally formatted for readability.",
          examples: [
            "Json.generate({ a: 1 })",
            "Json.generate([1, 2])",
            "Json.generate({ a: 1 }, { pretty: true })"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return CLASS_FUNCTIONS if scope == :class

        {}
      end

      MAX_NESTING = 100
      MAX_ITEMS = 10_000

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "parse"
          sig(args) { String }
          code_parse(code_value)
        when "generate"
          sig(args) { [Object, { pretty: Object::Boolean.maybe }] }

          if code_arguments.code_second.something?
            code_generate(code_value, pretty: code_arguments.code_second.code_get(:pretty))
          else
            code_generate(code_value)
          end
        else
          super
        end
      end

      def self.code_parse(value)
        code_value = value.to_code
        ::Code.ensure_input_size!(code_value.raw, label: "json")

        parsed = ::JSON.parse(code_value.raw)
        validate_shape!(parsed)
        parsed.to_code
      rescue JSON::ParserError
        Nothing.new
      end

      def self.code_generate(value, pretty: nil)
        value.to_code.code_to_json(pretty: pretty)
      end

      def self.validate_shape!(value, depth: 0, count: 0)
        raise Error, "json is too deeply nested" if depth > MAX_NESTING
        raise Error, "json has too many items" if count > MAX_ITEMS

        case value
        when ::Array
          count += value.size
          value.each do |item|
            count = validate_shape!(item, depth: depth + 1, count: count)
          end
        when ::Hash
          count += value.size
          value.each_value do |item|
            count = validate_shape!(item, depth: depth + 1, count: count)
          end
        end

        count
      end
    end
  end
end
