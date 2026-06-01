# frozen_string_literal: true

class Code
  class Object
    class Smtp < Dictionary
      CLASS_DOCUMENTATION = {
        name: "Smtp",
        description: "stores smtp settings and sends email messages.",
        examples: %w[Smtp Smtp.new Smtp.new.functions.keys.include?(:send)]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "send" => {
          name: "send",
          description: "sends an email using the receiver's smtp settings.",
          examples: %w[
            Smtp.new.respond_to?(:send)
            Smtp.new.functions.keys.include?(:send)
            Smtp.new.instance_functions.keys.include?(:send)
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      DEFAULT_PORT = 587
      DEFAULT_TIMEOUT = 10
      DEFAULT_DOMAIN = "localhost.localdomain"
      ALLOWED_PORTS = [465, 587].freeze

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "send"
          sig(args) do
            {
              from: String.maybe,
              to: String.maybe,
              subject: String.maybe,
              body: String.maybe,
              body_text: String.maybe,
              body_html: String.maybe
            }
          end

          code_send(
            from: code_value.code_get("from"),
            to: code_value.code_get("to"),
            subject: code_value.code_get("subject"),
            body: code_value.code_get("body"),
            body_text: code_value.code_get("body_text"),
            body_html: code_value.code_get("body_html")
          )
        else
          super
        end
      end

      def code_send(
        from: nil,
        to: nil,
        subject: nil,
        body: nil,
        body_text: nil,
        body_html: nil
      )
        code_from = from.to_code
        code_to = to.to_code
        code_subject = subject.to_code
        code_body = body.to_code
        code_body_text = body_text.to_code
        code_body_html = body_html.to_code

        mail = Mail.new
        mail.from = code_from.to_s
        mail.to = code_to.to_s
        mail.subject = code_subject.to_s

        text_part = Mail::Part.new
        text_part.content_type = "text/plain; charset=UTF-8"
        text_part.body = code_body_text.to_s.presence || code_body.to_s

        html_part = Mail::Part.new
        html_part.content_type = "text/html; charset=UTF-8"
        html_part.body = code_body_html.to_s

        mail.content_type = "multipart/alternative"
        mail.add_part(text_part)
        mail.add_part(html_part) if code_body_html.to_s.present?

        address = code_get("address").to_s
        port = code_get("port").nothing? ? DEFAULT_PORT : code_get("port").to_i
        authentication = code_get("authentication").to_s
        starttls = code_get("enable_starttls_auto")
        if starttls.something? && starttls.falsy?
          raise Error, "smtp: tls is required"
        end

        resolved_ip = validate_delivery_target!(address, port)

        encoded_message = mail.encoded
        ::Code.ensure_input_size!(encoded_message, label: "smtp message")

        deliver_mail(
          mail,
          address: address,
          resolved_ip: resolved_ip,
          port: port,
          user_name: code_get("user_name").to_s,
          password: code_get("password").to_s,
          authentication: authentication
        )

        Nothing.new
      end

      private

      def validate_delivery_target!(address, port)
        resolved_ip =
          ::Code::Network.validate_public_host!(address, service: "smtp").first

        return resolved_ip if ALLOWED_PORTS.include?(port)

        raise Error, "smtp: unsupported port"
      end

      def deliver_mail(
        mail,
        address:,
        resolved_ip:,
        port:,
        user_name:,
        password:,
        authentication:
      )
        envelope = Mail::SmtpEnvelope.new(mail)
        smtp =
          Net::SMTP.new(
            resolved_ip,
            port,
            tls: port == 465,
            starttls: port == 587 ? :always : false,
            tls_verify: true,
            tls_hostname: address,
            ssl_context_params: {
              verify_mode: OpenSSL::SSL::VERIFY_PEER
            }
          )
        smtp.open_timeout = DEFAULT_TIMEOUT
        smtp.read_timeout = DEFAULT_TIMEOUT

        smtp.start(
          DEFAULT_DOMAIN,
          user_name.presence,
          password.presence,
          authentication.presence
        ) do |connection|
          connection.sendmail(envelope.message, envelope.from, envelope.to)
        end
      rescue Timeout::Error
        raise Error, "smtp timeout"
      rescue OpenSSL::SSL::SSLError,
             IOError,
             SystemCallError,
             SocketError,
             Net::SMTPError
        raise Error, "smtp error"
      end
    end
  end
end
