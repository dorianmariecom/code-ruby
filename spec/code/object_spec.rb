# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object do
  [
    %w[1.instance_of?(Integer) true],
    %w[1.instance_of?(Decimal) false],
    ["a = [] b = a a.equal?(b)", "true"],
    ["[].equal?([])", "true"],
    ["a = [] b = a a.same_object?(b)", "true"],
    ["[].same_object?([])", "false"],
    ["[].functions.keys.include?(:map)", "true"],
    ["[].instance_functions.keys.include?(:map)", "true"],
    ["[].class_functions.keys.include?(:map)", "false"],
    ["List.functions.keys.include?(:map)", "false"],
    ["List.instance_functions.keys.include?(:map)", "true"],
    ["List.class_functions.keys.include?(:new)", "true"],
    ["[].respond_to?(:respond_to?)", "true"],
    ["[].respond_to?(:map)", "true"],
    ["[].respond_to?(:length)", "true"],
    ["[].respond_to?(:missing)", "false"],
    ["1.respond_to?(:zero?)", "true"],
    ["Object.new.respond_to?(:fetch)", "false"],
    ["a = {} a.b = 1 a.respond_to?(:b)", "true"],
    ["a = {} a.b = 1 a.functions.keys.include?(:b)", "true"],
    ["a = {} a.b = 1 a.instance_functions.keys.include?(:b)", "true"],
    ["a = {} a.b = 1 a.class_functions.keys.include?(:b)", "true"],
    [
      "f = () => { 1 } f.documentation({ description: \"returns one\", examples: [\"f()\"] }) f.documentation.description",
      "\"returns one\""
    ],
    [
      "List.instance_functions.fetch(:map).description.present?",
      "true"
    ],
    [
      "List.instance_functions.fetch(:map).examples.is_a?(List)",
      "true"
    ],
    [
      "List.instance_functions.fetch(:map).description",
      "\"Returns a new list with each item transformed by a function or class.\""
    ],
    [
      "List.instance_functions.fetch(:map).examples.first",
      "\"[1, 2, 3].map(Integer)\""
    ]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end

  describe "ruby documentation api" do
    it "exposes instance functions as documentation dictionaries" do
      function = described_class::List.instance_functions.code_fetch("map")

      expect(function.code_get("name")).to eq(Code::Object::String.new("map"))
      expect(function.code_get("description").present?).to be(true)
      expect(function.code_get("examples")).to be_a(Code::Object::List)
    end

    it "exposes class functions as documentation dictionaries" do
      function = described_class::List.class_functions.code_fetch("new")

      expect(function.code_get("name")).to eq(Code::Object::String.new("new"))
      expect(function.code_get("description").present?).to be(true)
      expect(function.code_get("examples")).to be_a(Code::Object::List)
    end

    it "uses custom descriptions and examples" do
      function = described_class::List.instance_functions.code_fetch("map")

      expect(function.code_get("description").to_s).not_to start_with("Calls ")
      expect(function.code_get("examples").raw).not_to be_empty
    end

    it "does not use ruby reflection to discover documentation" do
      source = File.read("lib/code/object.rb")

      expect(source).not_to include("const_defined?")
      expect(source).not_to include("singleton_class")
    end
  end
end
