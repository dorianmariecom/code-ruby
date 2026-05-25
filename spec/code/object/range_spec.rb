# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Range do
  [
    %w[(0..1).any?(&:even?) true],
    %w[(0..1).all?(&:even?) false],
    %w[(0..1).none?(&:negative?) true],
    ["a = 0 (0..1).each { a += 1 } a", "2"],
    ["(0..1).select(&:even?)", "[0]"],
    ["(0..3).reject(&:even?)", "[1, 3]"],
    ["(0..1).map(&:increment)", "[1, 2]"],
    ["(1..3).reduce { |sum, value| sum + value }", "6"],
    ["(0..10).step(3)", "[0, 3, 6, 9]"],
    ["(0...9).step(3)", "[0, 3, 6]"],
    ["(3..0).step(-2)", "[3, 1]"],
    ["(0..1).to_list", "[0, 1]"],
    ["(0...1).to_list", "[0]"],
    %w[(0..1).first 0],
    %w[(0..1).last 1],
    %w[(0..1).begin 0],
    %w[(0..1).end 1],
    %w[(0...1).exclude_end? true],
    %w[(1..3).include?(2) true],
    %w[(1..3).member?(2) true],
    %w[(1..3).cover?(4) false],
    %w[(1..3).overlap?(3..5) true],
    %w[(1..3).size 3],
    %w[(1...1).empty? true],
    %w[(1..3).minimum 1],
    %w[(1..3).maximum 3],
    %w[(1..3).minimum_maximum [1,3]],
    %w[(1..3).entries [1,2,3]],
    ["values = [] (1..3).reverse_each { |value| values.push(value) } values", "[3, 2, 1]"],
    ["(1..10).binary_search { |value| value >= 5 }", "5"],
    %w[(1..3).to_dictionary {0=>1,1=>2,2=>3}],
    %w[(1..3).count 3],
    %w[(1..5).count(&:even?) 2]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
