# frozen_string_literal: true

class Code
  class Type
    class Or < Type
      attr_reader :left, :right

      def initialize(left, right)
        @left = left
        @right = right
      end

      def valid?(argument)
        valid_for?(expected: left, actual: argument) ||
          valid_for?(expected: right, actual: argument)
      end

      def min_arguments
        [min_arguments_of(left), min_arguments_of(right)].min
      end

      def max_arguments
        left_max_arguments = max_arguments_of(left)
        right_max_arguments = max_arguments_of(right)

        if left_max_arguments.nil? || right_max_arguments.nil?
          nil
        else
          [left_max_arguments, right_max_arguments].max
        end
      end

      def name
        "(#{left.name} | #{right.name})"
      end
    end
  end
end
