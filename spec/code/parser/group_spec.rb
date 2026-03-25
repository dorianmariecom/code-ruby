# frozen_string_literal: true

require "spec_helper"

RSpec.describe "parser group" do
  ["(true (nothing))"].each do |input|
    it "parses #{input}" do
      Code::Parser.parse(input)
    end
  end
end
