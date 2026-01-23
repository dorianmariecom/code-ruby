# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Cryptography do
  it "returns sha256 hexdigest by default" do
    expect(Code.evaluate("Cryptography.sha256(:hello)").to_s).to eq(
      Digest::SHA256.hexdigest("hello")
    )
  end

  it "supports base64 format for sha1" do
    expected = Base64.strict_encode64(Digest::SHA1.digest("hello"))

    expect(
      Code.evaluate("Cryptography.sha1(:hello, format: :base64)").to_s
    ).to eq(expected)
  end

  it "raises on unknown formats" do
    expect do
      Code.evaluate("Cryptography.sha256(:hello, format: :unknown)")
    end.to raise_error(Code::Error, /unknown format/i)
  end
end
