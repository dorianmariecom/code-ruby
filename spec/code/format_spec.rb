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
        "sections << Html.join(\n  [\n    Html.p { Html.b { \"{index + 1}. {title}\" } },\n    Html.p { query } if query.presence,\n    Html.p {\n      Html.a(href: link || inline_url) { :source }\n    } if (link || inline_url),\n    Html.p {\n      Html.a(href: inline_url) { Html.img(src: inline_url, alt: title) }\n    },\n    Html.p {\n      Html.a(href: attachment_url) { \"télécharger\" }\n    }\n  ].compact\n)"
      ],
      [
        "safe = post.present? and !post[:over_18] and post[:post_hint] == :image and post[:url].to_string.strip.presence and (post[:url].to_string.strip.ends_with?(\".jpg\") or post[:url].to_string.strip.ends_with?(\".jpeg\") or post[:url].to_string.strip.ends_with?(\".png\") or post[:url].to_string.strip.include?(\"i.redd.it\"))",
        "safe = post.present?\n  and !post[:over_18]\n  and post[:post_hint] == :image\n  and post[:url].to_string.strip.presence\n  and (post[:url].to_string.strip.ends_with?(\".jpg\")\n  or post[:url].to_string.strip.ends_with?(\".jpeg\")\n  or post[:url].to_string.strip.ends_with?(\".png\")\n  or post[:url].to_string.strip.include?(\"i.redd.it\"))"
      ],
      [
        "items.each { |item, index| proxied_image_url = if image_url proxy_url(image_url) else nothing end }",
        "items.each { |item, index|\n  proxied_image_url = if image_url\n    proxy_url(image_url)\n  else\n    nothing\n  end\n}"
      ]
    ].each do |input, expected|
      it "formats #{input.inspect}" do
        expect(described_class.format(Code.parse(input))).to eq(expected)
      end
    end

    it "round-trips parse and evaluation semantics for formatted code" do
      input = "user = {name: :Dorian, age: 31} user.age"
      formatted = described_class.format(Code.parse(input))

      expect(Code.parse(formatted)).to be_present
      expect(Code.evaluate(formatted)).to eq(Code.evaluate(input))
    end
  end
end
