# frozen_string_literal: true

class Code
  class Node
    class Nothing < Node
      def initialize(nothing)
        @nothing = nothing
      end

      def evaluate(**_args)
        ::Code::Object::Nothing.new
      end
    end
  end
end
