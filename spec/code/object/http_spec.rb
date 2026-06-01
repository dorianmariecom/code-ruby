# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Http do
  describe ".code_get" do
    it "blocks loopback addresses" do
      expect do
        described_class.code_get(
          Code::Object::String.new("http://127.0.0.1/status/200")
        )
      end.to raise_error(Code::Error, /local network/)
    end

    it "blocks hostnames that resolve to local addresses" do
      allow(Resolv).to receive(:getaddresses).with("localtest.me").and_return(
        ["127.0.0.1"]
      )

      expect do
        described_class.code_get(
          Code::Object::String.new("http://localtest.me/status/200")
        )
      end.to raise_error(Code::Error, /local network/)
    end

    it "blocks nat64 embedded local addresses" do
      expect do
        described_class.code_get(
          Code::Object::String.new("http://[64:ff9b::a9fe:a9fe]/")
        )
      end.to raise_error(Code::Error, /local network/)
    end

    it "rejects non-http schemes" do
      expect do
        described_class.code_get(
          Code::Object::String.new("gopher://example.com")
        )
      end.to raise_error(Code::Error, /unsupported url scheme/)
    end

    it "rejects header names with control characters" do
      expect do
        described_class.code_get(
          Code::Object::String.new("https://httpbin.org/status/200"),
          Code::Object::Dictionary.new(
            headers: {
              "X-Test\r\nInjected" => "yes"
            }
          )
        )
      end.to raise_error(Code::Error, /invalid header name/)
    end

    it "rejects restricted request headers" do
      expect do
        described_class.code_get(
          Code::Object::String.new("https://httpbin.org/status/200"),
          Code::Object::Dictionary.new(headers: { host: "example.com" })
        )
      end.to raise_error(Code::Error, /restricted header/)
    end

    it "rejects oversized request bodies" do
      stub_const("#{described_class}::MAX_REQUEST_BYTES", 4)

      expect do
        described_class.code_post(
          Code::Object::String.new("https://example.com/echo"),
          Code::Object::Dictionary.new(body: "12345")
        )
      end.to raise_error(Code::Error, /request body is too large/)
    end

    it "rejects oversized response headers" do
      stub_const("#{described_class}::MAX_HEADER_BYTES", 4)
      stub_request(:get, "https://example.com/large-header").to_return(
        headers: {
          "X-Test" => "12345"
        }
      )

      expect do
        described_class.code_get(
          Code::Object::String.new("https://example.com/large-header")
        )
      end.to raise_error(Code::Error, /response headers are too large/)
    end

    it "blocks redirects to local addresses" do
      stub_request(:get, "https://example.com/redirect").to_return(
        status: 302,
        headers: {
          "Location" => "http://127.0.0.1/admin"
        }
      )

      expect do
        described_class.code_get(
          Code::Object::String.new("https://example.com/redirect")
        )
      end.to raise_error(Code::Error, /local network/)
    end

    it "preserves credentials across same-origin host case redirects" do
      stub_request(:get, "https://example.com/redirect").to_return(
        status: 302,
        headers: {
          "Location" => "https://EXAMPLE.com/final"
        }
      )
      stub_request(:get, "https://example.com/final").to_return(body: "ok")

      described_class.code_get(
        Code::Object::String.new("https://example.com/redirect"),
        Code::Object::Dictionary.new(username: "user", password: "password")
      )

      expect(
        a_request(:get, "https://example.com/final").with do |request|
          request.headers["Authorization"].present?
        end
      ).to have_been_made
    end

    it "limits response body size" do
      stub_const("#{described_class}::MAX_RESPONSE_BYTES", 4)
      stub_request(:get, "https://example.com/large").to_return(body: "12345")

      expect do
        described_class.code_get(
          Code::Object::String.new("https://example.com/large")
        )
      end.to raise_error(Code::Error, /response is too large/)
    end

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
