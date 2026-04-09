# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::String do
  [
    %w[:a a],
    %w[:a_b_c_0123 a_b_c_0123],
    %w[:Hello Hello],
    %w[:Hello Hello],
    ['"Hello\nWorld"', "Hello\nWorld"],
    ["'Hello\\nWorld'", "Hello\nWorld"]
  ].each do |input, expected|
    it "(#{input}).to_s == #{expected.inspect}" do
      expect(Code.evaluate(input).to_s).to eq(expected)
    end
  end

  describe "#code_strip" do
    it "replaces invalid utf-8 bytes instead of raising" do
      string = described_class.new("\xC3 ".b.force_encoding(Encoding::UTF_8))

      expect(string.code_strip.to_s).to eq("\uFFFD")
    end
  end
end
