# frozen_string_literal: true

class Code
  class Node
    class SquareBracket < Node
      def initialize(parsed)
        @left = Node::Statement.new(parsed.delete(:left))
        @statements =
          parsed
            .delete(:statements)
            .map { |statement| Node::Statement.new(statement) }

        super(parsed)
      end

      def evaluate(**args)
        left = @left.evaluate(**args)

        @statements.reduce(left) do |object, statement|
          object.code_fetch(statement.evaluate(**args))
        end
      end

      def resolve(**args)
        left = @left.resolve(**args)

        list = Object::IdentifierList.new([left])

        @statements.each do |statement|
          list.code_append(statement.evaluate(**args))
        end

        list
      end
    end
  end
end
