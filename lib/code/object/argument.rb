# frozen_string_literal: true

class Code
  class Object
    class Argument < Object
      attr_reader :value, :name

      def initialize(*args, **_kargs, &_block)
        @value = args.first.presence || Nothing.new
        @name = args.second.present? ? String.new(args.second) : nil
        @raw = List.new([@value, @name])
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
