# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Parser::Dictionary do
  [
    "{}",
    "{ }",
    "{/* comment */}",
    "{ a: 1, b: 2, c: 3 }",
    '{ "first_name": "Dorian" }',
    "{ end: 2 }"
  ].each do |input|
    it "parses #{input}" do
      Code::Parser.parse(input)
    end
  end
end
