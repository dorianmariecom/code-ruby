# frozen_string_literal: true

class Code
  class Node
    class Code < Node
      def initialize(parsed)
        @statements = parsed.map { |statement| Statement.new(statement) }
      end

      def evaluate(**args)
        last = Object::Nothing.new

        @statements.each do |statement|
          last = statement.evaluate(**args.merge(object: Object::Global.new))
        end

        last
      end
    end
  end
end
