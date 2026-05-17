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

  [
    ['"".empty?', "true"],
    ['"hello".last', '"o"'],
    ['"hello".last(2)', '"lo"'],
    ['"hi\n".chomp', '"hi"'],
    ['"hello".chop', '"hell"'],
    ['"hello".capitalize', '"Hello"'],
    ['"hello world".titleize', '"Hello World"'],
    ['"Hello".swapcase', '"hELLO"'],
    ['" a   b ".squish', '"a b"'],
    ['"hello".delete("l")', '"heo"'],
    ['"hello".delete_prefix("he")', '"llo"'],
    ['"hello".delete_suffix("lo")', '"hel"'],
    ['"one one".substitute_once("one", "two")', '"two one"'],
    ['"one one".substitute("one", "two")', '"two two"'],
    ['"one one".substitute_all("one", "two")', '"two two"'],
    ['"hello".index("l")', "2"],
    ['"hello".right_index("l")', "3"],
    ['"hello".index("z")', "nothing"],
    ['"hi".characters', '["h", "i"]'],
    ["\"a\\nb\".lines", '["a\n", "b"]'],
    ['"a b  c".words', '["a", "b", "c"]'],
    ['"hello".at(1)', '"e"'],
    ['"hello"[10]', "nothing"]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end

  describe "#code_strip" do
    it "replaces invalid utf-8 bytes instead of raising" do
      string = described_class.new("\xC3 ".b.force_encoding(Encoding::UTF_8))

      expect(string.code_strip.to_s).to eq("\uFFFD")
    end
  end
end
