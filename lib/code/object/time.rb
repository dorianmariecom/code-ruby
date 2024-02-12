# frozen_string_literal: true

class Code
  class Object
    class Time < Object
      attr_reader :raw

      def initialize(time)
        @raw = time
      end

      def self.name
        "Time"
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
