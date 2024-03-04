# frozen_string_literal: true

class Code
  class Object
    class Code < Object
      def initialize(*args, **_kargs, &_block)
        raw = args.first.presence || Nothing.new

        @raw = raw.is_a?(Node) ? raw : Node::Code.new(::Code.parse(raw.to_s))
        super
      end

      def self.name
        "Code"
      end

      def evaluate(...)
        raw.evaluate(...)
      end

      def inspect
        "code"
      end

      def to_s
        "code"
      end

      def as_json(...)
        "code".as_json(...)
      end
    end
  end
end
