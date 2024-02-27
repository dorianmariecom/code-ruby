# frozen_string_literal: true

class Code
  class Object
    class Global < ::Code::Object
      def self.name
        "Global"
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, [])
        output = args.fetch(:output)
        context = args.fetch(:context)
        globals = multi_fetch(args, *GLOBALS)
        value = arguments.first&.value

        case operator.to_s
        when "Boolean"
          sig(args) { Object.maybe }
          value ? value.code_to_boolean : Class.new(Boolean)
        when "Class"
          sig(args) { Object.maybe }
          value ? value.code_to_class : Class.new(Class)
        when "Date"
          sig(args) { Object.maybe }
          value ? value.code_to_date : Class.new(Date)
        when "Decimal"
          sig(args) { Object.maybe }
          value ? value.code_to_decimal : Class.new(Decimal)
        when "Dictionary"
          sig(args) { Object.maybe }
          value ? value.code_to_dictionnary : Class.new(Dictionary)
        when "fetch"
          sig(args) { [Object, Function.maybe] }
          context.code_fetch(*arguments.map(&:value), **globals)
        when "Function"
          sig(args) { Object.maybe }
          value ? value.code_to_function : Class.new(Function)
        when "Integer"
          sig(args) { Object.maybe }
          value ? value.code_to_integer : Class.new(Integer)
        when "List"
          sig(args) { Object.maybe }
          value ? value.code_to_list : Class.new(List)
        when "Nothing"
          sig(args) { Object.maybe }
          value ? value.code_to_nothing : Class.new(Nothing)
        when "Number"
          sig(args) { Object.maybe }
          value ? value.code_to_number : Class.new(Number)
        when "Object"
          sig(args) { Object.maybe }
          value ? value.code_to_object : Class.new(Object)
        when "Range"
          sig(args) { Object.maybe }
          value ? value.code_to_range : Class.new(Range)
        when "String"
          sig(args) { Object.maybe }
          value ? value.code_to_string : Class.new(String)
        when "Time"
          sig(args) { Object.maybe }
          value ? value.code_to_time : Class.new(Time)
        when "context"
          sig(args) { String.maybe }
          value ? context.code_get(value) || Nothing.new : context
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
