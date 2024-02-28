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
end
