# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Parser::Boolean do
  [%w[true !false], %w[false !true]].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
