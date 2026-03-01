# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::List do
  [
    ["[] == []", "true"],
    ["[1, 2, 3].sum", "6"],
    ["[1, 2] + [3, 4]", "[1, 2, 3, 4]"],
    ["[] + []", "[]"],
    ["[1, 2, 3].second", "2"],
    ["[1, 2, 3].third", "3"],
    ["(1..100).to_list.one_hundredth", "100"],
    ["[1, 2, 3].one_hundredth", "nothing"]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
