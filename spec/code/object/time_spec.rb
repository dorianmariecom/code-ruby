# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Time do
  [
    ['Time.new(1).format("%s")', ":1"],
    ['Time.new(1100042342).format("%s")', ":1100042342"],
    ['Time.new(1.2).format("%s.%L")', '"1.200"'],
    ['Time.new(11212.1212).format("%s.%L")', '"11212.121"']
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
