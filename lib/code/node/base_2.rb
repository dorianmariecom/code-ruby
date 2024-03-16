# frozen_string_literal: true

class Code
  class Node
    class Base2 < Node
      def initialize(parsed)
        return if parsed.blank?

        @base_2 = parsed.presence
      end

      def evaluate(**_args)
        @base_2 ? Object::Integer.new(@base_2.to_i(2)) : Object::Nothing.new
      end
    end
  end
end
