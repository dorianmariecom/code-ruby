# frozen_string_literal: true

class Code
  class Object
    class Parameter < Dictionary
      CLASS_DOCUMENTATION = {
        name: "Parameter",
        description: "describes one function parameter with its name, kind flags, and default value.",
        examples: [
          "((name) => { name }).parameters.first",
          "((name:) => { name }).parameters.first.keyword?",
          "((name = :a) => { name }).parameters.first.default"
        ]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "name" => {
          name: "name",
          description: "returns the parameter identifier name.",
          examples: [
            "((name) => { name }).parameters.first.name",
            "((name = :a) => { name }).parameters.first.name",
            "((...values) => { values }).parameters.first.name"
          ]
        },
        "regular?" => {
          name: "regular?",
          description: "returns whether the parameter is not a keyword parameter.",
          examples: [
            "((name) => { name }).parameters.first.regular?",
            "((name:) => { name }).parameters.first.regular?",
            "((...values) => { values }).parameters.first.regular?"
          ]
        },
        "keyword?" => {
          name: "keyword?",
          description: "returns whether the parameter is a named keyword parameter.",
          examples: [
            "((name:) => { name }).parameters.first.keyword?",
            "((name) => { name }).parameters.first.keyword?",
            "((**options) => { options }).parameters.first.keyword?"
          ]
        },
        "regular_splat?" => {
          name: "regular_splat?",
          description: "returns whether the parameter captures positional arguments with *.",
          examples: [
            "((...values) => { values }).parameters.first.regular_splat?",
            "((*values) => { values }).parameters.first.regular_splat?",
            "((name) => { name }).parameters.first.regular_splat?"
          ]
        },
        "keyword_splat?" => {
          name: "keyword_splat?",
          description: "returns whether the parameter captures keyword arguments with **.",
          examples: [
            "((**options) => { options }).parameters.first.keyword_splat?",
            "((name:) => { name }).parameters.first.keyword_splat?",
            "((name) => { name }).parameters.first.keyword_splat?"
          ]
        },
        "block?" => {
          name: "block?",
          description: "returns whether the parameter captures one function argument with &.",
          examples: [
            "((&block) => { block }).parameters.first.block?",
            "((name) => { name }).parameters.first.block?",
            "((&&blocks) => { blocks }).parameters.first.block?"
          ]
        },
        "blocks?" => {
          name: "blocks?",
          description: "returns whether the parameter captures remaining function arguments with &&.",
          examples: [
            "((&&blocks) => { blocks }).parameters.first.blocks?",
            "((&block) => { block }).parameters.first.blocks?",
            "((name) => { name }).parameters.first.blocks?"
          ]
        },
        "spread?" => {
          name: "spread?",
          description: "returns whether the parameter captures every provided argument with spread syntax.",
          examples: [
            "((...values) => { values }).parameters.first.spread?",
            "((name) => { name }).parameters.first.spread?",
            "((name:) => { name }).parameters.first.spread?"
          ]
        },
        "required?" => {
          name: "required?",
          description: "returns whether the parameter has no default value.",
          examples: [
            "((name) => { name }).parameters.first.required?",
            "((name = :a) => { name }).parameters.first.required?",
            "((name:) => { name }).parameters.first.required?"
          ]
        },
        "optional?" => {
          name: "optional?",
          description: "returns whether the parameter has a default value.",
          examples: [
            "((name = :a) => { name }).parameters.first.optional?",
            "((name) => { name }).parameters.first.optional?",
            "((name: :a) => { name }).parameters.first.optional?"
          ]
        },
        "default" => {
          name: "default",
          description: "returns the default value for the parameter, or nothing when none is set.",
          examples: [
            "((name = :a) => { name }).parameters.first.default",
            "((name) => { name }).parameters.first.default",
            "((name: :a) => { name }).parameters.first.default"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code

        case code_operator.to_s
        when "required?"
          sig(args)
          code_required?
        when "optional?"
          sig(args)
          code_optional?
        else
          super
        end
      end

      def code_name
        String.new(code_get(:name))
      end

      def code_regular?
        Boolean.new(code_get(:regular?))
      end

      def code_keyword?
        Boolean.new(code_get(:keyword?))
      end

      def code_regular_splat?
        Boolean.new(code_get(:regular_splat?))
      end

      def code_keyword_splat?
        Boolean.new(code_get(:keyword_splat?))
      end

      def code_block?
        Boolean.new(code_get(:block?))
      end

      def code_blocks?
        Boolean.new(code_get(:blocks?))
      end

      def code_spread?
        Boolean.new(code_get(:spread?))
      end

      def code_required?
        code_default.code_falsy?
      end

      def code_optional?
        code_default.code_truthy?
      end

      def code_default
        code_get(:default).to_code
      end

      def required?
        code_required?.truthy?
      end

      def optional?
        code_optional?.truthy?
      end

      def regular?
        code_regular?.truthy?
      end

      def keyword?
        code_keyword?.truthy?
      end

      def regular_splat?
        code_regular_splat?.truthy?
      end

      def keyword_splat?
        code_keyword_splat?.truthy?
      end

      def spread?
        code_spread?.truthy?
      end

      def block?
        code_block?.truthy?
      end

      def blocks?
        code_blocks?.truthy?
      end
    end
  end
end
