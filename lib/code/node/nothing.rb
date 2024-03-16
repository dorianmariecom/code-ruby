# frozen_string_literal: true

class Code
  class Node
    class Nothing < Node
      def initialize(parsed)
        return if parsed.blank?

        @nothing = parsed.presence
      end

      def evaluate(**_args)
        Object::Nothing.new
      end
    end
  end
end
