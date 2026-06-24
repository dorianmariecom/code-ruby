# frozen_string_literal: true

require "spec_helper"

RSpec.describe "parser string" do
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

  it "interpolates code in single and double quoted strings" do
    expect(Code.evaluate("first_name = :Ada 'Hello {first_name}'")).to eq(
      Code.evaluate('"Hello Ada"')
    )
    expect(Code.evaluate('first_name = :Ada "Hello {first_name}"')).to eq(
      Code.evaluate('"Hello Ada"')
    )
    expect(
      Code.evaluate(
        'first_name = :Ada last_name = :Lovelace "{[first_name, last_name].compact(&:blank?).join(" ")}"'
      )
    ).to eq(Code.evaluate('"Ada Lovelace"'))
  end

  it "allows dictionary expressions inside interpolation" do
    expect(Code.evaluate('"{{ a: 1 }.to_query}"')).to eq(Code.evaluate('"a=1"'))
  end

  it "keeps escaped interpolation braces as literal text" do
    expect(Code.evaluate('x = 1 "\\{x = 2}" x')).to eq(Code.evaluate("1"))
    expect(Code.evaluate('"\\{context.clear}"').to_s).to eq("{context.clear}")
  end
end
