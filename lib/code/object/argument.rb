# frozen_string_literal: true

class Code
  class Object
    class Argument < Object
      attr_reader :value, :name

      def initialize(value, name: nil)
        @value = value
        @name = name
      end

      def self.name
        "Argument"
      end

      def inspect
        to_s
      end

      def keyword?
        !regular?
      end

      def name_value
        [name, value]
      end

      def regular?
        !name
      end

      def to_s
        "<Argument #{value.inspect}>"
      end
    end
  end
end
