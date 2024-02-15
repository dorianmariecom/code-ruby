# frozen_string_literal: true

class Code
  class Object
    class Time < Object
      DEFAULT_ZONE = "Etc/UTC"

      attr_reader :raw

      def initialize(time)
        @raw = time
      end

      def self.name
        "Time"
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
        ::Time.zone ||= DEFAULT_ZONE
        new(::Time.zone.tomorrow.beginning_of_day)
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
