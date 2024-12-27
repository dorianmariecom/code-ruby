# frozen_string_literal: true

class Code
  class Object
    class Html < Object
      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code

        case code_operator.to_s
        when "link_to"
          sig(args) { [Object.maybe, Object.maybe] }
          code_link_to(*code_arguments.raw)
        when "escape"
          sig(args) { Object.maybe }
          code_escape(*code_arguments.raw)
        else
          super
        end
      end

      def self.code_link_to(text = nil, href = nil)
        code_text = text.to_code
        code_href = href.to_code

        String.new(<<~LINK.strip)
          <a
            href="#{CGI.escapeHTML(code_href.to_s)}"
          >#{CGI.escapeHTML(code_text.to_s)}</a>
        LINK
      end

      def self.code_escape(string = nil)
        code_string = string.to_code

        String.new(CGI.escapeHTML(string.to_s))
      end
    end
  end
end
