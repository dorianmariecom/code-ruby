# frozen_string_literal: true

class Code
  class Type
    class Repeat < Type
      attr_reader :clazz, :minimum, :maximum

      def initialize(clazz, minimum: 0, maximum: nil)
        @clazz = clazz
        @minimum = minimum
        @maximum = maximum
      end

      def valid?(argument)
        valid_for?(expected: clazz, actual: argument)
      end

      def min_arguments
        minimum * min_arguments_of(clazz)
      end

      def max_arguments
        max_arguments = max_arguments_of(clazz)
        (max_arguments.nil? || maximum.nil?) ? nil : maximum * max_arguments
      end

      def name
        if minimum.zero? && maximum.nil?
          "#{clazz.name}.repeat"
        elsif maximum.nil?
          "#{clazz.name}.repeat(#{minimum})"
        else
          "#{clazz.name}.repeaa(#{minimum}, #{maximum})"
        end
      end
    end
  end
end
