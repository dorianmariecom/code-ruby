# frozen_string_literal: true

class Code
  class Object
    class Class < Object
      def initialize(*args, **_kargs, &_block)
        raw = args.first || Nothing.new
        raw = raw.raw if raw.is_a?(Class)
        raw = raw.class if raw.is_an?(Object)
        @raw = raw
      end

      def call(...)
        raw.call(...)
      end
    end
  end
end
