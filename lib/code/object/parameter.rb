# frozen_string_literal: true

class Code
  class Object
    class Parameter < Object
      def initialize(*args, **_kargs, &_block)
        @raw = Dictionary.new(args.first)
      end

      def code_name
        String.new(raw.code_get(:name))
      end

      def code_regular?
        Boolean.new(raw.code_get(:regular?))
      end

      def code_keyword?
        Boolean.new(raw.code_get(:keyword?))
      end

      def code_regular_splat?
        Boolean.new(raw.code_get(:regular_splat?))
      end

      def code_keyword_splat?
        Boolean.new(raw.code_get(:keyword_splat?))
      end

      def code_default
        Code.new(raw.code_get(:default))
      end

      def code_evaluate(...)
        code_default.code_evaluate(...)
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
    end
  end
end
