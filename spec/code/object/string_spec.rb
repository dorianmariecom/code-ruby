require "spec_helper"

RSpec.describe Code::Object::String do
  [
    [":a", "a"],
    [":a_b_c_0123", "a_b_c_0123"],
    ['"Hello"', "Hello"],
    ["'Hello'", "Hello"],
    ['"Hello\nWorld"', "Hello\nWorld"],
    ["'Hello\\nWorld'", "Hello\nWorld"],
  ].each do |input, expected|
    it "(#{input}).to_s == #{expected.inspect}" do
      expect(Code.evaluate(input).to_s).to eq(expected)
    end
  end
end
