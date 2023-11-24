# frozen_string_literal: true

class Code
  class Node
    class Base8 < Node
      def initialize(parsed)
        @base_8 = parsed
      end

      def evaluate(**_args)
        ::Code::Object::Integer.new(@base_8.to_i(8))
      end
    end
  end
end
