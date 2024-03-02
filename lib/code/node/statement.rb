# frozen_string_literal: true

class Code
  class Node
    class Statement < Node
      def initialize(parsed)
        return if parsed.blank?

        if parsed.key?(:nothing)
          @statement = Node::Nothing.new(parsed.delete(:nothing))
        elsif parsed.key?(:boolean)
          @statement = Node::Boolean.new(parsed.delete(:boolean))
        elsif parsed.key?(:group)
          @statement = Node::Code.new(parsed.delete(:group))
        elsif parsed.key?(:call)
          @statement = Node::Call.new(parsed.delete(:call))
        elsif parsed.key?(:number)
          @statement = Node::Number.new(parsed.delete(:number))
        elsif parsed.key?(:string)
          @statement = Node::String.new(parsed.delete(:string))
        elsif parsed.key?(:list)
          @statement = Node::List.new(parsed.delete(:list))
        elsif parsed.key?(:dictionnary)
          @statement = Node::Dictionary.new(parsed.delete(:dictionnary))
        elsif parsed.key?(:chained_call)
          @statement = Node::ChainedCall.new(parsed.delete(:chained_call))
        elsif parsed.key?(:left_operation)
          @statement = Node::LeftOperation.new(parsed.delete(:left_operation))
        elsif parsed.key?(:right_operation)
          @statement = Node::RightOperation.new(parsed.delete(:right_operation))
        elsif parsed.key?(:function)
          @statement = Node::Function.new(parsed.delete(:function))
        elsif parsed.key?(:negation)
          @statement = Node::Negation.new(parsed.delete(:negation))
        elsif parsed.key?(:power)
          @statement = Node::Power.new(parsed.delete(:power))
        elsif parsed.key?(:unary_minus)
          @statement = Node::UnaryMinus.new(parsed.delete(:unary_minus))
        elsif parsed.key?(:ternary)
          @statement = Node::Ternary.new(parsed.delete(:ternary))
        elsif parsed.key?(:rescue)
          @statement = Node::Rescue.new(parsed.delete(:rescue))
        elsif parsed.key?(:not)
          @statement = Node::Not.new(parsed.delete(:not))
        elsif parsed.key?(:if_modifier)
          @statement = Node::IfModifier.new(parsed.delete(:if_modifier))
        elsif parsed.key?(:if)
          @statement = Node::If.new(parsed.delete(:if))
        elsif parsed.key?(:while)
          @statement = Node::While.new(parsed.delete(:while))
        elsif parsed.key?(:splat)
          @statement = Node::Splat.new(parsed.delete(:splat))
        elsif parsed.key?(:square_bracket)
          @statement = Node::SquareBracket.new(parsed.delete(:square_bracket))
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
