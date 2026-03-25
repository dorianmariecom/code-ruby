# frozen_string_literal: true

require "spec_helper"

RSpec.describe "parser function" do
  [
    "() => {}",
    "(a, b) => { add(a, b) }",
    "(a:, b:) => { add(a, b) }",
    "(end:) => { nothing }"
  ].each do |input|
    it "parses #{input}" do
      Code::Parser.parse(input)
    end
  end
end
