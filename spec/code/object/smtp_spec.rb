# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Smtp do
  describe "#code_send" do
    it "blocks local delivery targets" do
      allow(Resolv).to receive(:getaddresses).with("localtest.me").and_return(
        ["127.0.0.1"]
      )
      smtp = described_class.new(address: "localtest.me", port: 587)

      expect do
        smtp.code_send(
          from: "from@example.com",
          to: "to@example.com",
          subject: "hello",
          body: "body"
        )
      end.to raise_error(Code::Error, /local network/)
    end

    it "requires supported submission ports" do
      smtp = described_class.new(address: "smtp.example.com", port: 25)

      expect do
        smtp.code_send(
          from: "from@example.com",
          to: "to@example.com",
          subject: "hello",
          body: "body"
        )
      end.to raise_error(Code::Error, /unsupported port/)
    end

    it "requires tls" do
      smtp =
        described_class.new(
          address: "smtp.example.com",
          port: 587,
          enable_starttls_auto: false
        )

      expect do
        smtp.code_send(
          from: "from@example.com",
          to: "to@example.com",
          subject: "hello",
          body: "body"
        )
      end.to raise_error(Code::Error, /tls is required/)
    end

    it "requires mandatory starttls and pins the resolved address" do
      smtp_session = instance_double(Net::SMTP)
      smtp = described_class.new(address: "smtp.example.com", port: 587)

      allow(Net::SMTP).to receive(:new).and_return(smtp_session)
      allow(smtp_session).to receive(:open_timeout=)
      allow(smtp_session).to receive(:read_timeout=)
      allow(smtp_session).to receive(:start)

      smtp.code_send(
        from: "from@example.com",
        to: "to@example.com",
        subject: "hello",
        body: "body"
      )

      expect(Net::SMTP).to have_received(:new).with(
        "93.184.216.34",
        587,
        tls: false,
        starttls: :always,
        tls_verify: true,
        tls_hostname: "smtp.example.com",
        ssl_context_params: {
          verify_mode: OpenSSL::SSL::VERIFY_PEER
        }
      )
      expect(smtp_session).to have_received(:open_timeout=).with(
        described_class::DEFAULT_TIMEOUT
      )
      expect(smtp_session).to have_received(:read_timeout=).with(
        described_class::DEFAULT_TIMEOUT
      )
    end
  end
end
