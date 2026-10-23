# frozen_string_literal: true

require "spec_helper"

RSpec.describe "runtime helpers" do
  it "raises explicit errors and assertions" do
    expect { Code.evaluate('fail("broken")') }.to raise_error(
      Code::Error,
      "broken"
    )
    expect { Code.evaluate('assert(false, "required")') }.to raise_error(
      Code::Error,
      "required"
    )
    expect(Code.evaluate('assert(true, "required")').as_json).to be true
  end

  it "offers strict parsing alongside permissive parsing" do
    expect(Code.evaluate('Json.parse("bad")').nothing?).to be true
    expect { Code.evaluate('Json.parse!("bad")') }.to raise_error(
      Code::Error,
      "invalid JSON"
    )
    expect(Code.evaluate('Json.parse!("[1]")').as_json).to eq([1])
  end

  it "resolves relative urls and reads parsed components" do
    expect(
      Code.evaluate('Url.join("https://example.com/a/b", "../c?q=1")').to_s
    ).to eq("https://example.com/c?q=1")
    expect(Code.evaluate('Url.parse("https://example.com/a").host').to_s).to eq(
      "example.com"
    )
    expect { Code.evaluate('Url.join("http://[", "a")') }.to raise_error(
      Code::Error
    )
  end

  it "sends JSON and parses response JSON" do
    request =
      stub_request(:post, "https://example.com/").with(
        body: '{"a":1}',
        headers: {
          "Content-Type" => "application/json"
        }
      ).to_return(body: '{"b":2}')
    expect(
      Code.evaluate(
        'Http.post("https://example.com/", json: { a: 1 }, redirects: 0, max_retries: 0).json!.b'
      ).as_json
    ).to eq(2)
    expect(request).to have_been_requested.once
  end

  it "allows disabling redirects" do
    stub_request(:get, "https://example.com/").to_return(
      status: 302,
      headers: {
        location: "/next"
      }
    )
    expect(
      Code.evaluate(
        'Http.get("https://example.com/", redirects: 0).code'
      ).as_json
    ).to eq(302)
    expect do
      Code.evaluate('Http.get("https://example.com/", redirects: -1)')
    end.to raise_error(Code::Error)
  end

  it "retries temporary failures within the configured budget" do
    request =
      stub_request(:get, "https://example.com/")
        .to_return(status: 429)
        .then
        .to_return(status: 200)
    expect(
      Code.evaluate(
        'Http.get("https://example.com/", retry_delays: [0]).success?'
      ).as_json
    ).to be true
    expect(request).to have_been_requested.twice
  end

  it "does not retry a message sending post without explicit authorization" do
    request = stub_request(:post, "https://example.com/").to_return(status: 503)
    expect(
      Code.evaluate(
        'Http.post("https://example.com/", retry_delays: [0]).retryable?'
      ).as_json
    ).to be true
    expect(request).to have_been_requested.once
  end

  it "retries transport failures and respects retry after" do
    allow(Code::Object::Http).to receive(:sleep)
    request =
      stub_request(:get, "https://example.com/")
        .to_timeout
        .then
        .to_return(status: 429, headers: { "Retry-After" => "2" })
        .then
        .to_return(status: 200)
    expect(
      Code.evaluate(
        'Http.get("https://example.com/", retry_delays: [0, 0]).success?'
      ).as_json
    ).to be true
    expect(request).to have_been_requested.times(3)
    expect(Code::Object::Http).to have_received(:sleep).with(2)
  end

  it "bounds response bytes and rejects conflicting body formats" do
    stub_request(:get, "https://example.com/").to_return(body: "large response")
    expect do
      Code.evaluate('Http.get("https://example.com/", max_bytes: 4)')
    end.to raise_error(Code::Error, /too large/)
    expect do
      Code.evaluate('Http.post("https://example.com/", body: "x", json: {})')
    end.to raise_error(Code::Error, /cannot be combined/)
  end

  it "allows explicitly authorized post retries and exhausts the budget" do
    request = stub_request(:post, "https://example.com/").to_return(status: 503)
    result =
      Code.evaluate(
        'Http.post("https://example.com/", retry_delays: [0], headers: { "Idempotency-Key": "event" })'
      )
    expect(result.as_json.fetch("code")).to eq(503)
    expect(request).to have_been_requested.twice
    expect do
      Code.evaluate('Http.get("https://example.com/", retry_delays: [-1])')
    end.to raise_error(Code::Error)
  end

  it "preserves methods and JSON on same origin 307 redirects" do
    stub_request(:post, "https://example.com/").to_return(
      status: 307,
      headers: {
        location: "/next"
      }
    )
    request =
      stub_request(:post, "https://example.com/next").with(
        body: '{"a":1}'
      ).to_return(body: "ok")
    expect(
      Code.evaluate(
        'Http.post("https://example.com/", json: { a: 1 }, redirects: 1).body'
      ).to_s
    ).to eq("ok")
    expect(request).to have_been_requested.once
  end

  it "shortens strings and appends query parameters to existing queries" do
    expect(Code.evaluate('"abcdef".truncate(5)').to_s).to eq("abcd…")
    expect(Code.evaluate('"abcdef".truncate(1)').to_s).to eq("…")
    expect(Code.evaluate('"abcdef".truncate(5, omission: "...")').to_s).to eq(
      "ab..."
    )
    expect { Code.evaluate('"abcdef".truncate(0)') }.to raise_error(Code::Error)
    expect do
      Code.evaluate('"abcdef".truncate(2, omission: "...")')
    end.to raise_error(Code::Error)
    request =
      stub_request(:get, "https://example.com/?old=1&new=2").to_return(
        status: 200
      )
    Code.evaluate('Http.get("https://example.com/?old=1", query: { new: 2 })')
    expect(request).to have_been_requested.once
  end

  it "does not retry earlier than a long provider retry after" do
    request =
      stub_request(:get, "https://example.com/").to_return(
        status: 429,
        headers: {
          "Retry-After" => "600"
        }
      )
    expect(
      Code.evaluate(
        'Http.get("https://example.com/", retry_delays: [0]).code'
      ).as_json
    ).to eq(429)
    expect(request).to have_been_requested.once
  end
end
