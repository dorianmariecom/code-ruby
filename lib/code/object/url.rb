# frozen_string_literal: true

class Code
  class Object
    class Url < Object
      CLASS_DOCUMENTATION = {
        name: "Url",
        description: "encodes text for urls, decodes url-escaped text, and parses strings as urls.",
        examples: [
          "Url.encode(\"hello world\")",
          "Url.decode(\"a%2Fb%3Fx%3D1\")",
          "Url.parse(\"https://example.com/a?b=1\")"
        ]
      }.freeze
      CLASS_FUNCTIONS = {
        "encode" => {
          name: "encode",
          description: "returns url-escaped text for a value.",
          examples: [
            "Url.encode(\"hello world\")",
            "Url.encode(\"a/b?x=1\")",
            "Url.encode(:hello)"
          ]
        },
        "decode" => {
          name: "decode",
          description: "returns text decoded from url-escaped text.",
          examples: [
            "Url.decode(\"hello+world\")",
            "Url.decode(\"a%2Fb%3Fx%3D1\")",
            "Url.decode(Url.encode(\"a+b\"))"
          ]
        },
        "parse" => {
          name: "parse",
          description: "returns a url parsed from a value, or an empty url when parsing fails.",
          examples: [
            "Url.parse(\"https://example.com/a?b=1\")",
            "Url.parse(\"/path\")",
            "Url.parse(\"not a url\")"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return CLASS_FUNCTIONS if scope == :class

        {}
      end

      def initialize(*args, **_kargs, &_block)
        self.raw = ::URI.parse(args.first.to_s)
      rescue ::URI::InvalidURIError
        self.raw = ::URI.parse("")
      end

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code

        case code_operator.to_s
        when "encode"
          sig(args) { Object.maybe }
          code_encode(*code_arguments.raw)
        when "decode"
          sig(args) { Object.maybe }
          code_decode(*code_arguments.raw)
        when "parse"
          sig(args) { Object.maybe }
          code_parse(*code_arguments.raw)
        else
          super
        end
      end

      def self.code_encode(string = nil)
        code_string = string.to_code

        String.new(CGI.escape(string.to_s))
      end

      def self.code_decode(string = nil)
        String.new(CGI.unescape(string.to_s))
      end

      def self.code_parse(string = nil)
        new(string)
      end
    end
  end
end
