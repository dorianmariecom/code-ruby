# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Ics do
  it "normalizes binary event strings before json serialization" do
    source =
      <<~ICS
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

    expect { expect(events.to_json).to include("Joséphine") }.not_to output.to_stderr
  end

  it "serializes comma-separated descriptions as strings" do
    source =
      <<~ICS
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
end
