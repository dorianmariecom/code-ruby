# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Parser::ChainedCall do
  [
    "a.b",
    "user.first_name",
    "user.admin?",
    'user.update!(name: "Dorian")'
  ].each do |input|
    it "parses #{input}" do
      Code::Parser.parse(input)
    end
  end
end
