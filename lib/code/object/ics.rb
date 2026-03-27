# frozen_string_literal: true

class Code
  class Object
    class Ics < Object
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
        EVENT_ATTRIBUTES.each_with_object({}) do |attribute, result|
          next unless event.respond_to?(attribute)

          serialized = serialize_value(event.public_send(attribute))
          serialized = serialized.flatten(1) if attribute == :categories && serialized.is_a?(::Array)
          result[attribute] = serialized unless serialized.nil?
        end.merge(
          timestamp: serialize_value(event.dtstamp),
          starts_at: serialize_value(event.dtstart),
          ends_at: serialize_value(event.dtend),
          all_day: !!serialize_date_like(event.dtstart).is_a?(::Date)
        ).compact
      end

      def self.serialize_value(value)
        case value
        when nil
          nil
        when ::String, ::Symbol, ::Integer, ::Float, ::BigDecimal, true, false
          value
        when ::Array
          value.map { |item| serialize_value(item) }
        when ::Hash
          value.transform_values { |item| serialize_value(item) }
        else
          serialized_date = serialize_date_like(value)
          return serialized_date unless serialized_date.nil?

          if value.respond_to?(:value)
            serialize_value(value.value)
          elsif value.respond_to?(:to_ical)
            value.to_ical
          else
            value.to_s
          end
        end
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
