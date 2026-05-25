# frozen_string_literal: true

class Code
  class Object
    class Nothing < Object
      INSTANCE_FUNCTIONS = {
        "empty?" => {
          name: "empty?",
          description: "returns true because nothing is empty.",
          examples: ["nothing.empty?", "Nothing.new.empty?", "nil.to_code.empty?"]
        },
        "to_string" => {
          name: "to_string",
          description: "returns an empty string.",
          examples: ["nothing.to_string", "Nothing.new.to_string", "nil.to_code.to_string"]
        },
        "inspect" => {
          name: "inspect",
          description: "returns the string nothing.",
          examples: ["nothing.inspect", "Nothing.new.inspect", "nil.to_code.inspect"]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      def initialize(*_args, **_kargs, &_block)
        self.raw = nil
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code

        case code_operator.to_s
        when "empty?"
          sig(args)
          code_empty?
        else
          super
        end
      end

      def truthy?
        false
      end

      def present?
        false
      end

      def nothing?
        true
      end

      def code_empty?
        Boolean.new(true)
      end

      def code_to_string
        String.new
      end

      def code_inspect
        String.new("nothing")
      end
    end
  end
end
