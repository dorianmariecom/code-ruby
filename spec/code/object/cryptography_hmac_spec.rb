# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Cryptography do
  it "matches the RFC 4231 SHA256 test vector" do
    expected = "b0344c61d8db38535ca8afceaf0bf12b881dc200c9833da726e9376c2e32cff7"
    expect(described_class.code_hmac_sha256("\x0b" * 20, "Hi There").to_s).to eq(expected)
  end

  it "supports binary keys and digest output for chained signatures" do
    key = "\x00\xff".b
    digest = described_class.code_hmac_sha256(key, "payload", { format: "digest" }).to_s
    expect(digest).to eq(OpenSSL::HMAC.digest("SHA256", key, "payload"))
    expect(described_class.code_hmac_sha256(digest, "next").to_s).to eq(OpenSSL::HMAC.hexdigest("SHA256", digest, "next"))
    expect(described_class.code_hmac_sha256(key, "payload", { format: "base64" }).to_s).to eq(Base64.strict_encode64(digest))
  end

  it "dispatches from the language and rejects unsupported formats" do
    expect(Code.evaluate('Cryptography.hmac_sha256("key", "hello")').to_s).to eq(OpenSSL::HMAC.hexdigest("SHA256", "key", "hello"))
    expect { described_class.code_hmac_sha256("key", "hello", { format: "invalid" }) }.to raise_error(Code::Error)
  end
end
