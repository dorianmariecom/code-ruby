# frozen_string_literal: true

class Code
  class Object
    class Class < Object
      attr_reader :raw

      def initialize(*args, **_kargs, &_block)
        raw = args.first || Nothing.new
        raw = raw.raw if raw.is_a?(Class)
        raw = raw.class if raw.is_an?(Object)
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

      def as_json(...)
        raw.name.as_json(...)
      end
    end
  end
end
