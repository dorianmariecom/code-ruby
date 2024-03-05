# frozen_string_literal: true

class Code
  class Object
    class Parameter < Object
      attr_reader :name, :keyword, :regular_splat, :keyword_splat, :default

      def self.name
        "Parameter"
      end

      def initialize(*args, **_kargs, &_block)
        @raw = Dictionary.new(args.first.presence || {})
        @name = String.new(@raw.code_get(String.new(:name)))
        @keyword = Boolean.new(@raw.code_get(String.new(:keyword)))
        @regular_splat = Boolean.new(@raw.code_get(String.new(:regular_splat)))
        @keyword_splat = Boolean.new(@raw.code_get(String.new(:keyword_splat)))
        @default = Code.new(@raw.code_get(String.new(:default)))
        super
      end

      def evaluate(...)
        default.evaluate(...)
      end

      def regular?
        !keyword?
      end

      def keyword?
        keyword.truthy?
      end

      def regular_splat?
        regular_splat.truthy?
      end

      def keyword_splat?
        keyword_splat.truthy?
      end
    end
  end
end
