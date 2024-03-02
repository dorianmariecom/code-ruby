# frozen_string_literal: true

class Code
  class Node
    class FunctionParameter < Node
      def initialize(parsed)
        return if parsed.blank?
        @name = parsed.delete(:name).presence
        @keyword = parsed.delete(:keyword).present?
      end

      def name
        ::Code::Object::String.new(@name)
      end

      def regular?
        !@keyword
      end

      def keyword?
        !!@keyword
      end

      def regular_splat?
        false
      end

      def keyword_splat?
        false
      end
    end
  end
end
