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
        args[:arguments]&.raw || []
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

      def actual_count
        if actual_arguments.one?
          "1 argument"
        else
          "#{actual_arguments.size} arguments"
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

      def check_number_of_arguments!
        return if expected_range.include?(actual_arguments.size)

        raise(
          Error::ArityError,
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
            if valid_for?(expected:, actual:)
              repeat_index += 1
            elsif repeat_index >= expected.min_arguments
              expected_index += 1
              repeat_index = 0
            else
              raise(
                Error::TypeError,
                "#{function}: expected #{expected.name}, got #{actual.inspect}"
              )
            end
          elsif valid_for?(expected:, actual:)
            expected_index += 1
            repeat_index = 0
          else
            raise(
              Error::TypeError,
              "#{function}: expected #{expected.name}, got #{actual.inspect}"
            )
          end
        end

        nil
      end
    end
  end
end
