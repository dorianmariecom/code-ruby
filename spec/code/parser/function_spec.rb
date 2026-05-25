# frozen_string_literal: true

require "spec_helper"

RSpec.describe "parser function" do
  [
    "() => {}",
    "(a, b) => { add(a, b) }",
    "(a:, b:) => { add(a, b) }",
    "(end:) => { nothing }",
    "(...) => { rest }",
    "(...rest) => { rest }",
    "(*) => { arguments }",
    "(*arguments) => { arguments }",
    "(**) => { keyword_arguments }",
    "(**keyword_arguments) => { keyword_arguments }",
    "(&) => { block }",
    "(&block) => { block }",
    "(&&) => { blocks }",
    "(&&blocks) => { blocks }"
  ].each do |input|
    it "parses #{input}" do
      Code::Parser.parse(input)
    end
  end
end
