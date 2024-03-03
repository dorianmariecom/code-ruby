# frozen_string_literal: true

class Code
  class Object
    class Time < Object
      DEFAULT_ZONE = "Etc/UTC"

      def initialize(time)
        ::Time.zone ||= DEFAULT_ZONE
        time = time.raw if time.is_a?(Time)
        time = time.to_s if time.is_a?(::Time)
        @raw = ::Time.zone.parse(time)
        super
      end

      def self.name
        "Time"
      end

      def self.call(**args)
        operator = args.fetch(:operator, nil)

        case operator.to_s
        when "now"
          sig(args)
          code_now
        when "tomorrow"
          sig(args)
          code_tomorrow
        else
          super
        end
      end

      def self.code_tomorrow
        ::Time.zone ||= DEFAULT_ZONE
        new(::Time.zone.tomorrow.beginning_of_day)
      end

      def self.code_now
        ::Time.zone ||= DEFAULT_ZONE
        new(::Time.zone.now.beginning_of_day)
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, [])
        value = arguments.first&.value

        case operator.to_s
        when "after?"
          sig(args) { Time.maybe }
          code_after?(value)
        when "before?"
          sig(args) { Time.maybe }
          code_before?(value)
        when "past?"
          sig(args)
          code_past?
        when "future?"
          sig(args)
          code_future?
        else
          super
        end
      end

      def code_after?(other = nil)
        other ||= Time.code_now
        Boolean.new(raw.after?(other.raw))
      end

      def code_before?(other = nil)
        other ||= Time.code_now
        Boolean.new(raw.before?(other.raw))
      end

      def code_past?
        code_before?
      end

      def code_future?
        code_after?
      end

      def inspect
        to_s
      end

      def to_s
        raw.to_s
      end

      def as_json(...)
        raw.as_json(...)
      end
    end
  end
end
