# frozen_string_literal: true

class Code
  class Object
    class Smtp < Dictionary
      CLASS_DOCUMENTATION = {
        name: "Smtp",
        description: "stores smtp settings and sends email messages.",
        examples: %w[Smtp Smtp.new Smtp.new.functions.keys.include?(:send)]
      }.freeze
      MESSAGE_ARGUMENTS = {
        from: String.maybe,
        to: String.maybe,
        subject: String.maybe,
        body: String.maybe,
        body_text: String.maybe,
        body_html: String.maybe,
        message_id: String.maybe
      }.freeze
      TEXT_CONTENT_TYPE = "text/plain; charset=UTF-8"
      HTML_CONTENT_TYPE = "text/html; charset=UTF-8"
      MULTIPART_CONTENT_TYPE = "multipart/alternative"
      CLASS_FUNCTIONS = {
        "encode" => {
          name: "encode",
          description: "encodes a message as MIME email.",
          examples: [
            'Smtp.encode({from: "a@example.com", to: "b@example.com", body: "hello"})',
            'Smtp.encode({subject: "hello", body_text: "world"})',
            'Smtp.encode({body_html: "<p>hello</p>"})'
          ]
        },
        "address" => {
          name: "address",
          description: "parses a single email address and display name.",
          examples: [
            'Smtp.address("a@example.com")',
            'Smtp.address("Alice <a@example.com>")',
            'Smtp.address("Bob <b@example.com>")'
          ]
        }
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

        CLASS_FUNCTIONS
      end

      DEFAULT_PORT = 587
      DEFAULT_TIMEOUT = 10
      DEFAULT_DOMAIN = "localhost.localdomain"
      ALLOWED_PORTS = [465, 587].freeze

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code

        case code_operator.to_s
        when "encode"
          sig(args) { MESSAGE_ARGUMENTS }
          code_encode(code_arguments.code_first)
        when "address"
          sig(args) { String }
          code_address(*code_arguments.raw)
        else
          super
        end
      end

      def self.code_address(value)
        text = value.to_s
        raise Error, "smtp: invalid address" if text.match?(/[\r\n]/)

        addresses = Mail::AddressList.new(text).addresses
        raise Error, "smtp: expected one address" unless addresses.length == 1

        address = addresses.first
        unless address.local.present? && address.domain.present?
          raise Error, "smtp: invalid address"
        end

        { email: address.address, name: address.display_name }.to_code
      rescue Mail::Field::ParseError
        raise Error, "smtp: invalid address"
      end

      def self.code_encode(message)
        build_mail(message.to_code).encoded.to_code
      end

      def self.build_mail(message)
        mail = Mail.new
        mail.from = message.code_get("from").to_s
        mail.to = message.code_get("to").to_s
        mail.subject = message.code_get("subject").to_s
        message_id = message.code_get("message_id").to_s
        if message_id.match?(/[\r\n]/)
          raise Error, "smtp: invalid message id"
        end

        mail.message_id = message_id if message_id.present?

        text_part = Mail::Part.new
        text_part.content_type = TEXT_CONTENT_TYPE
        text_part.body = message.code_get("body_text").to_s.presence || message.code_get("body").to_s
        mail.content_type = MULTIPART_CONTENT_TYPE
        mail.add_part(text_part)
        if message.code_get("body_html").to_s.present?
          html_part = Mail::Part.new
          html_part.content_type = HTML_CONTENT_TYPE
          html_part.body = message.code_get("body_html").to_s
          mail.add_part(html_part)
        end
        mail
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "send"
          sig(args) { MESSAGE_ARGUMENTS }

          code_send(
            from: code_value.code_get("from"),
            to: code_value.code_get("to"),
            subject: code_value.code_get("subject"),
            body: code_value.code_get("body"),
            body_text: code_value.code_get("body_text"),
            body_html: code_value.code_get("body_html"),
            message_id: code_value.code_get("message_id")
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
        body_html: nil,
        message_id: nil
      )
        mail = self.class.build_mail(
          { from:, to:, subject:, body:, body_text:, body_html:, message_id: }.to_code
        )

        address = code_get("address").to_s
        port = code_get("port").nothing? ? DEFAULT_PORT : code_get("port").to_i
        authentication = code_get("authentication").to_s
        starttls = code_get("enable_starttls_auto")
        if starttls.something? && starttls.falsy?
          raise Error, "smtp: tls is required"
        end

        resolved_ip = validate_delivery_target!(address, port)

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
