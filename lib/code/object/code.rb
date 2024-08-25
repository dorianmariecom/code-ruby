# frozen_string_literal: true

class Code
  class Object
    class Code < Object
      def initialize(*args, **_kargs, &)
        raw = args.first.presence || Nothing.new
        @raw = raw.is_a?(Node) ? raw : Node::Code.new(::Code.parse(raw.to_s))
      end

      def evaluate(...)
        raw.evaluate(...)
      end
    end
  end
end
