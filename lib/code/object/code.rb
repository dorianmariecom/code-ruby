# frozen_string_literal: true

class Code
  class Object
    class Code < Object
      CLASS_FUNCTIONS = {
        "evaluate" => {
          name: "evaluate",
          description: "evaluates source code and returns the result.",
          examples: [
            "Code.evaluate(:1)",
            "Code.evaluate(\"1 + 2\")",
            "Code.evaluate(\"[1, 2].size\")"
          ]
        }
      }.freeze
      INSTANCE_FUNCTIONS = {
        "evaluate" => {
          name: "evaluate",
          description: "evaluates the receiver's source code and returns the result.",
          examples: [
            "Code(:1).evaluate",
            "Code(\"1 + 2\").evaluate",
            "Code(\"[1, 2].size\").evaluate"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance
        return CLASS_FUNCTIONS if scope == :class

        {}
      end

      def initialize(*args, **_kargs, &_block)
        self.raw =
          if args.first.is_a?(Node::Code)
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
