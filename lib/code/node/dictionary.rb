# frozen_string_literal: true

class Code
  class Node
    class Dictionary < Node
      class KeyValue < Node
        def initialize(parsed)
          if parsed.key?(:statement)
            @key = Node::Statement.new(parsed.delete(:statement))
          elsif parsed.key?(:name)
            @key = Node::String.new([{text: parsed.delete(:name)}])
          end

          @value = Node::Code.new(parsed.delete(:value)) if parsed[:value]
        end

        def evaluate(**args)
          key = @key.evaluate(**args)

          if @value
            value = @value.evaluate(**args)
            [key, value]
          else
            [key, key]
          end
        end
      end

      def initialize(parsed)
        parsed = [] if parsed == ""
        @key_values =
          parsed.map { |key_value| Node::Dictionary::KeyValue.new(key_value) }
      end

      def evaluate(**args)
        ::Code::Object::Dictionary.new(
          @key_values.map { |key_value| key_value.evaluate(**args) }.to_h
        )
      end
    end
  end
end
