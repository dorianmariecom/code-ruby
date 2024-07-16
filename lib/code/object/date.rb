# frozen_string_literal: true

class Code
  class Object
    class Date < Object
      def initialize(*args, **_kargs, &_block)
        raw = args.map(&:to_s).join("-").presence || ::Date.current.to_s
        @raw = ::Date.parse(raw)
      rescue ::Date::Error
        raise Error, "#{raw.inspect} is an invalid date"
      end

      def self.call(**args)
        operator = args.fetch(:operator, nil)

        case operator.to_s
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
        operator = args.fetch(:operator, nil)

        case operator.to_s
        when "hour"
          sig(args)
          code_hour
        else
          super
        end
      end

      def code_hour
        Integer.new(0)
      end
    end
  end
end
