# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::List do
  [
    ["[] == []", "true"],
    ["[1, 2, 3].sum", "6"],
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
