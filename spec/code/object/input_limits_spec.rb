# frozen_string_literal: true

require "spec_helper"

RSpec.describe "input limits" do
  before { stub_const("Code::MAX_INPUT_BYTES", 4) }

  it "limits json parse input" do
    expect do
      Code::Object::Json.code_parse(Code::Object::String.new("[1,2]"))
    end.to raise_error(Code::Error, /json is too large/)
  end

  it "limits html parse input" do
    expect do
      Code::Object::Html.new("<p>hi</p>")
    end.to raise_error(Code::Error, /html is too large/)
  end

  it "limits html unescape input" do
    expect do
      Code::Object::Html.code_unescape(Code::Object::String.new("&nbsp;"))
    end.to raise_error(Code::Error, /html is too large/)
  end

  it "limits html reparsed from html objects" do
    stub_const("Code::MAX_INPUT_BYTES", 10)
    html = Code::Object::Html.new("<p>ok</p>")

    stub_const("Code::MAX_INPUT_BYTES", 4)

    expect do
      Code::Object::Html.code_raw(html)
    end.to raise_error(Code::Error, /html is too large/)
  end

  it "limits ics parse input" do
    expect do
      Code::Object::Ics.code_parse(Code::Object::String.new("BEGIN:VCALENDAR"))
    end.to raise_error(Code::Error, /ics is too large/)
  end

  it "limits json output shape" do
    stub_const("Code::MAX_INPUT_BYTES", 100)
    stub_const("Code::Object::Json::MAX_ITEMS", 1)

    expect do
      Code::Object::Json.code_parse(Code::Object::String.new("[1,2]"))
    end.to raise_error(Code::Error, /too many items/)
  end

  it "limits ics event count" do
    stub_const("Code::MAX_INPUT_BYTES", 1000)
    stub_const("Code::Object::Ics::MAX_EVENTS", 1)
    source = <<~ICS
      BEGIN:VCALENDAR
      BEGIN:VEVENT
      UID:1
      END:VEVENT
      BEGIN:VEVENT
      UID:2
      END:VEVENT
      END:VCALENDAR
    ICS

    expect do
      Code::Object::Ics.code_parse(Code::Object::String.new(source))
    end.to raise_error(Code::Error, /too many events/)
  end
end
