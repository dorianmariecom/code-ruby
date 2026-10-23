# frozen_string_literal: true

require "spec_helper"

RSpec.describe "boolean formatting" do
  let(:statuses) { [199, 200, 299, 300, 399, 400, 408, 429, 499, 500] }

  [
    "true and false or true",
    "true or false and true",
    "true && false || true",
    "false || true && false",
    "status >= 200 and status < 300 or status >= 400 and status < 500 and status != 408",
    "(true or false) and true",
    "true and false and true"
  ].each do |source|
    it "preserves evaluation and stable grouping for #{source}" do
      formatted = Code.format(source)
      expect(Code.format(formatted)).to eq(formatted)
      statuses.each do |status|
        expect(Code.evaluate("status = #{status}\n#{formatted}").as_json).to eq(Code.evaluate("status = #{status}\n#{source}").as_json)
      end
      expect(formatted).to include("(") if source.include?("or") || source.include?("||")
    end
  end
end
