# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Time do
  [
    %w[Time.new(0).to_list [1970,1,1,0,0,0,"UTC"]],
    %w[Time.new(0).to_integer 0],
    %w[Time.new(0).to_decimal 0.0],
    %w[Time.new(0).iso "1970-01-01T00:00:00Z"],
    %w[Time.new(0).iso8601 "1970-01-01T00:00:00Z"],
    %w[Time.new(0).rfc3339 "1970-01-01T00:00:00Z"],
    ["Time.new(0).rfc2822", '"Thu, 01 Jan 1970 00:00:00 +0000"'],
    %w[Time.new(0).rfc "1970-01-01T00:00:00Z"],
    %w[Time.new(0).utc? true],
    %w[Time.new(0).etc_utc? true],
    ['Time.zone = "Europe/Paris" Time.new(0).europe_paris?', "true"],
    ['Time.zone = "America/New_York" Time.new(0).america_new_york?', "true"],
    %w[Time.new(0).utc_offset 0],
    %w[Time.new(0).year_day 1],
    %w[Time.new(0).month_day 1],
    %w[Time.new(0).nanosecond 0],
    %w[Time.new(0).nanoseconds 0],
    %w[Time.new(0).millisecond 0],
    %w[Time.new(0).milliseconds 0],
    %w[Time.new(0).utc.local.to_integer 0],
    %w[Time.new(0).beginning_of_day.to_integer 0],
    %w[Time.new(0).end_of_day.to_integer 86399],
    ["Time.new(0).subtract(seconds: 1).to_integer", "-1"]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      Time.use_zone("Etc/UTC") do
        expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
      end
    end
  end
end
