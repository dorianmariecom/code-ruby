# frozen_string_literal: true

class Code
  class Object
    class Time < Object
      DEFAULT_ZONE = "Etc/UTC"

      def initialize(*args, **_kargs, &)
        ::Time.zone ||= DEFAULT_ZONE
        @raw = ::Time.zone.parse(args.first.to_s) || ::Time.zone.now
      end

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code

        case code_operator.to_s
        when "now"
          sig(args)
          code_now
        when "tomorrow"
          sig(args)
          code_tomorrow
        when "yesterday"
          sig(args)
          code_yesterday
        when "hour"
          sig(args)
          code_hour
        else
          super
        end
      end

      def self.code_hour
        code_now.code_hour
      end

      def self.code_tomorrow
        ::Time.zone ||= DEFAULT_ZONE
        new(::Time.zone.tomorrow)
      end

      def self.code_yesterday
        ::Time.zone ||= DEFAULT_ZONE
        new(::Time.zone.yesterday)
      end

      def self.code_now
        ::Time.zone ||= DEFAULT_ZONE
        new(::Time.zone.now)
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "after?"
          sig(args) { Time.maybe }
          code_after?(code_value)
        when "before?"
          sig(args) { Time.maybe }
          code_before?(code_value)
        when "past?"
          sig(args)
          code_past?
        when "future?"
          sig(args)
          code_future?
        when "hour"
          sig(args)
          code_hour
        when "format"
          sig(args) { String }
          code_format(code_value)
        else
          super
        end
      end

      def code_after?(other = nil)
        code_other = other.to_code
        code_other = Time.code_now if code_other.nothing?

        Boolean.new(raw.after?(code_other.raw))
      end

      def code_before?(other = nil)
        code_other = other.to_code
        code_other = Time.code_now if code_other.nothing?

        Boolean.new(raw.before?(code_other.raw))
      end

      def code_past?
        code_before?
      end

      def code_future?
        code_after?
      end

      def code_hour
        Integer.new(raw.hour)
      end

      def code_format(format)
        code_format = format.to_code

        String.new(raw.strftime(code_format.raw))
      end
    end
  end
end
