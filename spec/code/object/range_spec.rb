# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Range do
  [
    %w[(0..1).any?(&:even?) true],
    %w[(0..1).all?(&:even?) false],
    ["a = 0 (0..1).each { a += 1 } a", "2"],
    ["(0..1).select(&:even?)", "[0]"],
    ["(0..1).map(&:increment)", "[1, 2]"],
    ["(0..10).step(3)", "[0, 3, 6, 9]"],
    ["(0...9).step(3)", "[0, 3, 6]"],
    ["(0..1).to_list", "[0, 1]"],
    ["(0...1).to_list", "[0]"],
    %w[(0..1).first 0],
    %w[(0..1).last 1]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
