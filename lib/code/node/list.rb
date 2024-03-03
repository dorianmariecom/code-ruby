# frozen_string_literal: true

class Code
  class Node
    class List < Node
      def initialize(parsed)
        return if parsed.blank?
        @elements =
          (parsed.presence || []).map { |element| Node::Code.new(element) }
      end

      def evaluate(**args)
        ::Code::Object::List.new(
          (@elements || []).map { |element| element.evaluate(**args) }
        )
      end
    end
  end
end
