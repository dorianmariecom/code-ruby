# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Function do
=begin
  [
    ["even? = (i) => { i.even? } even?(2)", "true"],
    ["even? = (i:) => { i.even? } even?(i: 2)", "true"],
    ["add = (a, b) => { a + b } add(1, 2)", "3"],
    ["minus = (a:, b:) => { a - b } minus(b: 1, a: 2)", "1"]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
=end

  context "valid" do
    [
      "f = () => {} f",
      "f = (x) => {} f(1)",
#      "f = (x:) => {} f(x: 1)"
    ].each do |input|
      it "#{input} is valid" do
        Code.evaluate(input)
      end
    end
  end

  context "invalid" do
    [
      "f = (x) => {} f",
      "f = (x:) => {} f(1)",
      "f = (x:) => {} f(y: 1)"
    ].each do |input|
      it "#{input} is invalid" do
        expect { Code.evaluate(input) }.to raise_error(Code::Error)
      end
    end
  end
end
