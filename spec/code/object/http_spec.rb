# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Http do
  describe ".code_get" do
    it "wraps connection reset errors as Code::Error" do
      allow_any_instance_of(Net::HTTP).to receive(:request).and_raise(
        Errno::ECONNRESET,
        "Connection reset by peer - SSL_connect"
      )

      expect do
        described_class.code_get(
          Code::Object::String.new("https://httpbin.org/status/200")
        )
      end.to raise_error(Code::Error, "http error")
    end

    it "wraps name resolution errors as Code::Error" do
      allow_any_instance_of(Net::HTTP).to receive(:request).and_raise(
        Socket::ResolutionError,
        "getaddrinfo(3): Temporary failure in name resolution"
      )

      expect do
        described_class.code_get(
          Code::Object::String.new("https://api.github.com")
        )
      end.to raise_error(Code::Error, "http error")
    end
  end
end
