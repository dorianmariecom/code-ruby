# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Parser::IfModifier do
  [
    ["1 if true", "1"],
    ["1 if false", "nothing"],
    ["1 unless true", "nothing"],
    ["1 unless false", "1"],
    ["a = 0 (a += 1) while a < 10 a", "10"],
    ["a = 0 (a += 1) until a > 10 a", "11"]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
