# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Boolean do
  [
    ["true & false", "false"],
    %w[true.bitwise_and(false) false],
    ["true | false", "true"],
    %w[true.bitwise_or(false) true],
    ["true ^ false", "true"],
    %w[true.bitwise_xor(false) true]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
