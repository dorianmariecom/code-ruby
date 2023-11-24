# frozen_string_literal: true

class Code
  class Node
    class Base2 < Node
      def initialize(parsed)
        @base_2 = parsed
      end

      def evaluate(**_args)
        ::Code::Object::Integer.new(@base_2.to_i(2))
      end
    end
  end
end
