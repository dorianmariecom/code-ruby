# frozen_string_literal: true

require "open3"
require "spec_helper"

RSpec.describe "bin/code" do
  let(:bin) { File.expand_path("../../bin/code", __dir__) }

  it "formats input with -f" do
    stdout, stderr, status = Open3.capture3(bin, "-f", "{a:1}")

    expect(status.success?).to be(true)
    expect(stderr).to eq("")
    expect(stdout).to eq("{ a: 1 }")
  end
end
