# frozen_string_literal: true

class Code
  class Object
    class Argument < Object
      attr_reader :value, :name

      def initialize(value, name: nil)
        @value = value
        @name = name
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
    end
  end
end
