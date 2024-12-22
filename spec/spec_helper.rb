# frozen_string_literal: true

require_relative "../lib/code-ruby"
require "sinatra"
require "webmock/rspec"

class FakeHttpBin < Sinatra::Base
  set :host_authorization, { permitted_hosts: ["httpbin.org"] }

   [
    "GET",
    "HEAD",
    "POST",
    "PUT",
    "DELETE",
    "CONNECT",
    "OPTIONS",
    "TRACE",
    "PATCH",
   ].each do |verb|
     route verb, "/status/:status" do
       status params[:status].to_i
     end
   end
end

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.before do
    stub_request(:any, /httpbin\.org/).to_rack(FakeHttpBin)
  end
end
