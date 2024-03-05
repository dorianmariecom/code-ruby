# frozen_string_literal: true

class Code
  class Node
    class Statement < Node
      def initialize(parsed)
        return if parsed.blank?

        if parsed.key?(:nothing)
          @statement = Nothing.new(parsed.delete(:nothing))
        elsif parsed.key?(:boolean)
          @statement = Boolean.new(parsed.delete(:boolean))
        elsif parsed.key?(:group)
          @statement = Code.new(parsed.delete(:group))
        elsif parsed.key?(:call)
          @statement = Call.new(parsed.delete(:call))
        elsif parsed.key?(:number)
          @statement = Number.new(parsed.delete(:number))
        elsif parsed.key?(:string)
          @statement = String.new(parsed.delete(:string))
        elsif parsed.key?(:list)
          @statement = List.new(parsed.delete(:list))
        elsif parsed.key?(:dictionnary)
          @statement = Dictionary.new(parsed.delete(:dictionnary))
        elsif parsed.key?(:chained_call)
          @statement = ChainedCall.new(parsed.delete(:chained_call))
        elsif parsed.key?(:left_operation)
          @statement = LeftOperation.new(parsed.delete(:left_operation))
        elsif parsed.key?(:right_operation)
          @statement = RightOperation.new(parsed.delete(:right_operation))
        elsif parsed.key?(:function)
          @statement = Function.new(parsed.delete(:function))
        elsif parsed.key?(:negation)
          @statement = Negation.new(parsed.delete(:negation))
        elsif parsed.key?(:power)
          @statement = Power.new(parsed.delete(:power))
        elsif parsed.key?(:unary_minus)
          @statement = UnaryMinus.new(parsed.delete(:unary_minus))
        elsif parsed.key?(:ternary)
          @statement = Ternary.new(parsed.delete(:ternary))
        elsif parsed.key?(:rescue)
          @statement = Rescue.new(parsed.delete(:rescue))
        elsif parsed.key?(:not)
          @statement = Not.new(parsed.delete(:not))
        elsif parsed.key?(:if_modifier)
          @statement = IfModifier.new(parsed.delete(:if_modifier))
        elsif parsed.key?(:if)
          @statement = If.new(parsed.delete(:if))
        elsif parsed.key?(:while)
          @statement = While.new(parsed.delete(:while))
        elsif parsed.key?(:splat)
          @statement = Splat.new(parsed.delete(:splat))
        elsif parsed.key?(:square_bracket)
          @statement = SquareBracket.new(parsed.delete(:square_bracket))
        end
      end

      def evaluate(**args)
        @statement&.evaluate(**args) || Object::Nothing.new
      end

      def resolve(**args)
        @statement&.resolve(**args) || Object::Nothing.new
      end
    end
  end
end
