# frozen_string_literal: true

require "spec_helper"

RSpec.describe "http defaults" do
  it "sets connection and IO deadlines without redirects or retries" do
    expect_any_instance_of(Net::HTTP).to receive(:open_timeout=).with(10).and_call_original
    expect_any_instance_of(Net::HTTP).to receive(:read_timeout=).with(30).and_call_original
    expect_any_instance_of(Net::HTTP).to receive(:write_timeout=).with(30).and_call_original
    expect_any_instance_of(Net::HTTP).to receive(:max_retries=).with(0).and_call_original
    request = stub_request(:get, "https://example.com/").to_return(status: 302, headers: {location: "/next"})
    expect(Code.evaluate('Http.get("https://example.com/").code').as_json).to eq(302)
    expect(request).to have_been_requested.once
  end

  it "keeps explicit timeout and redirect overrides" do
    clients = []
    allow(Net::HTTP).to receive(:new).and_wrap_original do |original, *arguments|
      original.call(*arguments).tap { |client| clients << client }
    end
    stub_request(:get, "https://example.com/").to_return(status: 302, headers: {location: "/next"})
    stub_request(:get, "https://example.com/next").to_return(body: "ok")
    expect(Code.evaluate('Http.get("https://example.com/", timeout: 45, write_timeout: 12, redirects: 1).body').to_s).to eq("ok")
    expect(clients.size).to eq(2)
    expect(clients.map { |client| [client.open_timeout, client.read_timeout, client.write_timeout] }).to eq([[45, 45, 12], [45, 45, 12]])
  end
end
