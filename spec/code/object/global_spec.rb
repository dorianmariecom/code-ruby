# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Global do
  before { allow(Kernel).to receive(:sleep).and_return(0) }

  it "waits for one second by default and returns nothing" do
    expect(Code.evaluate("wait")).to eq(Code::Object::Nothing.new)
    expect(Kernel).to have_received(:sleep).with(1)
  end

  it "accepts integer and decimal numbers for singular and plural time units" do
    described_class::WAIT_UNIT_SECONDS.each do |unit, seconds_per_unit|
      Code.evaluate("wait(#{unit}: 2)")
      Code.evaluate("wait(#{unit}: 1.5)")

      expect(Kernel).to have_received(:sleep).with(
        2 * seconds_per_unit
      ).at_least(:once)
      expect(Kernel).to have_received(:sleep).with(
        BigDecimal("1.5") * seconds_per_unit
      ).at_least(:once)
    end
  end

  it "adds all supported time units" do
    Code.evaluate(
      "wait(milliseconds: 500, seconds: 1, minutes: 2, hours: 3, days: 4, months: 5, years: 6)"
    )

    expected =
      0.5 +
        1 +
        (2 * ActiveSupport::Duration::SECONDS_PER_MINUTE) +
        (3 * ActiveSupport::Duration::SECONDS_PER_HOUR) +
        (4 * ActiveSupport::Duration::SECONDS_PER_DAY) +
        (5 * ActiveSupport::Duration::SECONDS_PER_MONTH) +
        (6 * ActiveSupport::Duration::SECONDS_PER_YEAR)

    expect(Kernel).to have_received(:sleep).with(expected)
  end

  it "adds singular and plural forms of the same unit" do
    Code.evaluate("wait(second: 1, seconds: 1.5)")

    expect(Kernel).to have_received(:sleep).with(BigDecimal("2.5"))
  end

  it "rejects non-number durations" do
    expect { Code.evaluate('wait(seconds: "1")') }.to raise_error(
      Code::Error,
      /expected .*Number.*got.*"1"/
    )
    expect(Kernel).not_to have_received(:sleep)
  end
end
