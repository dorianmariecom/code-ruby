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
        Object::String.new(@name)
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

      def default
        nil
      end

      def to_h
        {
          name:,
          regular?: regular?,
          keyword?: keyword?,
          regular_splat?: regular_splat?,
          keyword_splat?: keyword_splat?,
          default: Object::Code.new(default),
        }
      end

      def to_code
        self
      end
    end
  end
end
