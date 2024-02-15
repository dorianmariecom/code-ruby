# frozen_string_literal: true

class Code
  class Object
    class Date < Object
      attr_reader :raw

      def initialize(date)
        @raw = date
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
    end
  end
end
