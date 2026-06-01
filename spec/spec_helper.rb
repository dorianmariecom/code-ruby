# frozen_string_literal: true

require_relative "../lib/code-ruby"
require "sinatra"
require "webmock/rspec"

class FakeHttpBin < Sinatra::Base
  set :host_authorization, { permitted_hosts: ["httpbin.org"] }

  %w[GET HEAD POST PUT DELETE OPTIONS TRACE PATCH].each do |verb|
    route verb, "/status/:status" do
      status params[:status].to_i
    end
  end
end

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.before do
    stub_request(:any, /httpbin\.org/).to_rack(FakeHttpBin)
    allow(Resolv).to receive(:getaddresses).and_call_original
    allow(Resolv).to receive(:getaddresses).with("api.github.com").and_return(
      ["140.82.112.6"]
    )
    allow(Resolv).to receive(:getaddresses).with("example.com").and_return(
      ["93.184.216.34"]
    )
    allow(Resolv).to receive(:getaddresses).with("httpbin.org").and_return(
      ["93.184.216.34"]
    )
    allow(Resolv).to receive(:getaddresses).with("smtp.example.com").and_return(
      ["93.184.216.34"]
    )
  end
end
