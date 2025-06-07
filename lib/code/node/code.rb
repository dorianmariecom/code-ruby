# frozen_string_literal: true

class Code
  class Node
    class Code < Node
      def initialize(parsed)
        return if parsed.blank?

        @statements =
          (parsed.presence || []).map { |statement| Statement.new(statement) }
      end

      def evaluate(**args)
        last = Object::Nothing.new

        (@statements || []).each do |statement|
          last = statement.evaluate(**args, object: Object::Global.new)
        end

        last
      end

      def resolve(**args)
        last = Object::Nothing.new

        (@statements || []).each do |statement|
          last = statement.resolve(**args, object: Object::Global.new)
        end

        last
      end

      def to_code
        @statements.blank? ? Object::Nothing.new : Object::Code.new(self)
      end
    end
  end
end
