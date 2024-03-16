# frozen_string_literal: true

class Code
  class Node
    class Base8 < Node
      def initialize(parsed)
        return if parsed.blank?

        @base_8 = parsed.presence
      end

      def evaluate(**_args)
        @base_8 ? Object::Integer.new(@base_8.to_i(8)) : Object::Nothing.new
      end
    end
  end
end
