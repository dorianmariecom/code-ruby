# frozen_string_literal: true

class Code
  class Object
    class Html < Object
      CLASS_DOCUMENTATION = {
        name: "Html",
        description: "builds, escapes, parses, and queries html fragments.",
        examples: [
          "Html.p { :hello }",
          "Html.escape(\"<p>a</p>\")",
          "Html.raw(\"<p>a</p>\").css(\"p\")"
        ]
      }.freeze
      CLASS_FUNCTIONS = {
        "escape" => {
          name: "escape",
          description: "escapes a value for html text.",
          examples: [
            "Html.escape(\"<p>\")",
            "Html.escape(:hello)",
            "Html.escape(() => { \"<strong>hello</strong>\" })"
          ]
        },
        "unescape" => {
          name: "unescape",
          description: "converts html entities and tags to text.",
          examples: [
            "Html.unescape(\"&lt;p&gt;\")",
            "Html.unescape(\"<p>hello</p>\")",
            "Html.unescape(() => { \"&amp;\" })"
          ]
        },
        "join" => {
          name: "join",
          description: "joins html or text values with an optional separator.",
          examples: [
            "Html.join([:a, :b], \", \")",
            "Html.join([Html.text(\"a\"), Html.text(\"b\")])",
            "Html.join(\"<br>\", () => { [\"a\", \"b\"] })"
          ]
        },
        "text" => {
          name: "text",
          description: "builds an escaped html text fragment.",
          examples: [
            "Html.text(:hello)",
            "Html.text(\"<strong>hello</strong>\")",
            "Html.text(() => { :hello })"
          ]
        },
        "raw" => {
          name: "raw",
          description:
            "parses markup into an html fragment without escaping text.",
          examples: [
            "Html.raw(\"<strong>hello</strong>\")",
            "Html.raw(Html.text(:hello))",
            "Html.raw(() => { \"<em>hello</em>\" })"
          ]
        }
      }.freeze
      INSTANCE_FUNCTIONS = {
        "css" => {
          name: "css",
          description: "returns all html nodes matching a css selector.",
          examples: [
            "Html.raw(\"<p>a</p><p>b</p>\").css(\"p\")",
            "Html.raw(\"<main><p>a</p></main>\").css(\"main p\")",
            "Html.raw(\"<p class='x'>a</p>\").css(\".x\")"
          ]
        },
        "at_css" => {
          name: "at_css",
          description: "returns the first html node matching a css selector.",
          examples: [
            "Html.raw(\"<p>a</p><p>b</p>\").at_css(\"p\")",
            "Html.raw(\"<main><p>a</p></main>\").at_css(\"main p\")",
            "Html.raw(\"<p class='x'>a</p>\").at_css(\".x\")"
          ]
        },
        "map" => {
          name: "map",
          description:
            "returns a list by calling a function for each html node.",
          examples: [
            "Html.raw(\"<p>a</p><p>b</p>\").css(\"p\").map((node) => { node.to_string })",
            "Html.raw(\"<p>a</p>\").css(:p).map((node, index) => { index })",
            "Html.raw(\"<p>a</p>\").css(:p).map((node, index, nodes) => { nodes.to_string })"
          ]
        },
        "to_string" => {
          name: "to_string",
          description: "returns the html fragment's text content.",
          examples: [
            "Html.raw(\"<p>hello</p>\").to_string",
            "Html.text(:hello).to_string",
            "Html.raw(\"<p><strong>hello</strong></p>\").to_string"
          ]
        },
        "to_html" => {
          name: "to_html",
          description: "returns the html fragment as html markup.",
          examples: [
            "Html.raw(\"<p>hello</p>\").to_html",
            "Html.text(:p).to_html",
            "Html.raw(\"<strong>hello</strong>\").to_html"
          ]
        },
        "inner_text" => {
          name: "inner_text",
          description: "returns the html fragment's text content.",
          examples: [
            "Html.raw(\"<p>hello</p>\").inner_text",
            "Html.text(:hello).inner_text",
            "Html.raw(\"<p><strong>hello</strong></p>\").inner_text"
          ]
        },
        "attribute" => {
          name: "attribute",
          description: "returns an html node attribute by name.",
          examples: [
            "Html.raw(\"<a href='/'>home</a>\").at_css(:a).attribute(:href)",
            "Html.raw(\"<p class='x'>a</p>\").at_css(:p).attribute(:class)",
            "Html.raw(\"<img alt='logo'>\").at_css(:img).attribute(:alt)"
          ]
        },
        "attributes" => {
          name: "attributes",
          description: "returns an html node's attributes as a dictionary.",
          examples: [
            "Html.raw(\"<a href='/'>home</a>\").at_css(:a).attributes",
            "Html.raw(\"<p class='x'>a</p>\").at_css(:p).attributes",
            "Html.raw(\"<img alt='logo'>\").at_css(:img).attributes"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance
        return CLASS_FUNCTIONS if scope == :class

        {}
      end

      TAGS = %w[
        a
        abbr
        address
        area
        article
        aside
        audio
        b
        base
        bdi
        bdo
        blockquote
        body
        br
        button
        canvas
        caption
        cite
        code
        col
        colgroup
        data
        datalist
        dd
        del
        details
        dfn
        dialog
        div
        dl
        dt
        em
        embed
        fieldset
        figcaption
        figure
        footer
        form
        h1
        h2
        h3
        h4
        h5
        h6
        head
        header
        hgroup
        hr
        html
        i
        iframe
        img
        input
        ins
        kbd
        label
        legend
        li
        link
        main
        map
        mark
        meta
        meter
        nav
        noscript
        object
        ol
        optgroup
        option
        output
        p
        picture
        pre
        progress
        q
        rp
        rt
        ruby
        s
        samp
        script
        section
        select
        slot
        small
        source
        span
        strong
        style
        sub
        summary
        sup
        table
        tbody
        td
        template
        textarea
        tfoot
        th
        thead
        time
        title
        tr
        track
        u
        ul
        var
        video
        wbr
      ].freeze

      def initialize(*args, **_kargs, &_block)
        self.raw =
          if args.first.is_an?(Html)
            args.first.raw
          elsif args.first.is_a?(::Nokogiri::XML::NodeSet) ||
                args.first.is_a?(Nokogiri::XML::Node)
            args.first
          else
            source = args.first.to_s
            Nokogiri.HTML(source)
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
        when "unescape"
          sig(args) { Object.maybe }
          code_unescape(*code_arguments.raw, **globals)
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

      def self.code_tag(
        name,
        attributes_or_function = {},
        function = nil,
        **globals
      )
        code_name = name.to_code

        if attributes_or_function.is_a?(Function)
          code_attributes = {}.to_code
          code_function = attributes_or_function.to_code
        else
          code_attributes = attributes_or_function.to_code
          code_function = function.to_code
        end

        fragment = Nokogiri::HTML::DocumentFragment.parse("")
        node =
          Nokogiri::XML::Node.new(code_name.to_s.downcase, fragment.document)

        code_attributes.raw.each do |code_key, code_value|
          next if code_key.nothing?
          next if code_value.nothing?

          node[code_key.to_s] = code_value.to_s
        end

        if code_function.something?
          code_content =
            begin
              code_function.call(
                arguments: List.new([code_name, code_attributes]),
                **globals
              )
            rescue Error::Next => e
              e.code_value
            end

          content =
            if code_content.is_an?(Html)
              fragment_from_html(code_content)
            else
              Nokogiri::XML::Text.new(code_content.to_s, fragment.document)
            end

          node.add_child(content)
        end

        fragment.add_child(node)

        Html.new(fragment)
      rescue Error::Break => e
        e.code_value
      end

      def self.code_escape(value_or_function = nil, **globals)
        code_value =
          if value_or_function.is_a?(Function)
            begin
              value_or_function.to_code.call(**globals)
            rescue Error::Next => e
              e.code_value
            end
          else
            value_or_function.to_code
          end

        String.new(CGI.escapeHTML(code_value.to_s))
      rescue Error::Break => e
        e.code_value
      end

      def self.code_unescape(value_or_function = nil, **globals)
        code_value =
          if value_or_function.is_a?(Function)
            begin
              value_or_function.to_code.call(**globals)
            rescue Error::Next => e
              e.code_value
            end
          else
            value_or_function.to_code
          end

        String.new(Nokogiri::HTML.fragment(code_value.to_s).text)
      rescue Error::Break => e
        e.code_value
      end

      def self.code_join(first = nil, second = nil, **globals)
        if second.is_a?(Function)
          code_contents =
            begin
              second.to_code.call(**globals)
            rescue Error::Next => e
              e.code_value
            end
          code_separator = first.to_code
        else
          code_contents = first.to_code
          code_separator = second.to_code
        end

        fragment = Nokogiri::HTML::DocumentFragment.parse("")

        return Html.new(fragment) if code_contents.nothing?
        return Html.new(fragment) unless code_contents.is_a?(List)

        code_contents.raw.each.with_index do |code_content, index|
          content =
            if code_content.is_an?(Html)
              fragment_from_html(code_content)
            else
              Nokogiri::XML::Text.new(code_content.to_s, fragment.document)
            end

          separator =
            if code_separator.is_an?(Html)
              fragment_from_html(code_separator)
            else
              Nokogiri::XML::Text.new(code_separator.to_s, fragment.document)
            end

          fragment.add_child(separator) unless index.zero?
          fragment.add_child(content)
        end

        Html.new(fragment)
      rescue Error::Break => e
        e.code_value
      end

      def self.code_text(value_or_function = nil, **globals)
        code_value =
          if value_or_function.is_a?(Function)
            begin
              value_or_function.to_code.call(**globals)
            rescue Error::Next => e
              e.code_value
            end
          else
            value_or_function.to_code
          end

        fragment = Nokogiri::HTML::DocumentFragment.parse("")
        fragment.add_child(
          Nokogiri::XML::Text.new(code_value.to_s, fragment.document)
        )

        Html.new(fragment)
      rescue Error::Break => e
        e.code_value
      end

      def self.code_raw(value_or_function = nil, **globals)
        code_value =
          if value_or_function.is_a?(Function)
            begin
              value_or_function.to_code.call(**globals)
            rescue Error::Next => e
              e.code_value
            end
          else
            value_or_function.to_code
          end

        if code_value.is_an?(Html)
          Html.new(fragment_from_html(code_value))
        else
          Html.new(Nokogiri::HTML::DocumentFragment.parse(code_value.to_s))
        end
      rescue Error::Break => e
        e.code_value
      end

      def self.fragment_from_html(html)
        Nokogiri::HTML::DocumentFragment.parse(html.to_html)
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
        when "inner_text"
          sig(args)
          code_inner_text
        when "attribute"
          sig(args) { String }
          code_attribute(code_value)
        when "attributes"
          sig(args)
          code_attributes
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
      rescue Error::Break => e
        e.code_value
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

      def code_inner_text
        code_to_string
      end

      def code_attribute(value = nil)
        code_value = value.to_code
        String.new(raw.attr(code_value.to_s))
      end

      def code_attributes
        node = raw.is_a?(::Nokogiri::XML::NodeSet) ? raw.first : raw
        return Dictionary.new if node.blank?

        Dictionary.new(
          node.attribute_nodes.to_h do |attribute|
            [attribute.name.to_code, attribute.value.to_code]
          end
        )
      end
    end
  end
end
