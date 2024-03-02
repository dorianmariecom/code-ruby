# frozen_string_literal: true

class Code
  class Node
    class Base8 < Node
      def initialize(parsed)
        return if parsed.blank?
        @base_8 = parsed.presence
      end

      def evaluate(**_args)
        if @base_8
          Object::Integer.new(@base_8.to_i(8))
        else
          Object::Nothing.new
        end
      end
    end
  end
end
