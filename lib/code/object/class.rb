# frozen_string_literal: true

class Code
  class Object
    class Class < Object
      def initialize(*args, **_kargs, &_block)
        self.raw =
          if args.first.is_a?(Class)
            args.first.raw
          elsif args.first.is_an?(Object)
            args.first.class
          elsif args.first && args.first.ancestors.include?(Object)
            args.first
          else
            Nothing
          end
      end

      def call(...)
        raw.call(...)
      end
    end
  end
end
