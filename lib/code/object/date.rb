# frozen_string_literal: true

class Code
  class Object
    class Date < Object
      def initialize(*args, **_kargs, &)
        @raw = ::Date.parse(args.map(&:to_s).join("-"))
      rescue ::Date::Error
        @raw = ::Date.current
      end

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code

        case code_operator.to_s
        when "tomorrow"
          sig(args)
          code_tomorrow
        when "yesterday"
          sig(args)
          code_yesterday
        when "today"
          sig(args)
          code_today
        when "now"
          sig(args)
          code_now
        when "hour"
          sig(args)
          code_hour
        else
          super
        end
      end

      def self.code_hour
        code_today.code_hour
      end

      def self.code_now
        ::Time.zone ||= Time::DEFAULT_ZONE
        new(::Time.zone.now.beginning_of_day)
      end

      def self.code_today
        ::Time.zone ||= Time::DEFAULT_ZONE
        new(::Time.zone.now.beginning_of_day)
      end

      def self.code_tomorrow
        ::Time.zone ||= Time::DEFAULT_ZONE
        new(::Time.zone.tomorrow.beginning_of_day)
      end

      def self.code_yesterday
        ::Time.zone ||= Time::DEFAULT_ZONE
        new(::Time.zone.yesterday.beginning_of_day)
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code

        case code_operator.to_s
        when "hour"
          sig(args)
          code_hour
        when "hours"
          sig(args)
          code_hours
        when "minute"
          sig(args)
          code_minute
        when "minutes"
          sig(args)
          code_minutes
        when "second"
          sig(args)
          code_second
        when "seconds"
          sig(args)
          code_seconds
        else
          super
        end
      end

      def code_hour
        Integer.new(0)
      end

      def code_hours
        Integer.new(0)
      end

      def code_minute
        Integer.new(0)
      end

      def code_minutes
        Integer.new(0)
      end

      def code_second
        Integer.new(0)
      end

      def code_seconds
        Integer.new(0)
      end
    end
  end
end
