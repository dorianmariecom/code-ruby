# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Parser::String do
  [
    "''",
    '""',
    "'Hello Dorian'",
    '"Hello Dorian"',
    "'Hello \\{name}'",
    '"Hello \\{name}"',
    "'Hello {name}'",
    '"Hello {name}"'
  ].each do |input|
    it "parses #{input}" do
      Code::Parser.parse(input)
    end
  end
end
