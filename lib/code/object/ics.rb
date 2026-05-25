# frozen_string_literal: true

class Code
  class Object
    class Ics < Object
      CLASS_FUNCTIONS = {
        "parse" => {
          name: "parse",
          description: "parses calendar text into event dictionaries.",
          examples: [
            "Ics.parse(\"\")",
            "Ics.parse(calendar_text)",
            "Ics.parse(\"BEGIN:VCALENDAR\\nEND:VCALENDAR\")"
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
        calendars = ::Icalendar::Calendar.parse(source)
        calendars
          .flat_map(&:events)
          .map { |event| serialize_event(event) }
          .to_code
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

      def self.serialize_value(value)
        case value
        when nil
          nil
        when ::String
          normalize_string(value)
        when ::Symbol, ::Integer, ::Float, ::BigDecimal, true, false
          value
        when ::Array
          value.map { |item| serialize_value(item) }
        when ::Hash
          value.transform_values { |item| serialize_value(item) }
        else
          serialized_date = serialize_date_like(value)
          return serialized_date unless serialized_date.nil?

          if value.is_a?(::Icalendar::Value)
            serialize_value(value.value)
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
