# frozen_string_literal: true

class Code
  class Object
    class Code < Object
      def initialize(*args, **_kargs, &)
        @raw =
          if args.first.is_a?(Node)
            args.first
          else
            Node::Code.new(::Code.parse(args.first.to_s))
          end
      end

      def code_evaluate(...)
        raw.evaluate(...)
      end
    end
  end
end
