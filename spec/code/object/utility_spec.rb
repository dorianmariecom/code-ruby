# frozen_string_literal: true

require "spec_helper"

RSpec.describe "utility objects" do
  [
    ["Json.generate({ a: 1 })", %q('\{"a":1}')],
    ["Json.generate({ a: 1 }, { pretty: true })", %q('\{\n  "a": 1\n}')],
    ['Url.decode("a+b%20c")', '"a b c"'],
    %w[Url.parse("https://example.com/a").to_string "https://example.com/a"],
    %w[Url.new("https://example.com/a").to_string "https://example.com/a"],
    ['Base64.encode_64("hi")', "\"aGk=\\n\""],
    %w[Base64.decode_64("aGk=") "hi"],
    %w[Base64.strict_encode_64("hi") "aGk="],
    %w[Base64.strict_decode_64("aGk=") "hi"],
    %w[Base64.url_safe_encode_64("hi") "aGk="],
    %w[Base64.url_safe_decode_64("aGk=") "hi"],
    ['Html.raw("<a href=\\"/x\\">Hi</a>").at_css("a").inner_text', '"Hi"'],
    ['Html.raw("<a href=\\"/x\\">Hi</a>").at_css("a").attributes.href', '"/x"'],
    %w[Http.get("https://httpbin.org/status/200").success? true],
    %w[Http.get("https://httpbin.org/status/200").method "get"],
    %w[Http.get("https://httpbin.org/status/200").response.code 200]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
