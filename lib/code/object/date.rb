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
        else
          super
        end
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
    end
  end
end
