# frozen_string_literal: true

class Code
  class Object
    class Parameter < Object
      attr_reader :value, :name

      def initialize(*args, **_kargs, &_block)
        binding.irb
        @value = args.first
        @name = args.second.present? ? String.new(args.second) : nil
        super
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
