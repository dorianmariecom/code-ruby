# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Integer do
  [
    ["10 % 5", "0"],
    ["5 * 2", "10"],
    ["2 ** 2", "4"],
    ["1 + 1", "2"],
    ["1 - 0", "1"],
    ["-1", "1 - 2"],
    ["1 / 2", "0.5"],
    ["1 < 2", "true"],
    ["1 <= 1", "true"],
    ["1 <=> 2", "-1"],
    ["1 > 0", "true"],
    ["1 >= 1", "true"],
    ["1 === 1", "true"],
    %w[-1.abs 1],
    %w[-1.ceil -1],
    %w[1234.ceil(-2) 1300],
    %w[-1.floor -1],
    %w[1234.floor(-2) 1200],
    %w[1.round 1],
    %w[1234.round(-2) 1200],
    %w[0.zero? true],
    %w[1.truncate 1],
    %w[1234.truncate(-2) 1200],
    %w[1.to_string :1],
    %w[1.to_integer 1],
    %w[1.to_decimal 1.0],
    %w[4.sqrt 2.0],
    ["1 + 2", "3"],
    ["2 - 1", "1"],
    ["a = 2 - 1 a", "1"]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
