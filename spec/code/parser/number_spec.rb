# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Parser::Number do
  %w[0 1 1.1 123.123 1_000.12_244 0xf0 0o70 0b10].each do |input|
    it "parses #{input}" do
      Code::Parser.parse(input)
    end
  end
end
