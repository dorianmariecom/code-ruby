# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Parser::List do
  [
    "[]",
    "[ ]",
    "[/* comment */]",
    "[1, 2, 3]",
    "['hello', 1, true, [false, nothing]]"
  ].each do |input|
    it "parses #{input}" do
      Code::Parser.parse(input)
    end
  end
end
