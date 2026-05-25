# frozen_string_literal: true

class Code
  class Object
    class Json < Object
      CLASS_FUNCTIONS = {
        "parse" => {
          name: "parse",
          description: "parses a json string into a value.",
          examples: [
            "Json.parse(\"{\\\"a\\\":1}\")",
            "Json.parse(\"[1,2]\")",
            "Json.parse(\"bad json\")"
          ]
        },
        "generate" => {
          name: "generate",
          description: "serializes a value as json.",
          examples: [
            "Json.generate({ a: 1 })",
            "Json.generate([1, 2])",
            "Json.generate({ a: 1 }, pretty: true)"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return CLASS_FUNCTIONS if scope == :class

        {}
      end

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

        ::JSON.parse(code_value.raw).to_code
      rescue JSON::ParserError
        Nothing.new
      end

      def self.code_generate(value, pretty: nil)
        value.to_code.code_to_json(pretty: pretty)
      end
    end
  end
end
