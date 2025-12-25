# frozen_string_literal: true

class Code
  class Object
    class Html < Object
      TAGS = %w[
        a abbr address area article aside audio b base bdi bdo blockquote body br
        button canvas caption cite code col colgroup data datalist dd del details
        dfn dialog div dl dt em embed fieldset figcaption figure footer form h1
        h2 h3 h4 h5 h6 head header hgroup hr html i iframe img input ins kbd
        label legend li link main map mark meta meter nav noscript object ol
        optgroup option output p picture pre progress q rp rt ruby s samp script
        section select slot small source span strong style sub summary sup table
        tbody td template textarea tfoot th thead time title tr track u ul var
        video wbr
      ].freeze

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
        globals = multi_fetch(args, *GLOBALS)

        case code_operator.to_s
        when "escape"
          sig(args) { Object.maybe }
          code_escape(*code_arguments.raw, **globals)
        when "join"
          sig(args) { [Object.maybe, Object.maybe] }
          code_join(*code_arguments.raw, **globals)
        when "text"
          sig(args) { Object.maybe }
          code_text(code_arguments.code_first, **globals)
        when "raw"
          sig(args) { Object.maybe }
          code_raw(code_arguments.code_first, **globals)
        else
          if TAGS.include?(code_operator.to_s.downcase)
            sig(args) { [Dictionary.maybe, Function.maybe] }
            code_tag(code_operator, *code_arguments.raw, **globals)
          else
            super
          end
        end
      end

      def self.code_tag(name, attributes_or_function = {}, function = nil, **globals)
        code_name = name.to_code

        if attributes_or_function.is_a?(Function)
          code_attributes = {}.to_code
          code_function = attributes_or_function.to_code
        else
          code_attributes = attributes_or_function.to_code
          code_function = function.to_code
        end

        fragment = Nokogiri::HTML::DocumentFragment.parse("")
        node = Nokogiri::XML::Node.new(code_name.to_s.downcase, fragment.document)

        code_attributes.raw.each do |code_key, code_value|
          next if code_key.nothing?
          next if code_value.nothing?

          node[code_key.to_s] = code_value.to_s
        end

        if code_function.something?
          code_content = code_function.call(
            arguments: List.new([code_name, code_attributes]),
            **globals
          )

          if code_content.is_an?(Html)
            content = Nokogiri::HTML::DocumentFragment.parse(code_content.to_html)
          else
            content = Nokogiri::XML::Text.new(code_content.to_s, fragment.document)
          end

          node.add_child(content)
        end

        fragment.add_child(node)

        Html.new(fragment)
      end

      def self.code_escape(value_or_function = nil, **globals)
        if value_or_function.is_a?(Function)
          code_value = value_or_function.to_code.call(**globals)
        else
          code_value = value_or_function.to_code
        end

        String.new(CGI.escapeHTML(value.to_s))
      end

      def self.code_join(first = nil, second = nil, **globals)
        if second.is_a?(Function)
          code_contents = second.to_code.call(**globals)
          code_separator = first.to_code
        else
          code_contents = first.to_code
          code_separator = second.to_code
        end

        fragment = Nokogiri::HTML::DocumentFragment.parse("")

        return Html.new(fragment) if code_contents.nothing?
        return Html.new(fragment) unless code_contents.is_a?(List)

        code_contents.raw.each.with_index do |code_content, index|
          if code_content.is_an?(Html)
            content = Nokogiri::HTML::DocumentFragment.parse(code_content.to_html)
          else
            content = Nokogiri::XML::Text.new(code_content.to_s, fragment.document)
          end

          if code_separator.is_an?(Html)
            separator = Nokogiri::HTML::DocumentFragment.parse(code_separator.to_html)
          else
            separator = Nokogiri::XML::Text.new(code_separator.to_s, fragment.document)
          end

          fragment.add_child(separator) unless index.zero?
          fragment.add_child(content)
        end

        Html.new(fragment)
      end

      def self.code_text(value_or_function = nil, **globals)
        if value_or_function.is_a?(Function)
          code_value = value_or_function.to_code.call(**globals)
        else
          code_value = value_or_function.to_code
        end

        fragment = Nokogiri::HTML::DocumentFragment.parse("")
        fragment.add_child(Nokogiri::XML::Text.new(code_value.to_s, fragment.document))

        Html.new(fragment)
      end

      def self.code_raw(value_or_function = nil, **globals)
        if value_or_function.is_a?(Function)
          code_value = value_or_function.to_code.call(**globals)
        else
          code_value = value_or_function.to_code
        end

        if code_value.is_an?(Html)
          Html.new(Nokogiri::HTML::DocumentFragment.parse(code_value.to_html))
        else
          Html.new(Nokogiri::HTML::DocumentFragment.parse(code_value.to_s))
        end
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
        when "to_html"
          sig(args)
          code_to_html
        when "attribute"
          sig(args) { String }
          code_attribute(code_value)
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

      def to_html
        raw.to_html
      end

      def code_to_html
        String.new(raw.to_html)
      end

      def code_to_string
        String.new(raw.text)
      end

      def code_attribute(value = nil)
        code_value = value.to_code
        String.new(raw.attr(code_value.to_s))
      end
    end
  end
end
