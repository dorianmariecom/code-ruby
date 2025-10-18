# frozen_string_literal: true

class Code
  class Type
    class Sig
      def initialize(args, object:, &block)
        @args = args
        @block = block
        @object = object
      end

      def self.sig(...)
        new(...).sig
        nil
      end

      def sig
        check_number_of_arguments!
        check_types_of_arguments!
        nil
      end

      private

      attr_reader :args, :block, :object

      def expected_arguments
        @expected_arguments ||=
          wrap(block&.call || []).map do |clazz|
            clazz.is_a?(::Hash) ? Hash.new(clazz) : clazz
          end
      end

      def min_arguments_of(clazz)
        clazz.is_a?(Type) ? clazz.min_arguments : 1
      end

      def max_arguments_of(clazz)
        clazz.is_a?(Type) ? clazz.max_arguments : 1
      end

      def actual_arguments
        args[:arguments].to_code.raw || []
      end

      def operator
        args.fetch(:operator, nil) || "call"
      end

      def function
        "#{object.class.name}##{operator}"
      end

      def min_arguments
        expected_arguments.sum { |clazz| min_arguments_of(clazz) }
      end

      def max_arguments
        max_arguments =
          expected_arguments.map { |clazz| max_arguments_of(clazz) }
        max_arguments.include?(nil) ? nil : max_arguments.sum
      end

      def min_actual_arguments
        actual_arguments.size
      end

      def max_actual_arguments
        actual_arguments.sum do |argument|
          if argument.is_an?(Object::Dictionary)
            [1, argument.code_size.raw].max
          else
            1
          end
        end
      end

      def actual_count
        if min_actual_arguments == max_actual_arguments
          if min_actual_arguments == 1
            "1 actual argument"
          else
            "#{min_actual_arguments} actual arguments"
          end
        elsif max_actual_arguments.nil?
          "#{min_actual_arguments}+ actual arguments"
        else
          "#{min_actual_arguments}-#{max_actual_arguments} actual arguments"
        end
      end

      def expected_count
        if min_arguments == max_arguments
          if min_arguments == 1
            "1 argument"
          else
            "#{min_arguments} arguments"
          end
        elsif max_arguments.nil?
          "#{min_arguments}+ arguments"
        else
          "#{min_arguments}-#{max_arguments} arguments"
        end
      end

      def expected_range
        max_arguments.nil? ? min_arguments.. : min_arguments..max_arguments
      end

      def actual_range
        min_actual_arguments..max_actual_arguments
      end

      def check_number_of_arguments!
        return if expected_range.overlaps?(actual_range)

        raise(
          Error,
          "#{function}: Expected #{expected_count} but got #{actual_count}"
        )
      end

      def valid_for?(expected:, actual:)
        expected.is_a?(Type) ? expected.valid?(actual) : actual.is_a?(expected)
      end

      def wrap(object)
        object.is_a?(Array) ? object : [object]
      end

      def check_types_of_arguments!
        expected_index = 0
        repeat_index = 0

        actual_arguments.each do |actual|
          expected = expected_arguments[expected_index]
          if expected.is_a?(Repeat)
            if valid_for?(expected: expected, actual: actual)
              repeat_index += 1
            elsif repeat_index >= expected.min_arguments
              expected_index += 1
              repeat_index = 0
            else
              raise(
                Error,
                "#{function}: expected #{expected.name}, got #{actual.inspect}"
              )
            end
          elsif valid_for?(expected: expected, actual: actual)
            expected_index += 1
            repeat_index = 0
          else
            raise(
              Error,
              "#{function}: expected #{expected.name}, got #{actual.inspect}"
            )
          end
        end

        nil
      end
    end
  end
end
