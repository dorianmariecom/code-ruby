# frozen_string_literal: true

class Code
  class Object
    class Class < Object
      attr_reader :raw

      def initialize(raw)
        @raw = raw
      end

      def call(**args)
        operator = args.fetch(:operator, nil)

        if raw == Time && operator.to_s == "tomorrow"
          sig(args)
          Time.code_tomorrow
        elsif raw == Date && operator.to_s == "tomorrow"
          sig(args)
          Date.code_tomorrow
        else
          super
        end
      end

      def self.name
        "Class"
      end
    end
  end
end
