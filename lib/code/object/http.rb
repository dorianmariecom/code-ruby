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
          username: String.maybe,
          password: String.maybe,
          data: Dictionary.maybe
        }
      ].freeze

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
        network_authentication_required: 511
      }.freeze

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code

        case code_operator.to_s
        when "get"
          sig(args) { SIG }
          code_get(*code_arguments.raw)
        when "head"
          sig(args) { SIG }
          code_head(*code_arguments.raw)
        when "post"
          sig(args) { SIG }
          code_post(*code_arguments.raw)
        when "put"
          sig(args) { SIG }
          code_put(*code_arguments.raw)
        when "delete"
          sig(args) { SIG }
          code_delete(*code_arguments.raw)
        when "options"
          sig(args) { SIG }
          code_options(*code_arguments.raw)
        when "trace"
          sig(args) { SIG }
          code_trace(*code_arguments.raw)
        when "patch"
          sig(args) { SIG }
          code_patch(*code_arguments.raw)
        when "fetch"
          sig(args) { [String] + SIG }
          code_fetch(*code_arguments.raw)
        else
          super
        end
      end

      def self.code_get(...)
        code_fetch("get", ...)
      end

      def self.code_head(...)
        code_fetch("head", ...)
      end

      def self.code_post(...)
        code_fetch("post", ...)
      end

      def self.code_put(...)
        code_fetch("put", ...)
      end

      def self.code_delete(...)
        code_fetch("delete", ...)
      end

      def self.code_options(...)
        code_fetch("options", ...)
      end

      def self.code_trace(...)
        code_fetch("trace", ...)
      end

      def self.code_patch(...)
        code_fetch("patch", ...)
      end

      def self.code_fetch(*arguments, redirects: 10)
        verb = arguments.first.to_code.to_s.downcase
        original_url = arguments.second.to_code.to_s
        options = arguments.third.to_code
        options = Dictionary.new if options.nothing?
        username = options.code_get("username").to_s
        password = options.code_get("password").to_s
        body = options.code_get("body").to_s
        headers = options.code_get("headers").raw || {}
        data = options.code_get("data").raw || {}
        query = options.code_get("query").raw || {}
        query = query.to_a.flatten.map(&:to_s).each_slice(2).to_h.to_query

        url = original_url
        url = "#{url}?#{query}" if query.present?

        if username.present? || password.present?
          authorization = ::Base64.strict_encode64("#{username}:#{password}")
          headers["Authorization"] = "Basic #{authorization}"
        end

        uri = ::URI.parse(url)
        http = ::Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if uri.scheme == "https"

        request_class =
          case verb
          when "head"
            ::Net::HTTP::Head
          when "post"
            ::Net::HTTP::Post
          when "put"
            ::Net::HTTP::Put
          when "delete"
            ::Net::HTTP::Delete
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
        request.body = body if body.present?
        request.set_form_data(**data.as_json) if data.present?
        response = http.request(request)

        code = response.code.to_i
        location = response["location"].to_s

        if (300..399).cover?(code) && location.present? && redirects > 0
          new_uri = ::URI.join(uri, location)

          if new_uri.host == uri.host
            code_fetch(
              "get",
              new_uri.to_s,
              {
                username: username,
                password: password,
                headers: headers
              },
              redirects: redirects - 1
            )
          else
            code_fetch("get", new_uri.to_s, redirects: redirects - 1)
          end
        else
          status = STATUS_CODES.key(code) || :ok
          Dictionary.new(code: code, status: status, body: response.body.to_s)
        end
      end
    end
  end
end
