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
        index_args = args.merge(object: args.fetch(:previous_object))

        (@statements || []).reduce(left) do |object, statement|
          object.code_fetch(statement.evaluate(**index_args))
        end
      end

      def resolve(**args)
        left = @left&.resolve(**args) || Object::Nothing.new

        list =
          if left.is_an?(Object::IdentifierList)
            Object::IdentifierList.new(left.raw.dup)
          else
            Object::IdentifierList.new([left])
          end

        index_args = args.merge(object: args.fetch(:previous_object))

        (@statements || []).each do |statement|
          list.code_append(statement.evaluate(**index_args))
        end

        list
      end
    end
  end
end
