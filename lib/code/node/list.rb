# frozen_string_literal: true

class Code
  class Node
    class List < Node
      def initialize(parsed)
        return if parsed.blank?

        @elements =
          (parsed.presence || []).map { |element| Node::Code.new(element) }
      end

      def evaluate(**args)
        list =
          ::Code::Object::List.new(
            (@elements || []).map { |element| element.evaluate(**args) }
          )
        constructor = literal_constructor(args.fetch(:context), "List")
        return list unless constructor
        if Array(args[:constructing_literal_classes]).include?(
             ::Code::Object::List
           )
          return list
        end

        constructor.call(
          **args,
          constructing_literal_classes:
            Array(args[:constructing_literal_classes]) + [::Code::Object::List],
          operator: nil,
          arguments: ::Code::Object::List.new([list]),
          explicit_arguments: true
        )
      end

      private

      def literal_constructor(context, name)
        return unless context.code_has_key?(name).truthy?

        constructor = context.code_fetch(name)
        return unless constructor.is_a?(::Code::Object::Function)
        return unless constructor.parent.is_a?(::Code::Object::Class)
        return unless constructor.parent.raw == ::Code::Object::List

        constructor
      end
    end
  end
end
