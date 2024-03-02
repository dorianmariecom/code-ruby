# frozen_string_literal: true

class Code
  class Node
    class Boolean < Node
      TRUE_KEYWORD = "true"
      FALSE_KEYWORD = "false"

      def initialize(parsed)
        return if parsed.blank?
        @boolean = parsed.presence
      end

      def evaluate(**_args)
        if @boolean == TRUE_KEYWORD
          Object::Boolean.new(true)
        elsif @boolean == FALSE_KEYWORD
          Object::Boolean.new(false)
        else
          Object::Nothing.new
        end
      end
    end
  end
end
