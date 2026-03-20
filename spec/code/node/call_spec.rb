# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Parser::Call do
  [
    "f(end: 2)"
  ].each do |input|
    it "parses #{input}" do
      Code::Parser.parse(input)
    end
  end
end
