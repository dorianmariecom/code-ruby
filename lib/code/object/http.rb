# frozen_string_literal: true

class Code
  class Object
    class Http < Object
      SIG = [
        String,
        {
          headers: Dictionary.maybe,
          query: Dictionary.maybe,
          body: String.maybe,
        }
      ]

      STATUS_CODES = {
        continue: 100,
        switching_protocols: 101,
        processing: 102,
        early_hints: 103,
        ok: 200,
        created: 201,
        accepted: 202,
        non_authoritative_information: 203,
        no_content: 204,
        reset_content: 205,
        partial_content: 206,
        multi_status: 207,
        already_reported: 208,
        im_used: 226,
        multiple_choices: 300,
        moved_permanently: 301,
        found: 302,
        see_other: 303,
        not_modified: 304,
        use_proxy: 305,
        reserved: 306,
        temporary_redirect: 307,
        permanent_redirect: 308,
        bad_request: 400,
        unauthorized: 401,
        payment_required: 402,
        forbidden: 403,
        not_found: 404,
        method_not_allowed: 405,
        not_acceptable: 406,
        proxy_authentication_required: 407,
        request_timeout: 408,
        conflict: 409,
        gone: 410,
        length_required: 411,
        precondition_failed: 412,
        request_entity_too_large: 413,
        request_uri_too_long: 414,
        unsupported_media_type: 415,
        requested_range_not_satisfiable: 416,
        expectation_failed: 417,
        misdirected_request: 421,
        unprocessable_entity: 422,
        locked: 423,
        failed_dependency: 424,
        too_early: 425,
        upgrade_required: 426,
        precondition_required: 428,
        too_many_requests: 429,
        request_header_fields_too_large: 431,
        unavailable_for_legal_reasons: 451,
        internal_server_error: 500,
        not_implemented: 501,
        bad_gateway: 502,
        service_unavailable: 503,
        gateway_timeout: 504,
        http_version_not_supported: 505,
        variant_also_negotiates: 506,
        insufficient_storage: 507,
        loop_detected: 508,
        bandwidth_limit_exceeded: 509,
        not_extended: 510,
        network_authentication_required: 511,
      }


      def self.call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, List.new)

        case operator.to_s
        when "get"
          sig(args) { SIG }
          code_get(*arguments.raw)
        when "head"
          sig(args) { SIG }
          code_head(*arguments.raw)
        when "post"
          sig(args) { SIG }
          code_post(*arguments.raw)
        when "put"
          sig(args) { SIG }
          code_put(*arguments.raw)
        when "delete"
          sig(args) { SIG }
          code_delete(*arguments.raw)
        when "connect"
          sig(args) { SIG }
          code_connect(*arguments.raw)
        when "options"
          sig(args) { SIG }
          code_options(*arguments.raw)
        when "trace"
          sig(args) { SIG }
          code_trace(*arguments.raw)
        when "patch"
          sig(args) { SIG }
          code_patch(*arguments.raw)
        when "fetch"
          sig(args) { [String] + SIG }
          code_fetch(*arguments.raw)
        else
          super
        end
      end

      def self.code_get(...)
        code_fetch(String.new("get"), ...)
      end

      def self.code_head(...)
        code_fetch(String.new("head"), ...)
      end

      def self.code_post(...)
        code_fetch(String.new("post"), ...)
      end

      def self.code_put(...)
        code_fetch(String.new("put"), ...)
      end

      def self.code_delete(...)
        code_fetch(String.new("delete"), ...)
      end

      def self.code_connect(...)
        code_fetch(String.new("connect"), ...)
      end

      def self.code_options(...)
        code_fetch(String.new("options"), ...)
      end

      def self.code_trace(...)
        code_fetch(String.new("trace"), ...)
      end

      def self.code_patch(...)
        code_fetch(String.new("patch"), ...)
      end

      def self.code_fetch(*arguments)
        verb = (arguments.first || String.new).raw.downcase
        url = (arguments.second || String.new).raw
        options = arguments.third || {}
        body = (options[String.new("body")] || String.new).raw
        headers = (options[String.new("headers")] || Dictionary.new).raw
        query = (options[String.new("query")] || Dictionary.new).raw
        query = query.to_a.flatten.map(&:to_s).each_slice(2).to_h.to_query
        url = query.present? ? "#{url}?#{query}" : url
        uri = ::URI.parse(url)
        http = ::Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if uri.scheme == "https"

        request_class =
          case verb
          when "get"
            ::Net::HTTP::Get
          when "head"
            ::Net::HTTP::Head
          when "post"
            ::Net::HTTP::Post
          when "put"
            ::Net::HTTP::Put
          when "delete"
            ::Net::HTTP::Delete
          when "connect"
            ::Net::HTTP::Get
          when "options"
            ::Net::HTTP::Options
          when "trace"
            ::Net::HTTP::Trace
          when "patch"
            ::Net::HTTP::Patch
          else
            ::Net::HTTP::Get
          end

        request = request_class.new(uri)
        headers.each { |key, value| request[key.to_s] = value.to_s }
        request.body = body

        response = http.request(request)
        code = response.code.to_i
        status = STATUS_CODES.key(code) || :ok

        Dictionary.new(
          String.new("code") => Integer.new(code),
          String.new("status") => String.new(status),
          String.new("body") => String.new(response.body),
        )
      end
    end
  end
end
