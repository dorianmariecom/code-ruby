# frozen_string_literal: true

class Code
  class Object
    class Html < Object
      def initialize(*args, **_kargs, &_block)
        @raw = nil
      end

      def self.call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, List.new)

        case operator.to_s
        when "link_to"
          sig(args) { [String.maybe, String.maybe] }
          code_link_to(*arguments.raw)
        when "escape"
          sig(args) { String.maybe }
          code_escape(*arguments.raw)
        else
          super
        end
      end

      def self.code_link_to(text = nil, href = nil)
        text ||= Nothing.new
        href ||= Nothing.new

        String.new(<<~LINK.strip)
          <a href="#{CGI.escapeHTML(href.raw.to_s)}">#{CGI.escapeHTML(text.raw.to_s)}</a>
        LINK
      end

      def self.code_escape(string = nil)
        string ||= Nothing.new

        String.new(CGI.escapeHTML(string.raw.to_s))
      end
    end
  end
end
