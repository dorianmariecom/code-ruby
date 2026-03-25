# frozen_string_literal: true

require "spec_helper"

RSpec.describe "parser chained call" do
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
