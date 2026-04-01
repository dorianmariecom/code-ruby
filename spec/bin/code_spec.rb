# frozen_string_literal: true

require "open3"
require "spec_helper"

RSpec.describe "bin/code" do
  let(:bin) { File.expand_path("../../bin/code", __dir__) }
  let(:tmp_glob_dir) { File.expand_path("../tmp/code_glob", __dir__) }

  after { FileUtils.rm_rf(tmp_glob_dir) }

  it "formats input with -f" do
    stdout, stderr, status = Open3.capture3(bin, "-f", "{a:1}")

    expect(status.success?).to be(true)
    expect(stderr).to eq("")
    expect(stdout).to eq("{ a: 1 }")
  end

  it "formats quoted globbed files with -f" do
    FileUtils.mkdir_p(File.join(tmp_glob_dir, "a"))
    FileUtils.mkdir_p(File.join(tmp_glob_dir, "b"))
    File.write(File.join(tmp_glob_dir, "a", "first.code"), "{a:1}")
    File.write(File.join(tmp_glob_dir, "b", "second.code"), "{b:2}")

    stdout, stderr, status =
      Open3.capture3(bin, "-f", File.join(tmp_glob_dir, "**", "*.code"))

    expect(status.success?).to be(true)
    expect(stderr).to eq("")
    expect(stdout).to eq("{ a: 1 }\n\n{ b: 2 }")
  end

  it "formats shell-expanded globbed files with -f" do
    FileUtils.mkdir_p(File.join(tmp_glob_dir, "a"))
    FileUtils.mkdir_p(File.join(tmp_glob_dir, "b"))
    first = File.join(tmp_glob_dir, "a", "first.code")
    second = File.join(tmp_glob_dir, "b", "second.code")
    File.write(first, "{a:1}")
    File.write(second, "{b:2}")

    stdout, stderr, status = Open3.capture3(bin, "-f", first, second)

    expect(status.success?).to be(true)
    expect(stderr).to eq("")
    expect(stdout).to eq("{ a: 1 }\n\n{ b: 2 }")
  end
end
