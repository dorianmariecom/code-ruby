# frozen_string_literal: true

class Code
  class Node
    class Dictionary < Node
      class KeyValue < Node
        def initialize(parsed)
          return if parsed.blank?
          if parsed.key?(:statement)
            @key = Node::Statement.new(parsed.delete(:statement).presence)
          elsif parsed.key?(:name)
            @key = Node::String.new([{ text: parsed.delete(:name).presence }])
          end

          if parsed[:value].presence
            @value = Node::Code.new(parsed.delete(:value).presence)
          end
        end

        def evaluate(**args)
          key = @key&.evaluate(**args) || Object::Nothing.new

          if @value
            value = @value.evaluate(**args)
            [key, value]
          else
            [key, key]
          end
        end
      end

      def initialize(parsed)
        return if parsed.blank?
        @key_values = parsed.presence || []
        @key_values.map! { |key_value| Node::Dictionary::KeyValue.new(key_value) }
      end

      def evaluate(**args)
        ::Code::Object::Dictionary.new(
          (@key_values || []).map { |key_value| key_value.evaluate(**args) }.to_h
        )
      end
    end
  end
end
