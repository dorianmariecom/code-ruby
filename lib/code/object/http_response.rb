# frozen_string_literal: true

class Code
  class Object
    class HttpResponse < Dictionary
      CLASS_DOCUMENTATION = {
        name: "HttpResponse",
        description: "an HTTP response with JSON and retry status helpers.",
        examples: %w[
          Http.get("http://httpbin.org/status/200").code
          Http.get("http://httpbin.org/status/204").success?
          Http.get("http://httpbin.org/status/500").retryable?
        ]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "json" => {
          name: "json",
          description: "parses the response body or returns nothing.",
          examples: [
            "Http.get(\"http://httpbin.org/status/200\").json",
            "Http.get(\"http://httpbin.org/status/204\").json",
            "Http.get(\"http://httpbin.org/status/500\").json"
          ]
        },
        "json!" => {
          name: "json!",
          description: "parses the response body or raises on malformed JSON.",
          examples: [
            "Http.get(\"http://httpbin.org/status/200\").json! rescue nothing",
            "Http.get(\"http://httpbin.org/status/204\").json! rescue nothing",
            "Http.get(\"http://httpbin.org/status/500\").json! rescue nothing"
          ]
        },
        "retryable?" => {
          name: "retryable?",
          description:
            "reports request timeout rate limit and server error statuses.",
          examples: [
            "Http.get(\"http://httpbin.org/status/408\").retryable?",
            "Http.get(\"http://httpbin.org/status/429\").retryable?",
            "Http.get(\"http://httpbin.org/status/200\").retryable?"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        scope == :instance ? INSTANCE_FUNCTIONS : {}
      end

      def call(**args)
        case args.fetch(:operator, nil).to_s
        when "json"
          sig(args)
          code_json
        when "json!"
          sig(args)
          code_json!
        when "retryable?"
          sig(args)
          code_retryable?
        else
          super
        end
      end

      def code_json
        Json.code_parse(code_get("body"))
      end

      def code_json!
        Json.code_parse!(code_get("body"))
      end

      def code_retryable?
        status = code_get("code").raw
        ([408, 429].include?(status) || status.between?(500, 599)).to_code
      end
    end
  end
end
