# frozen_string_literal: true

class Code
  class Node
    class FunctionParameter < Node
      attr_reader :default

      def initialize(parsed)
        return if parsed.blank?

        @name =
          parsed.delete(:name).presence || parsed[:regular_splat].presence ||
            parsed[:keyword_splat].presence || parsed[:spread].presence ||
            parsed[:block].presence
        @keyword = parsed.delete(:keyword).present?
        @regular_splat = parsed.delete(:regular_splat).present?
        @keyword_splat = parsed.delete(:keyword_splat).present?
        @spread = parsed.delete(:spread).present?
        @block = parsed.delete(:block).present?
        @default = Code.new(parsed.delete(:default)) if parsed.key?(:default)
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
        !!@regular_splat
      end

      def keyword_splat?
        !!@keyword_splat
      end

      def spread?
        !!@spread
      end

      def block?
        !!@block
      end

      def to_h
        {
          name: name,
          regular?: regular?,
          keyword?: keyword?,
          regular_splat?: regular_splat?,
          keyword_splat?: keyword_splat?,
          spread?: spread?,
          block?: block?,
          default: default
        }
      end

      def to_code
        to_h.to_code
      end
    end
  end
end
