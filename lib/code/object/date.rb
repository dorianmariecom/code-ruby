# frozen_string_literal: true

class Code
  class Object
    class Date < Object
      def initialize(*args, **_kargs, &_block)
        raw = args.map(&:to_s).join("-").presence || ::Date.current.to_s
        @raw = ::Date.parse(raw)
        super
      rescue ::Date::Error
        raise Error, "#{raw.inspect} is an invalid date"
      end

      def self.name
        "Date"
      end

      def self.call(**args)
        operator = args.fetch(:operator, nil)

        case operator.to_s
        when "tomorrow"
          sig(args)
          code_tomorrow
        else
          super
        end
      end

      def self.code_tomorrow
        ::Time.zone ||= Time::DEFAULT_ZONE
        new(::Time.zone.tomorrow)
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
