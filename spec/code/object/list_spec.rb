# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::List do
  [
    ["[] == []", "true"],
    ["[nothing, 1, false, \"\"].compact", '[1, false, ""]'],
    ["[nothing, 1, false, \"\"].compact(&:blank?)", "[1]"],
    ["[1, 2, 3].sum", "6"],
    ["[1, 2] + [3, 4]", "[1, 2, 3, 4]"],
    ["[] + []", "[]"],
    ["[1, 2, 3].second", "2"],
    ["[1, 2, 3].third", "3"],
    %w[(1..100).to_list.one_hundredth 100],
    ["[1, 2, 3].one_hundredth", "nothing"],
    ["[1, 2].at(0)", "1"],
    ["[1, 2].get(1)", "2"],
    ["[1, 2][10]", "nothing"],
    ["[1, 2, 3].index { |value, index| value + index == 5 }", "2"],
    ["[1, 2, 3].find_index(2)", "1"],
    ["[1, 2, 3].index(4)", "nothing"],
    ["[].empty?", "true"],
    ["xs = [1, 2] xs.clear xs", "[]"],
    ["xs = [1] xs.push(2)", "[1, 2]"],
    ["xs = [2] xs.prepend(1)", "[1, 2]"],
    ["xs = [1, 3] xs.insert(1, 2)", "[1, 2, 3]"],
    ["xs = [1, 2, 1] xs.delete(1)", "1"],
    ["xs = [1, 2] xs.delete_at(0)", "1"],
    ["[1, 2, 3].take(2)", "[1, 2]"],
    ["[1, 2, 3].drop(1)", "[2, 3]"],
    ["[1, 2].zip([3, 4])", "[[1, 3], [2, 4]]"],
    ["[1, 2, 3].group(&:odd?)", "{ true => [1, 3], false => [2] }"],
    ["[1, 2, 3].partition(&:odd?)", "[[1, 3], [2]]"],
    ["[1, 2].cycle(2)", "[1, 2, 1, 2]"],
    ["[[1, 2], [3, 4]].transpose", "[[1, 3], [2, 4]]"],
    ["[1, 2, 3].combination(2)", "[[1, 2], [1, 3], [2, 3]]"],
    ["[1, 2].permutation", "[[1, 2], [2, 1]]"],
    ["[3, 1, 2].minimum", "1"],
    ['["aaa", "b"].minimum(&:size)', '"b"'],
    ["[3, 1, 2].maximum", "3"],
    ['["aaa", "b"].maximum(&:size)', '"aaa"'],
    ["[1, 2, 3].count", "3"],
    ['[1, "a", 2].count(Integer)', "2"],
    ["[1, 2, 3].count(&:odd?)", "2"],
    ['["a", "b", "a"].tally', "{ a: 2, b: 1 }"],
    ["xs = [1, 2] xs.reverse! xs", "[2, 1]"],
    ["xs = [2, 1] xs.sort! xs", "[1, 2]"],
    ['xs = ["aaa", "b"] xs.sort!(&:size) xs', '["b", "aaa"]'],
    ["xs = [1, 1, 2] xs.uniq! xs", "[1, 2]"],
    ["xs = [1, 3, 2] xs.uniq! { |n| n.odd? } xs", "[1, 2]"]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
