# frozen_string_literal: true

class Code
  class Object
    class Code < Object
      CLASS_DOCUMENTATION = {
        name: "Code",
        description: "stores parsed source code for later evaluation.",
        examples: [
          "Code",
          "Code.evaluate(\"1 + 2\")",
          "Code.new(\"1 + 2\").evaluate"
        ]
      }.freeze
      CLASS_FUNCTIONS = {
        "evaluate" => {
          name: "evaluate",
          description: "evaluates source code and returns the result.",
          examples: [
            "Code.evaluate(\"1\")",
            "Code.evaluate(\"1 + 2\")",
            "Code.evaluate(\"[1, 2].size\")"
          ]
        }
      }.freeze
      INSTANCE_FUNCTIONS = {
        "evaluate" => {
          name: "evaluate",
          description: "evaluates stored source code and returns the result.",
          examples: [
            "Code(\"1\").evaluate",
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

      class ScopedObject < Object
        def call(**args)
          code_operator = args.fetch(:operator, nil).to_code
          code_context = args.fetch(:context).to_code

          code_context = code_context.code_lookup!(code_operator)
          code_result = code_context.code_fetch(code_operator)

          if code_result.is_a?(Super) ||
               (
                 code_result.is_a?(Function) &&
                   args.fetch(:explicit_arguments, false)
               )
            code_result.call(**args, operator: nil)
          else
            sig(args)
            code_result
          end
        end
      end

      attr_reader :trusted

      def initialize(*args, **_kargs, &_block)
        @trusted = args.first.is_a?(Node::Code)
        self.raw =
          (trusted ? args.first : Node::Code.new(::Code.parse(args.first.to_s)))
      end

      def self.code_evaluate(*args, **globals)
        code_args = args.to_code

        new(*code_args.raw).code_evaluate(**globals)
      end

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        globals = multi_fetch(args, *GLOBALS)

        case code_operator.to_s
        when "evaluate"
          sig(args) { Object }
          code_evaluate(*args.fetch(:arguments, []).to_code.raw, **globals)
        else
          super
        end
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        globals = multi_fetch(args, *GLOBALS)

        case code_operator.to_s
        when "evaluate"
          sig(args)
          code_evaluate(**globals)
        else
          super
        end
      end

      def code_evaluate(trusted_evaluation: false, **globals)
        raw.evaluate(
          **evaluation_globals(globals, trusted_evaluation: trusted_evaluation)
        )
      end

      def code_deep_duplicate(_seen = {})
        self.class.new(raw)
      end

      private

      def evaluation_globals(globals, trusted_evaluation:)
        return globals if trusted && trusted_evaluation

        object = ScopedObject.new

        globals.merge(context: Context.new, object: object, root_object: object)
      end
    end
  end
end
