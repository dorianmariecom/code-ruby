# frozen_string_literal: true

class Code
  class Object
    class Ics < Object
      CLASS_DOCUMENTATION = {
        name: "Ics",
        description: "parses icalendar text and exposes events as dictionaries.",
        examples: [
          "Ics.parse(\"BEGIN:VCALENDAR\\nBEGIN:VEVENT\\nSUMMARY:meet\\nEND:VEVENT\\nEND:VCALENDAR\")",
          "Ics.parse(\"BEGIN:VCALENDAR\\nVERSION:2.0\\nEND:VCALENDAR\")",
          "Ics.parse(\"\")"
        ]
      }.freeze
      CLASS_FUNCTIONS = {
        "parse" => {
          name: "parse",
          description: "returns event dictionaries parsed from icalendar text.",
          examples: [
            "Ics.parse(\"BEGIN:VCALENDAR\\nBEGIN:VEVENT\\nUID:1\\nSUMMARY:demo\\nEND:VEVENT\\nEND:VCALENDAR\")",
            "Ics.parse(\"BEGIN:VCALENDAR\\nEND:VCALENDAR\")",
            "Ics.parse(\"not calendar data\")"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return CLASS_FUNCTIONS if scope == :class

        {}
      end

      EVENT_ATTRIBUTES = %i[
        uid
        summary
        description
        location
        url
        status
        organizer
        categories
        attendees
        geo
      ].freeze
      MISSING_ATTRIBUTE = Object.new.freeze
      MAX_EVENTS = 10_000
      MAX_NESTING = 50

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "parse"
          sig(args) { String }
          code_parse(code_value)
        else
          super
        end
      end

      def self.code_parse(value)
        source = value.to_code.raw
        ::Code.ensure_input_size!(source, label: "ics")
        calendars = ::Icalendar::Calendar.parse(source)
        events = calendars.flat_map(&:events)
        raise Error, "ics has too many events" if events.size > MAX_EVENTS

        events.map { |event| serialize_event(event) }.to_code
      rescue ::Code::Error
        raise
      rescue StandardError
        [].to_code
      end

      def self.serialize_event(event)
        EVENT_ATTRIBUTES
          .each_with_object({}) do |attribute, result|
            serialized = serialize_value(event_attribute(event, attribute))
            next if serialized == MISSING_ATTRIBUTE

            serialized =
              if attribute == :categories && serialized.is_a?(::Array)
                serialized.flatten(1)
              elsif scalar_event_attribute?(attribute) &&
                    serialized.is_a?(::Array)
                serialized.join(",")
              else
                serialized
              end
            result[attribute] = serialized unless serialized.nil?
          end
          .merge(
            timestamp: serialize_value(event.dtstamp),
            starts_at: serialize_value(event.dtstart),
            ends_at: serialize_value(event.dtend),
            all_day: !!serialize_date_like(event.dtstart).is_a?(::Date)
          )
          .compact
      end

      def self.event_attribute(event, attribute)
        case attribute
        when :uid
          event.uid
        when :summary
          event.summary
        when :description
          event.description
        when :location
          event.location
        when :url
          event.url
        when :status
          event.status
        when :organizer
          event.organizer
        when :categories
          event.categories
        when :attendees
          event.attendees
        when :geo
          event.geo
        end
      rescue NoMethodError
        MISSING_ATTRIBUTE
      end

      def self.serialize_value(value, depth: 0)
        raise Error, "ics is too deeply nested" if depth > MAX_NESTING

        case value
        when nil
          nil
        when ::String
          normalize_string(value)
        when ::Symbol, ::Integer, ::Float, ::BigDecimal, true, false
          value
        when ::Array
          value.map { |item| serialize_value(item, depth: depth + 1) }
        when ::Hash
          value.transform_values do |item|
            serialize_value(item, depth: depth + 1)
          end
        else
          serialized_date = serialize_date_like(value)
          return serialized_date unless serialized_date.nil?

          if value.is_a?(::Icalendar::Value)
            serialize_value(value.value, depth: depth + 1)
          else
            normalize_string(value.to_s)
          end
        end
      end

      def self.scalar_event_attribute?(attribute)
        !%i[categories attendees geo].include?(attribute)
      end

      def self.normalize_string(value)
        value
          .dup
          .force_encoding(::Encoding::UTF_8)
          .encode(::Encoding::UTF_8, invalid: :replace, undef: :replace)
      end

      def self.serialize_date_like(value)
        case value
        when ::Time, ::Date, ::ActiveSupport::TimeWithZone
          value
        when ::DateTime
          value.to_time
        end
      end
    end
  end
end
