# frozen_string_literal: true

class Code
  class Node
    class Base2 < Node
      def initialize(parsed)
        return if parsed.blank?
        @base_2 = parsed.presence
      end

      def evaluate(**_args)
        if @base_2
          Object::Integer.new(@base_2.to_i(2))
        else
          Object::Nothing.new
        end
      end
    end
  end
end
