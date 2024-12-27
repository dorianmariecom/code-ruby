# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Type do
  describe "valid" do
    ["1 + 2", "2 * 3.4"].each do |input|
      it input do
        expect { Code.evaluate(input) }.not_to raise_error
      end
    end
  end

  describe "invalid" do
    ["1 - :a", "2 * true"].each do |input|
      it input do
        expect { Code.evaluate(input) }.to raise_error(Code::Error)
      end
    end
  end
end
