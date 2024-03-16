# frozen_string_literal: true

class Code
  class Node
    class SquareBracket < Node
      def initialize(parsed)
        return if parsed.blank?

        @left = Node::Statement.new(parsed.delete(:left).presence)
        @statements = parsed.delete(:statements).presence || []
        @statements.map! { |statement| Node::Statement.new(statement) }
      end

      def evaluate(**args)
        left = @left&.evaluate(**args) || Object::Nothing.new

        (@statements || []).reduce(left) do |object, statement|
          object.code_fetch(statement.evaluate(**args))
        end
      end

      def resolve(**args)
        left = @left&.resolve(**args) || Object::Nothing.new

        list = Object::IdentifierList.new([left])

        (@statements || []).each do |statement|
          list.code_append(statement.evaluate(**args))
        end

        list
      end
    end
  end
end
