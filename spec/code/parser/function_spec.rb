# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Parser::Function do
  [
    "() => {}",
    "(a, b) => { add(a, b) }",
    "(a:, b:) => { add(a, b) }"
  ].each do |input|
    it "parses #{input}" do
      Code::Parser.parse(input)
    end
  end
end
