# frozen_string_literal: true

class Code
  class Object
    class Parameter < Object
      def initialize(*args, **_kargs, &_block)
        @raw = Dictionary.new(args.first.presence || {})
      end

      def code_name
        String.new(raw.code_get(String.new(:name)))
      end

      def code_regular?
        Boolean.new(raw.code_get(String.new(:regular?)))
      end

      def code_keyword?
        Boolean.new(raw.code_get(String.new(:keyword?)))
      end

      def code_keyword?
        Boolean.new(raw.code_get(String.new(:keyword?)))
      end

      def code_regular_splat?
        Boolean.new(raw.code_get(String.new(:regular_splat?)))
      end

      def code_keyword_splat?
        Boolean.new(raw.code_get(String.new(:keyword_splat?)))
      end

      def code_default
        Code.new(raw.code_get(String.new(:default)))
      end

      def evaluate(...)
        default.evaluate(...)
      end

      def regular?
        code_regular?.truthy?
      end

      def keyword?
        code_keyword?.truthy?
      end

      def regular_splat?
        code_regular_splat?.truthy?
      end

      def keyword_splat?
        code_keyword_splat?.truthy?
      end

      def to_h
        raw
      end
    end
  end
end
