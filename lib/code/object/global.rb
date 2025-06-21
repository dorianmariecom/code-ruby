# frozen_string_literal: true

class Code
  class Object
    class Global < Object
      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        output = args.fetch(:output)
        input = args.fetch(:input)
        code_context = args.fetch(:context).to_code
        code_value = code_arguments.code_first
        globals = multi_fetch(args, *GLOBALS)

        case code_operator.to_s
        when "Boolean"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Boolean.new(*code_arguments.raw)
          else
            Class.new(Boolean)
          end
        when "break"
          sig(args) { Object.repeat }
          raise Error::Break, code_value || Nothing.new
        when "next"
          sig(args) { Object.repeat }
          raise Error::Next, code_value || Nothing.new
        when "Class"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Class.new(*code_arguments.raw)
          else
            Class.new(Class)
          end
        when "Date"
          sig(args) { Object.repeat }
          code_arguments.any? ? Date.new(*code_arguments.raw) : Class.new(Date)
        when "Decimal"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Decimal.new(*code_arguments.raw)
          else
            Class.new(Decimal)
          end
        when "Dictionary"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Dictionary.new(*code_arguments.raw)
          else
            Class.new(Dictionary)
          end
        when "Duration"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Duration.new(*code_arguments.raw)
          else
            Class.new(Duration)
          end
        when "Function"
          sig(args)
          if code_arguments.any?
            Function.new(*code_arguments.raw)
          else
            Class.new(Function)
          end
        when "Integer"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Integer.new(*code_arguments.raw)
          else
            Class.new(Integer)
          end
        when "List"
          sig(args) { Object.repeat }
          code_arguments.any? ? List.new(*code_arguments.raw) : Class.new(List)
        when "Nothing"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Nothing.new(*code_arguments.raw)
          else
            Class.new(Nothing)
          end
        when "context"
          sig(args)
          code_context
        when "Object"
          sig(args)
          if code_arguments.any?
            Object.new(*code_arguments.raw)
          else
            Class.new(Object)
          end
        when "Range"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Range.new(*code_arguments.raw)
          else
            Class.new(Range)
          end
        when "String"
          sig(args) { Object.repeat }
          if code_arguments.any?
            String.new(*code_arguments.raw)
          else
            Class.new(String)
          end
        when "Time"
          sig(args) { Object.repeat }
          code_arguments.any? ? Time.new(*code_arguments.raw) : Class.new(Time)
        when "Context"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Context.new(*code_arguments.raw)
          else
            Class.new(Context)
          end
        when "Code"
          sig(args) { Object.repeat }
          code_arguments.any? ? Code.new(*code_arguments.raw) : Class.new(Code)
        when "Parameter"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Parameter.new(*code_arguments.raw)
          else
            Class.new(Parameter)
          end
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
        when "Smtp"
          sig(args) { Object.repeat }
          code_arguments.any? ? Smtp.new(*code_arguments.raw) : Class.new(Smtp)
        when "Base64"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Base64.new(*code_arguments.raw)
          else
            Class.new(Base64)
          end
        when "Json"
          sig(args) { Object.repeat }
          code_arguments.any? ? Json.new(*code_arguments.raw) : Class.new(Json)
        when "evaluate"
          sig(args) { Object }
          Code.code_evaluate(code_value.code_to_string, **globals)
        when "p"
          sig(args) { Object.repeat }
          output.puts(*code_arguments.raw.map(&:inspect))
          Nothing.new
        when "print"
          sig(args) { Object.repeat }
          output.print(*code_arguments.raw)
          Nothing.new
        when "read"
          sig(args) { Object.repeat }
          input.gets.to_code
        when "puts"
          sig(args) { Object.repeat }
          output.puts(*code_arguments.raw)
          Nothing.new
        when "Number"
          sig(args) { Object.repeat }
          if code_arguments.any?
            Number.new(*code_arguments.raw)
          else
            Class.new(Number)
          end
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
