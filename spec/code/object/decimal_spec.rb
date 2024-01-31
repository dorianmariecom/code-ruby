# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Decimal do
  [
    ["10.2 % 5.1", "0"],
    ["5.5 * 2.5", "13.75"],
    ["1.5 ** 2", "2.25"],
    ["1.5 + 1.5", "3"],
    ["1.5 - 0.5", "1"],
    %w[-1.5 -3/2],
    ["1.5 / 2", "0.75"],
    ["1.1 < 1.2", "true"],
    ["1.1 <= 1.1", "true"],
    ["1.1 <=> 1.2", "-1"],
    ["1.1 > 0.9", "true"],
    ["1.1 >= 1.1", "true"],
    ["1.1 === 1.1", "true"],
    %w[-1.1.abs 1.1],
    %w[-1.1.ceil -1],
    %w[-1.123.ceil(2) -1.12],
    %w[-1.1.floor -2],
    %w[-1.123.floor(2) -1.13],
    %w[1.1.round 1],
    %w[1.123.round(2) 1.12],
    %w[1.2.clone 1.2],
    %w[0.0.zero? true],
    %w[1.2.truncate 1],
    %w[1.234.truncate(2) 1.23],
    %w[1.2.to_string 1.2],
    %w[1.2.to_integer 1],
    %w[1.2.to_decimal 1.2],
    %w[4.0.sqrt 2.0],
    %w[0.0.zero? true],
    %w[1.0.one? true],
    %w[2.0.two? true],
    %w[3.0.three? true],
    %w[4.0.four? true],
    %w[5.0.five? true],
    %w[6.0.six? true],
    %w[7.0.seven? true],
    %w[8.0.eight? true],
    %w[9.0.nine? true],
    %w[10.0.ten? true]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end
end
