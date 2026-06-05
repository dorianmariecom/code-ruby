# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Ics do
  it "normalizes binary event strings before json serialization" do
    source = <<~ICS
        BEGIN:VCALENDAR
        VERSION:2.0
        PRODID:-//code-ruby//EN
        BEGIN:VEVENT
        UID:event-1
        DTSTART:20260327T120000Z
        DTEND:20260327T133000Z
        SUMMARY:Joséphine
        DESCRIPTION:https://luma.com/opv3owre
        END:VEVENT
        END:VCALENDAR
      ICS

    events = described_class.code_parse(Code::Object::String.new(source.b))

    expect do
      expect(events.to_json).to include("Joséphine")
    end.not_to output.to_stderr
  end

  it "serializes comma-separated descriptions as strings" do
    source = <<~ICS
        BEGIN:VCALENDAR
        VERSION:2.0
        PRODID:-//code-ruby//EN
        BEGIN:VEVENT
        UID:event-2
        DTSTART:20260401T170000Z
        DTEND:20260401T190000Z
        SUMMARY:Le Cirque du Donut
        DESCRIPTION:Bonjour Paris !\\nLe 1er avril, Kate Raworth vous donne rendez-vous, pour une soirée inédite.
        END:VEVENT
        END:VCALENDAR
      ICS

    events = described_class.code_parse(Code::Object::String.new(source))
    description = events.raw.first.code_get("description").raw

    expect(description).to be_a(String)
    expect(description).to include("Le 1er avril, Kate Raworth")
    expect(description).to include("rendez-vous, pour")
  end

  it "serializes all-day event dates as code dates" do
    source = <<~ICS
        BEGIN:VCALENDAR
        VERSION:2.0
        PRODID:-//code-ruby//EN
        BEGIN:VEVENT
        UID:event-3
        DTSTART;VALUE=DATE:20260605
        DTEND;VALUE=DATE:20260606
        SUMMARY:All day
        END:VEVENT
        END:VCALENDAR
      ICS

    events = described_class.code_parse(Code::Object::String.new(source))
    event = events.raw.first

    expect(event.code_get("starts_at")).to be_a(Code::Object::Date)
    expect(event.code_get("starts_at").raw).to eq(Date.new(2026, 6, 5))
    expect(event.code_get("ends_at")).to be_a(Code::Object::Date)
    expect(event.code_get("ends_at").raw).to eq(Date.new(2026, 6, 6))
    expect(event.code_get("all_day").raw).to be(true)
  end
end
