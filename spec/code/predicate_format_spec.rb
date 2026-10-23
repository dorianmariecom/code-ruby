# frozen_string_literal: true

require "spec_helper"

RSpec.describe "predicate formatting" do
  it "normalizes quoted predicate dictionary labels" do
    expect(Code.format('{"success?": true}')).to eq("{ success?: true }")
    expect(Code.parse('{"success?": true}')).to eq(Code.parse("{success?: true}"))
    expect(Code.evaluate("{success?: true}.success?").as_json).to be true
  end

  it "keeps punctuation keys that cannot be bare labels quoted" do
    expect(Code.format('{"content-type": "application/json"}')).to include('"content-type"')
  end

  it "omits empty parentheses from member calls while preserving bare calls" do
    expect(Code.format("heartbeat_response.success?()")).to eq("heartbeat_response.success?")
    expect(Code.format("function()")).to eq("function()")
    expect(Code.format("response.body().strip()")).to eq("response.body.strip")
    expect(Code.evaluate('{f: () => { true }}.f()').as_json).to be true
    expect(Code.evaluate(Code.format('{f: () => { true }}.f()')).as_json).to be true
  end
end
