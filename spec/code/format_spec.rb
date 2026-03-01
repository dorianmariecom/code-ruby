# frozen_string_literal: true

require "spec_helper"
require "json"

RSpec.describe Code::Format do
  describe ".format" do
    [
      ["Time.now.second", "Time.now.second"],
      ["{}", "{}"],
      ["[]", "[]"],
      ['""', '""'],
      ["100000", "100_000"],
      ["1000000", "1_000_000"],
      ["1.0000000001", "1.000_000_000_1"],
      ["{a:1}", "{ a: 1 }"],
      ["[1,2,3]", "[1, 2, 3]"],
      [
        "[1, 2, 3].select { |n| n.even? }",
        "[1, 2, 3].select { |n| n.even? }"
      ],
      [
        "if true 1 elsif false 2 else 3 end",
        "if true\n  1\nelsif false\n  2\nelse\n  3\nend"
      ],
      [
        "sum = (a, b: 2) => { a + b } sum(1)",
        "sum = (a, b: 2) => {\n  a + b\n}\n\nsum(1)"
      ],
      [
        "Http.post(\"https://api.openai.com/v1/chat/completions\", headers: { authorization: \"Bearer {open_ai_api_key}\", \"content-type\": \"application/json\" }, body: { model: model, messages: [{ role: \"system\", content: \"hello\" }, { role: \"user\", content: \"world\" }] }.to_json)",
        "Http.post(\n  \"https://api.openai.com/v1/chat/completions\",\n  headers: {\n    authorization: \"Bearer {open_ai_api_key}\",\n    \"content-type\": \"application/json\"\n  },\n  body: {\n    model: model,\n    messages: [\n      { role: :system, content: :hello },\n      { role: :user, content: :world }\n    ]\n  }.to_json\n)"
      ]
    ].each do |input, expected|
      it "formats #{input.inspect}" do
        expect(described_class.format(Code.parse(input))).to eq(expected)
      end
    end

    it "round-trips parse and evaluation semantics for formatted code" do
      input = "user = {name: :Dorian, age: 31} user.age"
      formatted = described_class.format(Code.parse(input))

      expect(Code.parse(formatted)).to be_present
      expect(Code.evaluate(formatted)).to eq(Code.evaluate(input))
    end
  end
end
