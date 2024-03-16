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
          Object::String.new(:name) => Object::String.new(name),
          Object::String.new(:regular?) => Object::Boolean.new(regular?),
          Object::String.new(:keyword?) => Object::Boolean.new(keyword?),
          Object::String.new(:regular_splat?) =>
            Object::Boolean.new(regular_splat?),
          Object::String.new(:keyword_splat?) =>
            Object::Boolean.new(keyword_splat?),
          Object::String.new(:default) => Object::Code.new(default)
        }
      end
    end
  end
end
