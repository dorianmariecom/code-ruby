# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Parser do
  [
    "",
    "  ",
    "\n",
    "# comment",
    "dorian = 1 dorian#.to_something",
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

  it "raises instead of hanging when lexing makes no progress" do
    parser = described_class.new('"hello"')

    allow(parser).to receive(:scan_string).and_return({ parts: [], index: 0 })

    expect { parser.send(:lex, '"hello"') }.to raise_error(
      Code::Parser::Error,
      /lexer made no progress/
    )
  end

  it "raises instead of hanging when parsing makes no progress" do
    parser = described_class.new("a\n.b")

    allow(parser).to receive(:skip_newlines)

    expect { parser.parse }.to raise_error(
      Code::Parser::Error,
      /parser made no progress/
    )
  end
end
