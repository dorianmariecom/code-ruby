# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Regex do
  [
    ['Regex.new("a|b|c").match?("b")', "true"],
    ['Regex.new("^hello").match?("say hello")', "false"],
    ['Regex.new("^hello", ignore_case: true).match?("Hello world")', "true"],
    ['Regex.new("a.b", multiple_lines: true).match?("a\nb")', "true"],
    ['Regex.new("a # comment", extended: true).match?("a")', "true"],
    ['Regex.new("hello").source', '"hello"'],
    ['Regex.new("hello", ignore_case: true).ignore_case?', "true"],
    ['Regex.new("hello", ignore_case: false).ignore_case?', "false"],
    [
      'options = { ignore_case: true } Regex.new("hello", **options).ignore_case?',
      "true"
    ],
    [
      'Regex.new("hello", multiple_lines: true, ignore_case: true).options.ignore_case',
      "true"
    ],
    ['"hello".match?(Regex.new("ell"))', "true"],
    ['"hello".matches?(Regex.new("world"))', "false"],
    ['"a1 b22".scan(Regex.new("[0-9]+"))', '["1", "22"]'],
    ['"a1 b22".scan(Regex.new("([a-z])([0-9]+)"))', '[["a", "1"], ["b", "22"]]'],
    ['"hello".index(Regex.new("l+"))', "2"],
    ['"hello".right_index(Regex.new("l"))', "3"],
    ['"a,b;c".split(Regex.new("[,;]"))', '["a", "b", "c"]'],
    ['"abc123".substitute(Regex.new("[0-9]"), "#")', '"abc###"'],
    ['"abc123".substitute_once(Regex.new("[0-9]"), "#")', '"abc#23"'],
    [
      'text = "abc123" text.substitute!(Regex.new("[0-9]"), "#") text',
      '"abc###"'
    ],
    [
      'text = "abc123" text.substitute_once!(Regex.new("[0-9]"), "#") text',
      '"abc#23"'
    ],
    ['["ant", "bat", "cat"].grep(Regex.new("^b"))', '["bat"]'],
    ['["ant", "bat", "cat"].grep(Regex.new("a"))', '["ant", "bat", "cat"]'],
    ['["ant", "bat", "cat"].grep_not(Regex.new("^b"))', '["ant", "cat"]'],
    [
      '["ant", "bat"].grep(Regex.new("a"), &:upcase)',
      '["ANT", "BAT"]'
    ],
    %w[Regex.class_functions.keys.include?(:new) true],
    %w[classes.keys.include?(:Regex) true],
    %w[globals.keys.include?(:Regex) true]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end

  it "wraps ruby regexps with the Regex object" do
    expect(/hello/i.to_code).to eq(described_class.new("hello", ignore_case: true))
  end

  it "raises code errors for invalid patterns" do
    expect { Code.evaluate('Regex.new("[")') }.to raise_error(
      Code::Error,
      /invalid regex/
    )
  end

  it "raises code errors for unknown options" do
    expect { Code.evaluate('Regex.new("hello", unknown: true)') }.to raise_error(
      Code::Error,
      /unknown regex option: unknown/
    )
  end
end
