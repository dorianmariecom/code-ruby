# frozen_string_literal: true

class Code
  class Object
    class Smtp < Dictionary
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

        mail.delivery_method(
          :smtp,
          {
            address: code_get("address").to_s,
            port: code_get("port").to_i,
            user_name: code_get("user_name").to_s,
            password: code_get("password").to_s,
            authentication: code_get("authentication").to_s,
            enable_starttls_auto: code_get("enable_starttls_auto").truthy?
          }
        )

        mail.deliver!

        Nothing.new
      end
    end
  end
end
