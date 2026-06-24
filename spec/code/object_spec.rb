# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object do
  let(:builtin_documentation_classes) do
    [
      described_class,
      described_class::Base64,
      described_class::Boolean,
      described_class::Class,
      described_class::Code,
      described_class::Context,
      described_class::Cryptography,
      described_class::Date,
      described_class::Decimal,
      described_class::Dictionary,
      described_class::Duration,
      described_class::Function,
      described_class::Html,
      described_class::Http,
      described_class::Ics,
      described_class::Integer,
      described_class::Json,
      described_class::List,
      described_class::Nothing,
      described_class::Number,
      described_class::Parameter,
      described_class::Regex,
      described_class::Range,
      described_class::Smtp,
      described_class::String,
      described_class::Time,
      described_class::Url
    ]
  end
  let(:documented_functions) do
    builtin_documentation_classes.flat_map do |klass|
      klass.instance_functions.raw.values + klass.class_functions.raw.values
    end + described_class::Global.functions.raw.values
  end
  let(:documented_classes) do
    builtin_documentation_classes.map(&:documentation)
  end

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
    ["[].functions.keys == [].functions.keys.sort", "true"],
    ["[].instance_functions.keys == [].instance_functions.keys.sort", "true"],
    ["[].class_functions.keys == [].class_functions.keys.sort", "true"],
    %w[List.functions.keys.include?(:map) false],
    %w[List.instance_functions.keys.include?(:map) true],
    %w[List.class_functions.keys.include?(:new) true],
    ["List.functions.keys == List.functions.keys.sort", "true"],
    [
      "List.instance_functions.keys == List.instance_functions.keys.sort",
      "true"
    ],
    ["List.class_functions.keys == List.class_functions.keys.sort", "true"],
    %w[globals.keys.include?(:List) true],
    %w[classes.keys.include?(:List) true],
    [
      "globals.fetch(:puts).description",
      "\"writes values to output with newlines and returns nothing.\""
    ],
    [
      "classes.fetch(:List).description",
      "\"stores ordered values and provides enumerable operations.\""
    ],
    ["List.documentation.name", "\"List\""],
    %w[List.documentation.examples.is_a?(List) true],
    ["[].documentation.name", "\"List\""],
    ["1.documentation.name", "\"Integer\""],
    %w[List.instance_functions.keys.include?(:doc) false],
    %w[1.respond_to?(:doc) false],
    ["getting_started.title", "\"Getting started with Code\""],
    ["getting_started.steps.first.command", "\"bundle install\""],
    ["getting_started.examples.first.source", "\"1 + 2\""],
    ["[].respond_to?(:respond_to?)", "true"],
    ["[].respond_to?(:map)", "true"],
    ["[].respond_to?(:length)", "true"],
    ["[1, 2].length", "2"],
    ["[1, 2].member?(1)", "true"],
    ["[1, 2, 3].filter((x) => { x > 1 })", "[2, 3]"],
    ["\"abc\".length", "3"],
    ["\"abc\".member?(\"b\")", "true"],
    ["[].respond_to?(:missing)", "false"],
    %w[1.respond_to?(:zero?) true],
    %w[Object.new.respond_to?(:fetch) false],
    ["a = {} a.b = 1 a.respond_to?(:b)", "true"],
    ["a = {} a.b = 1 a.functions.keys.include?(:b)", "true"],
    ["a = {} a.b = 1 a.instance_functions.keys.include?(:b)", "true"],
    ["a = {} a.b = 1 a.class_functions.keys.include?(:b)", "true"],
    [
      "a = {} a.z = 1 a.a = 1 a.functions.keys == a.functions.keys.sort",
      "true"
    ],
    [
      "a = {} a.z = 1 a.a = 1 a.instance_functions.keys == a.instance_functions.keys.sort",
      "true"
    ],
    [
      "a = {} a.z = 1 a.a = 1 a.class_functions.keys == a.class_functions.keys.sort",
      "true"
    ],
    [
      "f = () => { 1 } f.documentation({ description: \"returns one\", examples: [\"f()\"] }) f.documentation.description",
      "\"returns one\""
    ],
    %w[List.instance_functions.fetch(:map).description.present? true],
    %w[List.instance_functions.fetch(:map).examples.is_a?(List) true],
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

    it "exposes global functions as documentation dictionaries" do
      function = described_class::Global.functions.code_fetch("puts")

      expect(function.code_get("name")).to eq(Code::Object::String.new("puts"))
      expect(function.code_get("description").present?).to be(true)
      expect(function.code_get("examples")).to be_a(Code::Object::List)
    end

    it "exposes classes as documentation dictionaries" do
      documentation = described_class::List.documentation

      expect(documentation.code_get("name")).to eq(
        Code::Object::String.new("List")
      )
      expect(documentation.code_get("description").present?).to be(true)
      expect(documentation.code_get("examples")).to be_a(Code::Object::List)
    end

    it "exposes documented classes from globals" do
      documentation = described_class::Global.classes.code_fetch("List")

      expect(documentation.code_get("name")).to eq(
        Code::Object::String.new("List")
      )
      expect(documentation.code_get("description").present?).to be(true)
      expect(documentation.code_get("examples")).to be_a(Code::Object::List)
    end

    it "uses custom descriptions and examples" do
      function = described_class::List.instance_functions.code_fetch("map")

      expect(function.code_get("description").to_s).not_to start_with("Calls ")
      expect(function.code_get("examples").raw).not_to be_empty
    end

    it "does not use ruby reflection to discover documentation" do
      source =
        Dir["lib/code/object.rb", "lib/code/object/**/*.rb"]
          .select { |path| File.file?(path) }
          .sort
          .map { |path| File.read(path) }
          .join("\n")

      expect(source).not_to include("const_defined?")
      expect(source).not_to include("public_instance_methods")
      expect(source).not_to include("public_methods(false)")
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

    it "documents every explicit object dispatch function" do
      undocumented = {}

      Dir["lib/code/object/*.rb"].each do |path|
        source = File.read(path)
        call_bodies =
          source.scan(
            %r{      def (?:self\.)?call\(\*\*args\)(.*?)(?=\n      def |\n      class |\n    end\n  end\nend)}m
          ).map(&:first)
        next if call_bodies.empty?

        dispatched_names =
          call_bodies
            .flat_map do |body|
              body
                .scan(/when\s+((?:"[^"]+"\s*,?\s*)+)/)
                .flat_map { |match| match.first.scan(/"([^"]+)"/).flatten }
            end
            .uniq
            .sort
        documented_names = source.scan(/"([^"]+)"\s*=>\s*\{/).flatten.uniq.sort
        missing_names = dispatched_names - documented_names

        undocumented[path] = missing_names if missing_names.any?
      end

      expect(undocumented).to eq({})
    end

    it "documents every global function" do
      documented_names = described_class::Global.functions.raw.keys.map(&:to_s)

      expected_names = %w[
        Base64
        Boolean
        Class
        Code
        Context
        Cryptography
        Date
        Decimal
        Dictionary
        Duration
        Function
        Html
        Http
        Ics
        IdentifierList
        Integer
        Json
        List
        Nothing
        Number
        Object
        Parameter
        Regex
        Range
        Smtp
        String
        Time
        Url
        break
        context
        continue
        evaluate
        getting_started
        globals
        classes
        next
        p
        print
        puts
        read
        redo
        retry
        return
      ]

      expected_names.each do |function_name|
        expect(documented_names).to include(function_name)
      end
    end

    it "documents every built-in class" do
      class_names = described_class::Global.classes.raw.keys.map(&:to_s)

      builtin_documentation_classes.each do |klass|
        expect(class_names).to include(
          klass.documentation.code_fetch("name").to_s
        )
      end
    end

    it "provides at least three examples for documented built-in functions" do
      documented_functions.each do |function|
        expect(function.code_fetch("examples").raw.size).to be >= 3
      end
    end

    it "provides at least three examples for documented built-in classes" do
      documented_classes.each do |documentation|
        expect(documentation.code_fetch("examples").raw.size).to be >= 3
      end
    end

    it "uses lowercase descriptions for documented built-in functions" do
      documented_functions.each do |function|
        description = function.code_fetch("description").to_s

        expect(description).to match(/\A[[:lower:]]/)
      end
    end

    it "uses lowercase descriptions for documented built-in classes" do
      documented_classes.each do |documentation|
        description = documentation.code_fetch("description").to_s

        expect(description).to match(/\A[[:lower:]]/)
      end
    end

    it "evaluates every documented built-in example" do
      documented_functions.each do |function|
        function_name = function.code_fetch("name")

        function
          .code_fetch("examples")
          .raw
          .each do |example|
            input = example.to_s

            expect do
              Code.evaluate(
                input,
                input: StringIO.new("example input\n"),
                output: StringIO.new
              )
            end.not_to raise_error,
                       "#{function_name}: #{input}"
          end
      end
    end

    it "evaluates every documented built-in class example" do
      documented_classes.each do |documentation|
        class_name = documentation.code_fetch("name")

        documentation
          .code_fetch("examples")
          .raw
          .each do |example|
            input = example.to_s

            expect do
              Code.evaluate(
                input,
                input: StringIO.new("example input\n"),
                output: StringIO.new
              )
            end.not_to raise_error,
                       "#{class_name}: #{input}"
          end
      end
    end

    it "exposes runnable getting started examples" do
      guide = Code.evaluate("getting_started")
      examples = guide.code_fetch("examples")

      expect(guide.code_fetch("steps").raw.size).to be >= 5
      expect(examples.raw).not_to be_empty

      examples.raw.each do |example|
        source = example.code_fetch("source").to_s
        expected = example.code_fetch("expected").to_s

        expect(Code.evaluate(source)).to eq(Code.evaluate(expected))
        expect(example.code_fetch("command").to_s).to start_with("bin/code ")
      end
    end
  end
end
