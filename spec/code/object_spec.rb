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
      "\"returns a new list with each item transformed by a function or class.\""
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

    it "keeps concrete class documentation on the concrete class" do
      source = File.read("lib/code/object.rb")

      expect(source).not_to include("Code::Object::List")
      expect(source).not_to include("Code::Object::Base64")
      expect(source).not_to include("FUNCTION_DOCUMENTATION")
    end

    it "documents every shared function" do
      documented_names =
        described_class.instance_functions.raw.keys.map(&:to_s) +
        described_class.class_functions.raw.keys.map(&:to_s)

      Code::Concerns::Shared::SHARED_OPERATORS.each do |function_name|
        expect(documented_names).to include(function_name)
      end
    end

    it "provides at least three examples for documented built-in functions" do
      documented_functions =
        described_class.instance_functions.raw.values +
        described_class.class_functions.raw.values +
        described_class::Base64.class_functions.raw.values +
        described_class::Boolean.instance_functions.raw.values +
        described_class::Class.instance_functions.raw.values +
        described_class::Code.instance_functions.raw.values +
        described_class::Code.class_functions.raw.values +
        described_class::Context.instance_functions.raw.values +
        described_class::Cryptography.class_functions.raw.values +
        described_class::Dictionary.instance_functions.raw.values +
        described_class::Dictionary.class_functions.raw.values +
        described_class::Duration.instance_functions.raw.values +
        described_class::Function.instance_functions.raw.values +
        described_class::Json.class_functions.raw.values +
        described_class::List.instance_functions.raw.values +
        described_class::Nothing.instance_functions.raw.values +
        described_class::Number.instance_functions.raw.values +
        described_class::Parameter.instance_functions.raw.values +
        described_class::Url.class_functions.raw.values

      documented_functions.each do |function|
        expect(function.code_fetch("examples").raw.size).to be >= 3
      end
    end

    it "uses lowercase descriptions for documented built-in functions" do
      documented_functions =
        described_class.instance_functions.raw.values +
        described_class.class_functions.raw.values +
        described_class::Base64.class_functions.raw.values +
        described_class::Boolean.instance_functions.raw.values +
        described_class::Class.instance_functions.raw.values +
        described_class::Code.instance_functions.raw.values +
        described_class::Code.class_functions.raw.values +
        described_class::Context.instance_functions.raw.values +
        described_class::Cryptography.class_functions.raw.values +
        described_class::Dictionary.instance_functions.raw.values +
        described_class::Dictionary.class_functions.raw.values +
        described_class::Duration.instance_functions.raw.values +
        described_class::Function.instance_functions.raw.values +
        described_class::Json.class_functions.raw.values +
        described_class::List.instance_functions.raw.values +
        described_class::Nothing.instance_functions.raw.values +
        described_class::Number.instance_functions.raw.values +
        described_class::Parameter.instance_functions.raw.values +
        described_class::Url.class_functions.raw.values

      documented_functions.each do |function|
        description = function.code_fetch("description").to_s

        expect(description).to match(/\A[[:lower:]]/)
      end
    end
  end
end
