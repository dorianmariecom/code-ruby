# frozen_string_literal: true

require "spec_helper"
require "json"

RSpec.describe Code::Format do
  describe ".format" do
    [
      %w[Time.now.second Time.now.second],
      %w[{} {}],
      ["[]", "[]"],
      %w["" ""],
      %w[100000 100_000],
      %w[1000000 1_000_000],
      %w[1.0000000001 1.000_000_000_1],
      ["true || false", "true or false"],
      ["true && false", "true and false"],
      ["{a:1}", "{ a: 1 }"],
      ["[1,2,3]", "[1, 2, 3]"],
      ["[1, 2, 3].select { |n| n.even? }", "[1, 2, 3].select { |n| n.even? }"],
      [
        "if true 1 elsif false 2 else 3 end",
        "if true\n  1\nelsif false\n  2\nelse\n  3\nend"
      ],
      [
        "if false 1 else if true 2 else 3 end",
        "if false\n  1\nelse\n  if true\n    2\n  else\n    3\n  end\nend"
      ],
      [
        "event[:uid].present? and event[:summary].present? and event[:starts_at].present? and event[:ends_at].present?",
        "event[:uid].present?\n  and event[:summary].present?\n  and event[:starts_at].present?\n  and event[:ends_at].present?"
      ],
      [
        "Html.p { \"x{Time.new(event.starts_at).format}y\" + \"{Time.new(event.ends_at).format}\" }",
        "Html.p {\n  \"x{Time.new(event.starts_at).format}y\"\n    + \"{Time.new(event.ends_at).format}\"\n}"
      ],
      [
        "sum = (a, b: 2) => { a + b } sum(1)",
        "sum = (a, b: 2) => {\n  a + b\n}\n\nsum(1)"
      ],
      [
        "Http.post(\"https://api.openai.com/v1/chat/completions\", headers: { authorization: \"Bearer {open_ai_api_key}\", \"content-type\": \"application/json\" }, body: { model: model, messages: [{ role: \"system\", content: \"hello\" }, { role: \"user\", content: \"world\" }] }.to_json)",
        "Http.post(\n  \"https://api.openai.com/v1/chat/completions\",\n  headers: {\n    authorization: \"Bearer {open_ai_api_key}\",\n    \"content-type\": \"application/json\"\n  },\n  body: {\n    model: model,\n    messages: [\n      { role: :system, content: :hello },\n      { role: :user, content: :world }\n    ]\n  }.to_json\n)"
      ],
      [
        "proxy_url = (url) => { \"{proxy_base_url}?{{ url: url, disposition: proxy_inline_disposition }.to_query}\" }",
        "proxy_url = (url) => {\n  \"{proxy_base_url}?\"\n    + \"{{\n    url: url,\n    disposition: proxy_inline_disposition\n  }.to_query}\"\n}"
      ],
      [
        "x = { content: \"you select the funniest tweets for a french \" + \"audience from the provided candidates. pick up to \" + \"{max_selected}. prioritize genuinely funny content\" + \" (jokes, memes, punchlines, absurd). avoid \" + \"politics/news/serious content. output only json.\" }",
        "x = {\n  content: \"you select the funniest tweets for a french \"\n    + \"audience from the provided candidates. pick up to \"\n    + \"{max_selected}. prioritize genuinely funny content\"\n    + \" (jokes, memes, punchlines, absurd). avoid \"\n    + \"politics/news/serious content. output only json.\"\n}"
      ],
      [
        "blocks << { title: \"hello world\", description: \"lorem ipsum dolor es sit\", position: 1 }",
        "blocks << {\n  title: \"hello world\",\n  description: \"lorem ipsum dolor es sit\",\n  position: 1\n}"
      ],
      [
        "sections << Html.join([Html.p { Html.b { \"{index + 1}. {title}\" } }, Html.p { query } if query.presence, Html.p { Html.a(href: link || inline_url) { :source } } if (link || inline_url), Html.p { Html.a(href: inline_url) { Html.img(src: inline_url, alt: title) } }, Html.p { Html.a(href: attachment_url) { \"télécharger\" } }].compact)",
        "sections << Html.join(\n  [\n    Html.p { Html.b { \"{index + 1}. {title}\" } },\n    Html.p { query } if query.presence,\n    Html.p {\n      Html.a(href: link or inline_url) { :source }\n    } if (link or inline_url),\n    Html.p {\n      Html.a(href: inline_url) { Html.img(src: inline_url, alt: title) }\n    },\n    Html.p {\n      Html.a(href: attachment_url) { \"télécharger\" }\n    }\n  ].compact\n)"
      ],
      [
        "safe = post.present? and !post[:over_18] and post[:post_hint] == :image and post[:url].to_string.strip.presence and (post[:url].to_string.strip.ends_with?(\".jpg\") or post[:url].to_string.strip.ends_with?(\".jpeg\") or post[:url].to_string.strip.ends_with?(\".png\") or post[:url].to_string.strip.include?(\"i.redd.it\"))",
        "safe = post.present?\n  and !post[:over_18]\n  and post[:post_hint] == :image\n  and post[:url].to_string.strip.presence\n  and (\n  post[:url].to_string.strip.ends_with?(\".jpg\")\n    or post[:url].to_string.strip.ends_with?(\".jpeg\")\n    or post[:url].to_string.strip.ends_with?(\".png\")\n    or post[:url].to_string.strip.include?(\"i.redd.it\")\n)"
      ],
      [
        "items.each { |item, index| proxied_image_url = if image_url proxy_url(image_url) else nothing end }",
        "items.each { |item, index|\n  proxied_image_url = if image_url\n    proxy_url(image_url)\n  else\n    nothing\n  end\n}"
      ],
      [
        "lines << \"vacances scolaires france {zone} (prochains {months_ahead} mois) :\".downcase",
        "lines << (\n  \"vacances scolaires france {zone} (prochains \"\n    + \"{months_ahead} mois) :\"\n).downcase"
      ],
      [
        "src = \"https://proxy.dorianmarie.com?\" + \"{{ url: src, disposition: :inline }.to_query}\" if src",
        "src = (\n  \"https://proxy.dorianmarie.com?\"\n    + \"{{ url: src, disposition: :inline }.to_query}\"\n) if src"
      ],
      [
        "inline_image = image ? \"https://proxy.dorianmarie.com?\" + \"{inline_params.to_query}\" : nothing",
        "inline_image = image ? (\n  \"https://proxy.dorianmarie.com?\"\n    + \"{inline_params.to_query}\"\n) : nothing"
      ]
    ].each do |input, expected|
      it "formats #{input.inspect}" do
        expect(described_class.format(Code.parse(input))).to eq(expected)
      end

      it "formats #{input.inspect} idempotently" do
        formatted = described_class.format(Code.parse(input))

        expect(described_class.format(Code.parse(formatted))).to eq(formatted)
      end
    end

    it "round-trips parse and evaluation semantics for formatted code" do
      input = "user = {name: :Dorian, age: 31} user.age"
      formatted = described_class.format(Code.parse(input))

      expect(Code.parse(formatted)).to be_present
      expect(Code.evaluate(formatted)).to eq(Code.evaluate(input))
    end

    it "keeps grouped multiline receivers stable" do
      input = <<~CODE.chomp
        lines << (
          "vacances scolaires france {zone} (prochains "
            + "{months_ahead} mois) :"
        ).downcase
      CODE

      expect(described_class.format(Code.parse(input))).to eq(input)
    end

    it "does not split operators inside string interpolations when wrapping" do
      input =
        %q(body_text = "{title}\n\n{description}\n\ningrédients :\n" + ingredients.map { |ingredient| "- {ingredient}" }.join("\n") + "\n\ninstructions :\n" + instructions.map { |instruction, index| "{index + 1}. {instruction}" }.join("\n"))

      formatted = described_class.format(Code.parse(input))

      expect(formatted).to include(
        'instructions.map { |instruction, index| "{index + 1}. {instruction}" }'
      )
      expect(formatted).not_to include(
        "\"{index\n  + 1}. {instruction}\""
      )
    end

    it "does not emit whitespace-only blank lines" do
      input = <<~CODE.chomp
        body = Html.join(elements.map { |element| title = element.at_css(".x") value = element.at_css(".y") title }, Html.br)
      CODE

      formatted = described_class.format(Code.parse(input))

      expect(formatted.lines).not_to include(match(/\A[ \t]+\n\z/))
    end

    it "keeps lines within 80 characters" do
      input = <<~CODE.chomp
        src = "https://proxy.dorianmarie.com?" + "{{ url: src, disposition: :inline }.to_query}" if src
      CODE

      formatted = described_class.format(Code.parse(input))

      expect(formatted.lines.map(&:chomp).map(&:length).max).to be <= 80
    end
  end
end
