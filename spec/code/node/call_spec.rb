# frozen_string_literal: true

require "spec_helper"

RSpec.describe "parser call" do
  ["f(end: 2)"].each do |input|
    it "parses #{input}" do
      Code::Parser.parse(input)
    end
  end
end
