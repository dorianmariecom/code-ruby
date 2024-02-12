# frozen_string_literal: true

class Code
  class Type
    class Maybe < Type
      attr_reader :clazz

      def initialize(clazz)
        @clazz = clazz
      end

      def valid?(argument)
        !argument || argument.is_a?(Object::Nothing) ||
          valid_for?(expected: clazz, actual: argument)
      end

      def min_arguments
        0
      end

      def max_arguments
        max_arguments_of(clazz)
      end

      def name
        "#{clazz.name}.maybe"
      end
    end
  end
end
