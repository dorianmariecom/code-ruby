# frozen_string_literal: true

class Code
  class Object
    class Global < Object
      def initialize(...)
        @raw = "global"
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, List.new)
        output = args.fetch(:output)
        context = args.fetch(:context)
        multi_fetch(args, *GLOBALS)
        value = arguments.code_first

        case operator.to_s
        when "Boolean"
          sig(args) { Object.repeat }
          arguments.any? ? Boolean.new(*arguments.raw) : Class.new(Boolean)
        when "break"
          sig(args) { Object.repeat }
          raise Error::Break, value || Nothing.new
        when "next"
          sig(args) { Object.repeat }
          raise Error::Next, value || Nothing.new
        when "Class"
          sig(args) { Object.repeat }
          arguments.any? ? Class.new(*arguments.raw) : Class.new(Class)
        when "Date"
          sig(args) { Object.repeat }
          arguments.any? ? Date.new(*arguments.raw) : Class.new(Date)
        when "Decimal"
          sig(args) { Object.repeat }
          arguments.any? ? Decimal.new(*arguments.raw) : Class.new(Decimal)
        when "Dictionary"
          sig(args) { Object.repeat }
          if arguments.any?
            Dictionary.new(*arguments.raw)
          else
            Class.new(Dictionary)
          end
        when "Duration"
          sig(args) { Object.repeat }
          arguments.any? ? Duration.new(*arguments.raw) : Class.new(Duration)
        when "Function"
          sig(args)
          arguments.any? ? Function.new(*arguments.raw) : Class.new(Function)
        when "Integer"
          sig(args) { Object.repeat }
          arguments.any? ? Integer.new(*arguments.raw) : Class.new(Integer)
        when "List"
          sig(args) { Object.repeat }
          arguments.any? ? List.new(*arguments.raw) : Class.new(List)
        when "Nothing"
          sig(args) { Object.repeat }
          arguments.any? ? Nothing.new(*arguments.raw) : Class.new(Nothing)
        when "context"
          sig(args)
          context
        when "Object"
          sig(args)
          arguments.any? ? Object.new(*arguments.raw) : Class.new(Object)
        when "Range"
          sig(args) { Object.repeat }
          arguments.any? ? Range.new(*arguments.raw) : Class.new(Range)
        when "String"
          sig(args) { Object.repeat }
          arguments.any? ? String.new(*arguments.raw) : Class.new(String)
        when "Time"
          sig(args) { Object.repeat }
          arguments.any? ? Time.new(*arguments.raw) : Class.new(Time)
        when "Context"
          sig(args) { Object.repeat }
          arguments.any? ? Context.new(*arguments.raw) : Class.new(Context)
        when "Code"
          sig(args) { Object.repeat }
          arguments.any? ? Code.new(*arguments.raw) : Class.new(Code)
        when "Parameter"
          sig(args) { Object.repeat }
          arguments.any? ? Parameter.new(*arguments.raw) : Class.new(Parameter)
        when "IdentifierList"
          sig(args) { Object.repeat }
          if arguments.any?
            IdentifierList.new(*arguments.raw)
          else
            Class.new(IdentifierList)
          end
        when "evaluate"
          sig(args) { Object }
          Code.evaluate(value.to_s)
        when "p"
          sig(args) { Object.repeat }
          output.puts(*arguments.raw.map(&:inspect))
          Nothing.new
        when "print"
          sig(args) { Object.repeat }
          output.print(*arguments.raw)
          Nothing.new
        when "puts"
          sig(args) { Object.repeat }
          output.puts(*arguments.raw)
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
