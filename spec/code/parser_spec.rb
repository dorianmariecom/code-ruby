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
      described_class.parse(input)
    end
  end

  Dir["spec/fixtures/code/parser/**/*.code"].each do |filename|
    it "parses #{filename}" do
      described_class.parse(File.read(filename))
    end
  end
end
