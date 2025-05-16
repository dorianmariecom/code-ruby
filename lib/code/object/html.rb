# frozen_string_literal: true

class Code
  class Object
    class Html < Object
      def initialize(*args, **_kargs, &_block)
        self.raw =
          if args.first.is_an?(Html)
            args.first.raw
          elsif args.first.is_a?(::Nokogiri::XML::NodeSet) ||
                args.first.is_a?(Nokogiri::XML::Node)
            args.first
          else
            Nokogiri.HTML(args.first.to_s)
          end
      end

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

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first
        globals = multi_fetch(args, *GLOBALS)

        case code_operator.to_s
        when "css"
          sig(args) { String }
          code_css(code_value)
        when "at_css"
          sig(args) { String }
          code_at_css(code_value)
        when "map"
          sig(args) { Function }
          code_map(code_value, **globals)
        when "to_string"
          sig(args)
          code_to_string
        else
          super
        end
      end

      def code_css(query)
        code_query = query.to_code

        Html.new(raw.css(code_query.raw))
      end

      def code_at_css(query)
        code_query = query.to_code

        Html.new(raw.at_css(code_query.raw))
      end

      def code_map(argument, **globals)
        code_argument = argument.to_code

        List.new(
          raw.map.with_index do |element, index|
            code_argument.call(
              arguments: List.new([element.to_code, Integer.new(index), self]),
              **globals
            )
          rescue Error::Next => e
            e.code_value
          end
        )
      end

      def to_s
        raw.text
      end

      def code_to_string
        String.new(raw.text)
      end
    end
  end
end
