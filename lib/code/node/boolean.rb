# frozen_string_literal: true

class Code
  class Node
    class Boolean < Node
      TRUE_KEYWORD = "true"
      FALSE_KEYWORD = "false"

      def initialize(parsed)
        @boolean = parsed
      end

      def evaluate(**_args)
        if @boolean == TRUE_KEYWORD
          ::Code::Object::Boolean.new(true)
        elsif @boolean == FALSE_KEYWORD
          ::Code::Object::Boolean.new(false)
        else
          raise NotImplementedError, @boolean
        end
      end
    end
  end
end
