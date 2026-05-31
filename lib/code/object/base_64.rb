# frozen_string_literal: true

class Code
  class Object
    class Base64 < Object
      CLASS_DOCUMENTATION = {
        name: "Base64",
        description: "encodes and decodes strings with base64 text formats.",
        examples: [
          "Base64.encode(:hello)",
          "Base64.decode(Base64.encode(:hello))",
          "Base64.urlsafe_decode(Base64.urlsafe_encode(\"???\"))"
        ]
      }.freeze
      CLASS_FUNCTIONS = {
        "encode" => {
          name: "encode",
          description: "returns base64 text with line breaks for a string.",
          examples: [
            "Base64.encode(:hello)",
            "Base64.encode(:hello_world)",
            "Base64.encode(\"123\")"
          ]
        },
        "encode_64" => {
          name: "encode_64",
          description: "returns base64 text with line breaks for a string.",
          examples: [
            "Base64.encode_64(:hello)",
            "Base64.encode_64(:hello_world)",
            "Base64.encode_64(\"123\")"
          ]
        },
        "decode" => {
          name: "decode",
          description: "returns a string decoded from base64 text.",
          examples: [
            "Base64.decode(\"aGVsbG8=\")",
            "Base64.decode(Base64.encode(:hello))",
            "Base64.decode(\"MTIz\")"
          ]
        },
        "decode_64" => {
          name: "decode_64",
          description: "returns a string decoded from base64 text.",
          examples: [
            "Base64.decode_64(\"aGVsbG8=\")",
            "Base64.decode_64(Base64.encode(:hello))",
            "Base64.decode_64(\"MTIz\")"
          ]
        },
        "strict_encode" => {
          name: "strict_encode",
          description: "returns base64 text without line breaks for a string.",
          examples: [
            "Base64.strict_encode(:hello)",
            "Base64.strict_encode(:hello_world)",
            "Base64.strict_encode(\"123\")"
          ]
        },
        "strict_encode_64" => {
          name: "strict_encode_64",
          description: "returns base64 text without line breaks for a string.",
          examples: [
            "Base64.strict_encode_64(:hello)",
            "Base64.strict_encode_64(:hello_world)",
            "Base64.strict_encode_64(\"123\")"
          ]
        },
        "strict_decode" => {
          name: "strict_decode",
          description: "returns a string decoded from strict base64 text.",
          examples: [
            "Base64.strict_decode(\"aGVsbG8=\")",
            "Base64.strict_decode(Base64.strict_encode(:hello))",
            "Base64.strict_decode(\"MTIz\")"
          ]
        },
        "strict_decode_64" => {
          name: "strict_decode_64",
          description: "returns a string decoded from strict base64 text.",
          examples: [
            "Base64.strict_decode_64(\"aGVsbG8=\")",
            "Base64.strict_decode_64(Base64.strict_encode(:hello))",
            "Base64.strict_decode_64(\"MTIz\")"
          ]
        },
        "urlsafe_encode" => {
          name: "urlsafe_encode",
          description: "returns url-safe base64 text for a string.",
          examples: [
            "Base64.urlsafe_encode(:hello)",
            "Base64.urlsafe_encode(\">>>\")",
            "Base64.urlsafe_encode(\"???\")"
          ]
        },
        "url_safe_encode_64" => {
          name: "url_safe_encode_64",
          description: "returns url-safe base64 text for a string.",
          examples: [
            "Base64.url_safe_encode_64(:hello)",
            "Base64.url_safe_encode_64(\">>>\")",
            "Base64.url_safe_encode_64(\"???\")"
          ]
        },
        "urlsafe_decode" => {
          name: "urlsafe_decode",
          description: "returns a string decoded from url-safe base64 text.",
          examples: [
            "Base64.urlsafe_decode(\"aGVsbG8=\")",
            "Base64.urlsafe_decode(\"Pj4-\")",
            "Base64.urlsafe_decode(\"Pz8_\")"
          ]
        },
        "url_safe_decode_64" => {
          name: "url_safe_decode_64",
          description: "returns a string decoded from url-safe base64 text.",
          examples: [
            "Base64.url_safe_decode_64(\"aGVsbG8=\")",
            "Base64.url_safe_decode_64(\"Pj4-\")",
            "Base64.url_safe_decode_64(\"Pz8_\")"
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
        when "encode", "encode_64"
          sig(args) { String }
          code_encode(code_value)
        when "decode", "decode_64"
          sig(args) { String }
          code_decode(code_value)
        when "strict_encode", "strict_encode_64"
          sig(args) { String }
          code_strict_encode(code_value)
        when "strict_decode", "strict_decode_64"
          sig(args) { String }
          code_strict_decode(code_value)
        when "urlsafe_encode", "url_safe_encode_64"
          sig(args) { String }
          code_urlsafe_encode(code_value)
        when "urlsafe_decode", "url_safe_decode_64"
          sig(args) { String }
          code_urlsafe_decode(code_value)
        else
          super
        end
      end

      def self.code_encode(string)
        code_string = string.to_code

        String.new(::Base64.encode64(code_string.to_s))
      end

      def self.code_decode(string)
        code_string = string.to_code

        String.new(::Base64.decode64(code_string.to_s))
      end

      def self.code_strict_encode(string)
        code_string = string.to_code

        String.new(::Base64.strict_encode64(code_string.to_s))
      end

      def self.code_strict_decode(string)
        code_string = string.to_code

        String.new(::Base64.strict_decode64(code_string.to_s))
      end

      def self.code_urlsafe_encode(string)
        code_string = string.to_code

        String.new(::Base64.urlsafe_encode64(code_string.to_s))
      end

      def self.code_urlsafe_decode(string)
        code_string = string.to_code

        String.new(::Base64.urlsafe_decode64(code_string.to_s))
      end
    end
  end
end
