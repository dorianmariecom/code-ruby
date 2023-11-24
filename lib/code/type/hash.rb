# frozen_string_literal: true

class Code
  class Type
    class Hash < Type
      attr_reader :hash

      def initialize(hash)
        @hash = hash
      end

      def valid?(argument)
        return false unless argument.is_a?(Object::Dictionary)
        argument = argument.raw
        (argument.keys + hash.keys).uniq.all? do |key|
          next false unless hash[key] && argument[key]
          valid_for?(expected: hash[key], actual: argument[key])
        end
      end

      def min_arguments
        hash.sum do |_, value|
          min_arguments_of(value)
        end
      end

      def max_arguments
        hash.sum do |_, value|
          max_arguments_of(value)
        end
      end

      def name
        "{#{hash.map { |key, value| "#{key.inspect} => #{value.name}" }.join(", ")}}"
      end
    end
  end
end
