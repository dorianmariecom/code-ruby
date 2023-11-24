# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Nothing do
  [
    %w[nothing nothing],
    ["nothing nothing", "nothing"]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
