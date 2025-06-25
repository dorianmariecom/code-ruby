# frozen_string_literal: true

class Code
  class Object
    class Parameter < Dictionary
      def code_name
        String.new(code_get(:name))
      end

      def code_regular?
        Boolean.new(code_get(:regular?))
      end

      def code_keyword?
        Boolean.new(code_get(:keyword?))
      end

      def code_regular_splat?
        Boolean.new(code_get(:regular_splat?))
      end

      def code_keyword_splat?
        Boolean.new(code_get(:keyword_splat?))
      end

      def code_block?
        Boolean.new(code_get(:block?))
      end

      def code_spread?
        Boolean.new(code_get(:spread?))
      end

      def code_required?
        code_default.code_falsy?
      end

      def code_optional?
        code_default.code_truthy?
      end

      def code_default
        code_get(:default).to_code
      end

      def code_evaluate(...)
        code_default.code_evaluate(...)
      end

      def required?
        code_required?.truthy?
      end

      def optional?
        code_optional?.truthy?
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

      def spread?
        code_spread?.truthy?
      end

      def block?
        code_block?.truthy?
      end
    end
  end
end
