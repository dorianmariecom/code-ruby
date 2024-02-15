# frozen_string_literal: true

class Code
  class Object
    class Class < Object
      attr_reader :raw

      def initialize(raw)
        @raw = raw
      end

      def call(...)
        raw.call(...)
      end

      def to_s
        raw.name
      end

      def inspect
        to_s
      end

      def self.name
        "Class"
      end
    end
  end
end
