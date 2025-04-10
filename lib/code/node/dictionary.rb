# frozen_string_literal: true

class Code
  class Node
    class Dictionary < Node
      class KeyValue < Node
        attr_reader :resolve_key

        def initialize(parsed)
          return if parsed.blank?

          if (name_code = parsed.delete(:name_code))
            if name_code.key?(:code)
              @key =
                Node::String.new([{ text: name_code.delete(:name).presence }])
              @value = Node::Code.new(name_code.delete(:code).presence)
              @resolve_key = false
            else
              @key = Node::Call.new({ name: name_code.delete(:name).presence })
              @value = @key
              @resolve_key = true
            end
          elsif (statement_code = parsed.delete(:statement_code))
            @key =
              Node::Statement.new(statement_code.delete(:statement).presence)

            if statement_code.key?(:code)
              @value = Node::Code.new(statement_code.delete(:code).presence)
              @resolve_key = false
            else
              @value = @key
              @resolve_key = true
            end
          else
            @key = @value = Node::Code.new(parsed.delete(:code).presence)
            @resolve_key = true
          end
        end

        def evaluate(**args)
          key = resolve_key? ? @key&.resolve(**args) : @key&.evaluate(**args)
          key ||= Object::Nothing.new
          value = @value.evaluate(**args)
          [key, value]
        end

        def resolve_key?
          !!resolve_key
        end
      end

      def initialize(parsed)
        return if parsed.blank?

        @key_values = parsed.presence || []
        @key_values.map! do |key_value|
          Node::Dictionary::KeyValue.new(key_value)
        end
      end

      def evaluate(**args)
        ::Code::Object::Dictionary.new(
          (@key_values || []).to_h { |key_value| key_value.evaluate(**args) }
        )
      end
    end
  end
end
