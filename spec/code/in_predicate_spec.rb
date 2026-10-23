# frozen_string_literal: true

require "spec_helper"

RSpec.describe "in?" do
  {
    "199.in?(200...300)" => false,
    "200.in?(200...300)" => true,
    "299.in?(200...300)" => true,
    "300.in?(200...300)" => false,
    "300.in?(200..300)" => true,
    ":ok.in?([:ok, :accepted])" => true,
    ":missing.in?([:ok])" => false,
    '":ok".in?("status:ok")' => true,
    ":ok.in?({ok: true})" => true,
    "nothing.in?([nothing])" => true
  }.each do |source, expected|
    it "evaluates #{source}" do
      expect(Code.evaluate(source).as_json).to eq(expected)
    end
  end

  it "rejects a non-collection" do
    expect { Code.evaluate("1.in?(2)") }.to raise_error(Code::Error)
  end
end
