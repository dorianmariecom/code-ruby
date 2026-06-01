# frozen_string_literal: true

class Code
  class Object
    class Super < Function
      CLASS_DOCUMENTATION = {
        name: "Super",
        description:
          "calls the captured parent function available inside an extended function.",
        examples: [
          "Base = () => { self.name = :base self } Child = Base.extend(() => { super() }) Child().name",
          "Base = (name) => { self.name = name self } Child = Base.extend((...) => { super(...) }) Child(:ada).name",
          "Base = () => { 1 } Child = Base.extend(() => { super() + 1 }) Child()"
        ]
      }.freeze
      def initialize(
        parent,
        forwarded_arguments,
        code_self,
        definition_context,
        explicit_arguments: false
      )
        _explicit_arguments = explicit_arguments
        @parent = parent.to_code
        @forwarded_arguments = forwarded_arguments.to_code
        @code_self = code_self.to_code
        @definition_context = definition_context
        self.functions = Dictionary.new
        self.raw = @parent.raw
      end

      def call(**args)
        code_arguments = args.fetch(:arguments, List.new).to_code
        explicit_arguments = args.fetch(:explicit_arguments, false)

        @parent.code_call(
          *arguments_for(code_arguments, explicit_arguments).raw,
          explicit_arguments: explicit_arguments,
          bound_self: @code_self,
          **multi_fetch(args, *GLOBALS).merge(context: parent_context)
        )
      end

      private

      def parent_context
        context = Context.new({}, @definition_context)
        context.code_set("self", @code_self)
        context
      end

      def arguments_for(code_arguments, explicit_arguments)
        if explicit_arguments && code_arguments.raw.empty?
          List.new
        elsif code_arguments.any?
          code_arguments
        else
          @forwarded_arguments
        end
      end
    end
  end
end
