# frozen_string_literal: true

class Code
  class Object
    class Code < Object
      def initialize(*args, **_kargs, &_block)
        @raw =
          if args.first.is_a?(Node)
            args.first
          else
            Node::Code.new(::Code.parse(args.first.to_s))
          end
      end

      def self.code_evaluate(*args, **globals)
        code_args = args.to_code

        new(*code_args.raw).code_evaluate(**globals)
      end

      def code_evaluate(...)
        raw.evaluate(...)
      end
    end
  end
end
