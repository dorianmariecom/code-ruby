# frozen_string_literal: true

require "active_support/core_ext/numeric/time"

class Code
  class Object
    class Duration < Object
      attr_reader :raw

      def initialize(duration)
        @raw = duration
      end

      def self.name
        "Duration"
      end

      def call(**args)
        operator = args.fetch(:operator, nil)

        case operator.to_s
        when "from_now"
          sig(args)
          code_from_now
        else
          super
        end
      end

      def code_from_now
        Time.new(raw.from_now)
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
