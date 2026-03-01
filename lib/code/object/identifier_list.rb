# frozen_string_literal: true

class Code
  class Object
    class IdentifierList < List
      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_context = args.fetch(:context).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when /=$/
          sig(args) { Object }
          assignment_operator = code_operator.to_s
          context = find_context_with_identifier(code_context, raw.first)

          if context
            assign_in_context(
              context: context,
              assignment_operator: assignment_operator,
              code_value: code_value,
              **args
            )
          else
            assign_with_setter(
              assignment_operator: assignment_operator,
              code_value: code_value,
              **args
            )
          end
        else
          super
        end
      end

      private

      def find_context_with_identifier(context, identifier)
        current = context

        while current
          return current if current.code_has_key?(identifier).truthy?

          current = current.parent
        end

        nil
      end

      def assign_in_context(context:, assignment_operator:, code_value:, **args)
        receiver =
          raw[..-2].reduce(context) do |value, code_identifier|
            value.code_fetch(code_identifier)
          end

        receiver.code_set(
          raw.last,
          if assignment_operator == "="
            code_value
          else
            receiver.code_fetch(raw.last).call(
              **args,
              operator: assignment_operator.chop,
              arguments: [code_value]
            )
          end
        )

        receiver.code_fetch(raw.last)
      end

      def assign_with_setter(assignment_operator:, code_value:, **args)
        code_object = args.fetch(:object)
        receiver =
          raw[...-1].reduce(code_object) do |value, code_identifier|
            value.call(
              **args,
              operator: code_identifier,
              arguments: Object::List.new
            )
          end

        if assignment_operator == "="
          receiver.call(
            **args,
            operator: "#{raw.last}=",
            arguments: Object::List.new([code_value])
          )
        else
          next_value = receiver.call(
            **args,
            operator: raw.last,
            arguments: Object::List.new
          ).call(
            **args,
            operator: assignment_operator.chop,
            arguments: Object::List.new([code_value])
          )

          receiver.call(
            **args,
            operator: "#{raw.last}=",
            arguments: Object::List.new([next_value])
          )
        end
      end
    end
  end
end
