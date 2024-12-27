# frozen_string_literal: true

class Code
  class Object
    class Class < Object
      def initialize(*args, **_kargs, &)
        if args.first.is_a?(Class)
          @raw = args.first.raw
        elsif args.first.is_an?(Object)
          @raw = args.first.class
        elsif args.first < Object
          @raw = args.first
        else
          @raw = Nothing
        end
      end

      def call(...)
        raw.call(...)
      end
    end
  end
end
