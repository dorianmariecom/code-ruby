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

          code_context = code_context.code_lookup!(raw.first)

          code_context =
            raw[..-2].reduce(code_context) do |code_context, code_identifier|
              code_context.code_fetch(code_identifier)
            end

          code_context.code_set(
            raw.last,
            if code_operator.to_s == "="
              code_value
            else
              code_context.fetch(raw.last).call(
                **args,
                operator: code_operator.to_s.chop,
                arguments: [code_value]
              )
            end
          )

          code_context.code_fetch(raw.last)
        else
          super
        end
      end
    end
  end
end
