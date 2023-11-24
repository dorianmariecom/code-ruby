# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Parser do
  [
    "",
    "  ",
    "\n",
    "# comment",
    "/* comment",
    "/* comment */",
    "// comment",
    "/* first comment */ # second comment",
    "nothing",
    "  nothing  ",
    "nothing nothing nothing"
  ].each do |input, _output|
    it input.inspect do
      Code::Parser.parse(input)
    end
  end

  Dir["spec/fixtures/code/parser/**/*.code"].each do |filename|
    it "parses #{filename}" do
      Code::Parser.parse(File.read(filename))
    end
  end
end
