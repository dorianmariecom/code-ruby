# frozen_string_literal: true

class Code
  class Object
    class Url < Object
      CLASS_DOCUMENTATION = {
        name: "Url",
        description:
          "encodes text for urls, decodes url-escaped text, and parses strings as urls.",
        examples: [
          "Url.encode(\"hello world\")",
          "Url.decode(\"a%2Fb%3Fx%3D1\")",
          "Url.parse(\"https://example.com/a?b=1\")"
        ]
      }.freeze
      CLASS_FUNCTIONS = {
        "join" => {
          name: "join",
          description: "resolves a relative URL against a base URL.",
          examples: [
            "Url.join(\"https://example.com/a/b\", \"../c\")",
            "Url.join(\"https://example.com/a\", \"/b\")",
            "Url.join(\"https://example.com\", \"https://other.example.com\")"
          ]
        },
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
          description:
            "returns a url parsed from a value, or an empty url when parsing fails.",
          examples: [
            "Url.parse(\"https://example.com/a?b=1\")",
            "Url.parse(\"/path\")",
            "Url.parse(\"not a url\")"
          ]
        }
      }.freeze

      INSTANCE_FUNCTIONS = {
        "scheme" => {
          name: "scheme",
          description: "returns the scheme URL component.",
          examples: [
            "Url.parse(\"https://example.com/path?q=1\").scheme",
            "Url.parse(\"https://user:pass@example.com/#fragment\").scheme",
            "Url.parse(\"/relative\").scheme"
          ]
        },
        "host" => {
          name: "host",
          description: "returns the host URL component.",
          examples: [
            "Url.parse(\"https://example.com/path?q=1\").host",
            "Url.parse(\"https://user:pass@example.com/#fragment\").host",
            "Url.parse(\"/relative\").host"
          ]
        },
        "path" => {
          name: "path",
          description: "returns the path URL component.",
          examples: [
            "Url.parse(\"https://example.com/path?q=1\").path",
            "Url.parse(\"https://user:pass@example.com/#fragment\").path",
            "Url.parse(\"/relative\").path"
          ]
        },
        "query" => {
          name: "query",
          description: "returns the query URL component.",
          examples: [
            "Url.parse(\"https://example.com/path?q=1\").query",
            "Url.parse(\"https://user:pass@example.com/#fragment\").query",
            "Url.parse(\"/relative\").query"
          ]
        },
        "fragment" => {
          name: "fragment",
          description: "returns the fragment URL component.",
          examples: [
            "Url.parse(\"https://example.com/path?q=1\").fragment",
            "Url.parse(\"https://user:pass@example.com/#fragment\").fragment",
            "Url.parse(\"/relative\").fragment"
          ]
        },
        "user" => {
          name: "user",
          description: "returns the user URL component.",
          examples: [
            "Url.parse(\"https://example.com/path?q=1\").user",
            "Url.parse(\"https://user:pass@example.com/#fragment\").user",
            "Url.parse(\"/relative\").user"
          ]
        },
        "password" => {
          name: "password",
          description: "returns the password URL component.",
          examples: [
            "Url.parse(\"https://example.com/path?q=1\").password",
            "Url.parse(\"https://user:pass@example.com/#fragment\").password",
            "Url.parse(\"/relative\").password"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return CLASS_FUNCTIONS if scope == :class
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      def initialize(*args, **_kargs, &)
        self.raw = ::URI.parse(args.first.to_s)
      rescue ::URI::InvalidURIError
        self.raw = ::URI.parse("")
      end

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code

        case code_operator.to_s
        when "join"
          sig(args) { [String, String] }
          code_join(*code_arguments.raw)
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

      def self.code_join(base, relative)
        ::URI.join(base.to_s, relative.to_s).to_s.to_code
      rescue ::URI::InvalidURIError, ::URI::BadURIError
        raise ::Code::Error, "invalid URL"
      end

      def call(**args)
        operator = args.fetch(:operator, nil).to_s
        case operator
        when "scheme"
          sig(args)
          code_scheme
        when "host"
          sig(args)
          code_host
        when "path"
          sig(args)
          code_path
        when "query"
          sig(args)
          code_query
        when "fragment"
          sig(args)
          code_fragment
        when "user"
          sig(args)
          code_user
        when "password"
          sig(args)
          code_password
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

      def code_scheme
        raw.scheme.to_code
      end

      def code_host
        raw.host.to_code
      end

      def code_path
        raw.path.to_code
      end

      def code_query
        raw.query.to_code
      end

      def code_fragment
        raw.fragment.to_code
      end

      def code_user
        raw.user.to_code
      end

      def code_password
        raw.password.to_code
      end
    end
  end
end
