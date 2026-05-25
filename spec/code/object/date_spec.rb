# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Date do
  [
    %w[Date.new(0).to_list [1970,1,1]],
    %w[Date.new(0).to_integer 0],
    %w[Date.new(0).to_decimal 0.0],
    %w[Date.new(0).iso "1970-01-01"],
    %w[Date.new(0).iso8601 "1970-01-01"],
    %w[Date.new(0).rfc3339 "1970-01-01T00:00:00+00:00"],
    ["Date.new(0).rfc2822", '"Thu, 1 Jan 1970 00:00:00 +0000"'],
    %w[Date.new(0).rfc "1970-01-01T00:00:00+00:00"],
    %w[Date.new(0).utc? true],
    %w[Date.new(0).etc_utc? true],
    ['Time.zone = "Europe/Paris" Date.new(0).europe_paris?', "true"],
    ['Time.zone = "America/New_York" Date.new(0).america_new_york?', "true"],
    %w[Date.new(0).utc_offset 0],
    %w[Date.new(0).year_day 1],
    %w[Date.new(0).month_day 1],
    %w[Date.new(0).nanosecond 0],
    %w[Date.new(0).nanoseconds 0],
    %w[Date.new(0).millisecond 0],
    %w[Date.new(0).milliseconds 0],
    %w[Date.new(0).beginning_of_day.to_integer 0],
    %w[Date.new(0).end_of_day.to_integer 86399],
    ['Date.new(0).subtract(day: 1).iso', '"1969-12-31"']
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      Time.use_zone("Etc/UTC") do
        expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
      end
    end
  end
end
