# frozen_string_literal: true

class Code
  class Object
    class IdentifierList < List
      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, List.new)
        context = args.fetch(:context)
        value = arguments.code_first

        case operator.to_s
        when /=$/
          sig(args) { Object }

          context = context.lookup!(raw.first)

          context =
            raw[..-2].reduce(context) do |context, identifier|
              context.code_fetch(identifier)
            end

          context.code_set(
            raw.last,
            if operator == "="
              value
            else
              context.fetch(raw.last).call(
                **args,
                operator: operator.chop,
                arguments: List.new([value])
              )
            end
          )

          context.code_fetch(raw.last)
        else
          super
        end
      end
    end
  end
end
