# frozen_string_literal: true

class Code
  class Object
    class Global < Object
      def initialize(...)
        super
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, [])
        output = args.fetch(:output)
        context = args.fetch(:context)
        globals = multi_fetch(args, *GLOBALS)
        value = arguments.first&.value
        values = arguments.map(&:value)

        case operator.to_s
        when "Boolean"
          sig(args) { Object.repeat }
          value ? Boolean.new(*values) : Class.new(Boolean)
        when "break"
          sig(args) { Object.repeat }
          raise Error::Break, value || Nothing.new
        when "next"
          sig(args) { Object.repeat }
          raise Error::Next, value || Nothing.new
        when "Class"
          sig(args) { Object.repeat }
          value ? Class.new(*values) : Class.new(Class)
        when "Date"
          sig(args) { Object.repeat }
          value ? Date.new(*values) : Class.new(Date)
        when "Decimal"
          sig(args) { Object.repeat }
          value ? Decimal.new(*values) : Class.new(Decimal)
        when "Dictionary"
          sig(args) { Object.repeat }
          value ? Dictionary.new(*values) : Class.new(Dictionary)
        when "Duration"
          sig(args) { Object.repeat }
          value ? Duration.new(*values) : Class.new(Duration)
        when "Function"
          sig(args)
          value ? Function.new(*values) : Class.new(Function)
        when "Integer"
          sig(args) { Object.repeat }
          value ? Integer.new(*values) : Class.new(Integer)
        when "List"
          sig(args) { Object.repeat }
          value ? List.new(*values) : Class.new(List)
        when "Nothing"
          sig(args) { Object.repeat }
          value ? Nothing.new(*values) : Class.new(Nothing)
        when "context"
          sig(args)
          context
        when "Object"
          sig(args)
          value ? Object.new(*values) : Class.new(Object)
        when "Range"
          sig(args) { Object.repeat }
          value ? Range.new(*values) : Class.new(Range)
        when "String"
          sig(args) { Object.repeat }
          value ? String.new(*values) : Class.new(String)
        when "Time"
          sig(args) { Object.repeat }
          value ? Time.new(*values) : Class.new(Time)
        when "Context"
          sig(args) { Object.repeat }
          value ? Context.new(*values) : Class.new(Context)
        when "Code"
          sig(args) { Object.repeat }
          value ? Code.new(*values) : Class.new(Code)
        when "Argument"
          sig(args) { Object.repeat }
          value ? Argument.new(*values) : Class.new(Argument)
        when "Parameter"
          sig(args) { Object.repeat }
          value ? Parameter.new(*values) : Class.new(Parameter)
        when "Range"
          sig(args) { Object.repeat }
          value ? Range.new(*values) : Class.new(Range)
        when "IdentifierList"
          sig(args) { Object.repeat }
          value ? IdentifierList.new(*values) : Class.new(IdentifierList)
        when "evaluate"
          sig(args) { Object }
          Code.evaluate(value.to_s)
        when "p"
          sig(args) { Object.repeat }
          output.puts(*arguments.map(&:value).map(&:inspect))
          Nothing.new
        when "print"
          sig(args) { Object.repeat }
          output.print(*arguments.map(&:value))
          Nothing.new
        when "puts"
          sig(args) { Object.repeat }
          output.puts(*arguments.map(&:value))
          Nothing.new
        else
          context = context.lookup!(operator)
          result = context.code_fetch(operator)

          if result.is_a?(Function)
            result.call(**args.merge(operator: nil))
          else
            sig(args)
            result
          end
        end
      end
    end
  end
end
