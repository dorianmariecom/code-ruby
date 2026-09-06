# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Html do
  describe "size" do
    [
      ['Html.raw("<p>a</p><p>b</p>").css(:p).size', "2"],
      ['Html.raw("<p>a</p>").css(:p).size', "1"],
      ['Html.raw("<p>a</p>").css(:a).size', "0"],
      ['Html.raw("").css(:p).size', "0"],
      [
        'elements = Html.raw("<p>a</p><p>b</p>").css(:p) programs = [1] elements.size - programs.size',
        "1"
      ],
      [
        '{ parsed_count: Html.raw("<p>a</p><p>b</p>").css(:p).size }',
        "{ parsed_count: 2 }"
      ]
    ].each do |input, expected|
      it "#{input} == #{expected}" do
        expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
      end
    end
  end
end
