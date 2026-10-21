# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Smtp do
  describe ".code_address" do
    it "parses quoted display names" do
      result = described_class.code_address('"Doe, Alice" <alice@example.com>')
      expect(result.as_json).to eq("email" => "alice@example.com", "name" => "Doe, Alice")
    end

    it "rejects multiple addresses and header injection" do
      expect { described_class.code_address("a@example.com, b@example.com") }.to raise_error(Code::Error)
      expect { described_class.code_address("a@example.com\r\nBcc: b@example.com") }.to raise_error(Code::Error)
      expect { described_class.code_address("invalid") }.to raise_error(Code::Error)
    end
  end

  describe ".code_encode" do
    it "preserves unicode, alternatives, and a stable message id" do
      encoded = described_class.code_encode(
        from: "Alice <alice@example.com>", to: "bob@example.com",
        subject: "Bonjour été", body_text: "Ça va", body_html: "<p>Ça va</p>",
        message_id: "delivery-42@example.com"
      ).to_s
      mail = Mail.read_from_string(encoded)
      expect(mail.message_id).to eq("delivery-42@example.com")
      expect(mail.subject).to eq("Bonjour été")
      expect(mail.from).to eq(["alice@example.com"])
      expect(mail.to).to eq(["bob@example.com"])
      expect(mail.text_part.decoded).to eq("Ça va")
      expect(mail.html_part.decoded).to eq("<p>Ça va</p>")
      expect(encoded).to include("\r\n")
    end

    it "dispatches the language functions" do
      expect(Code.evaluate('Smtp.address("Alice <a@example.com>").email').to_s).to eq("a@example.com")
      expect(Code.evaluate('Smtp.encode({body: "hello", message_id: "test@example.com"})').to_s).to include("Message-ID: <test@example.com>")
    end

    it "rejects message id header injection" do
      expect { described_class.code_encode(message_id: "id\r\nBcc: a@example.com") }.to raise_error(Code::Error)
    end
  end

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

    it "sends the requested message id on the SMTP wire" do
      smtp_session = instance_double(Net::SMTP)
      smtp = described_class.new(address: "smtp.example.com", port: 587)
      allow(Net::SMTP).to receive(:new).and_return(smtp_session)
      allow(smtp_session).to receive(:open_timeout=)
      allow(smtp_session).to receive(:read_timeout=)
      allow(smtp_session).to receive(:start).and_yield(smtp_session)
      allow(smtp_session).to receive(:sendmail) do |encoded, from, to|
        expect(Mail.read_from_string(encoded).message_id).to eq("delivery-42@example.com")
        expect(from).to eq("from@example.com")
        expect(to).to eq(["to@example.com"])
      end
      smtp.code_send(from: "from@example.com", to: "to@example.com", body: "hello",
                     message_id: "delivery-42@example.com")
      expect(smtp_session).to have_received(:sendmail)
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
