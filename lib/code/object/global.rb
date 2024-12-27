# frozen_string_literal: true

class Code
  class Object
    class Global < Object
      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        output = args.fetch(:output)
        code_context = args.fetch(:context).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "Boolean"
          sig(args) { Object.repeat }
          code_arguments.any? ? Boolean.new(*code_arguments.raw) : Class.new(Boolean)
        when "break"
          sig(args) { Object.repeat }
          raise Error::Break, code_value || Nothing.new
        when "next"
          sig(args) { Object.repeat }
          raise Error::Next, code_value || Nothing.new
        when "Class"
          sig(args) { Object.repeat }
          code_arguments.any? ? Class.new(*code_arguments.raw) : Class.new(Class)
        when "Date"
          sig(args) { Object.repeat }
          code_arguments.any? ? Date.new(*code_arguments.raw) : Class.new(Date)
        when "Decimal"
          sig(args) { Object.repeat }
          code_arguments.any? ? Decimal.new(*code_arguments.raw) : Class.new(Decimal)
        when "Dictionary"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Dictionary.new(*code_arguments.raw)
          else
            Class.new(Dictionary)
          end
        when "Duration"
          sig(args) { Object.repeat }
          code_arguments.any? ? Duration.new(*code_arguments.raw) : Class.new(Duration)
        when "Function"
          sig(args)
          code_arguments.any? ? Function.new(*code_arguments.raw) : Class.new(Function)
        when "Integer"
          sig(args) { Object.repeat }
          code_arguments.any? ? Integer.new(*code_arguments.raw) : Class.new(Integer)
        when "List"
          sig(args) { Object.repeat }
          code_arguments.any? ? List.new(*code_arguments.raw) : Class.new(List)
        when "Nothing"
          sig(args) { Object.repeat }
          code_arguments.any? ? Nothing.new(*code_arguments.raw) : Class.new(Nothing)
        when "context"
          sig(args)
          context
        when "Object"
          sig(args)
          code_arguments.any? ? Object.new(*code_arguments.raw) : Class.new(Object)
        when "Range"
          sig(args) { Object.repeat }
          code_arguments.any? ? Range.new(*code_arguments.raw) : Class.new(Range)
        when "String"
          sig(args) { Object.repeat }
          code_arguments.any? ? String.new(*code_arguments.raw) : Class.new(String)
        when "Time"
          sig(args) { Object.repeat }
          code_arguments.any? ? Time.zone.local(*code_arguments.raw) : Class.new(Time)
        when "Context"
          sig(args) { Object.repeat }
          code_arguments.any? ? Context.new(*code_arguments.raw) : Class.new(Context)
        when "Code"
          sig(args) { Object.repeat }
          code_arguments.any? ? Code.new(*code_arguments.raw) : Class.new(Code)
        when "Parameter"
          sig(args) { Object.repeat }
          code_arguments.any? ? Parameter.new(*code_arguments.raw) : Class.new(Parameter)
        when "IdentifierList"
          sig(args) { Object.repeat }
          if code_arguments.any?
            IdentifierList.new(*code_arguments.raw)
          else
            Class.new(IdentifierList)
          end
        when "Html"
          sig(args) { Object.repeat }
          code_arguments.any? ? Html.new(*code_arguments.raw) : Class.new(Html)
        when "Http"
          sig(args) { Object.repeat }
          code_arguments.any? ? Http.new(*code_arguments.raw) : Class.new(Http)
        when "evaluate"
          sig(args) { Object }
          Code.evaluate(code_value.to_s)
        when "p"
          sig(args) { Object.repeat }
          output.puts(*code_arguments.raw.map(&:inspect))
          Nothing.new
        when "print"
          sig(args) { Object.repeat }
          output.print(*code_arguments.raw)
          Nothing.new
        when "puts"
          sig(args) { Object.repeat }
          output.puts(*code_arguments.raw)
          Nothing.new
        else
          code_context = code_context.code_lookup!(code_operator)
          code_result = code_context.code_fetch(code_operator)

          if code_result.is_a?(Function)
            code_result.call(**args, operator: nil)
          else
            sig(args)
            code_result
          end
        end
      end
    end
  end
end
