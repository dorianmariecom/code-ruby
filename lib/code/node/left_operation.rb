# frozen_string_literal: true

class Code
  class Node
    class LeftOperation < Node
      class Operator < Node
        DOT = "."
        COLON_COLON = "::"

        attr_reader :operator, :statement

        def initialize(parsed)
          return if parsed.blank?
          @operator = parsed.delete(:operator).presence
          @statement = Statement.new(parsed.delete(:statement).presence)
        end

        def call?
          operator == DOT || operator == COLON_COLON
        end
      end

      def initialize(parsed)
        return if parsed.blank?
        @first = Statement.new(parsed.delete(:first).presence)
        @others = parsed.delete(:others).presence || []
        @others.map! { |operator| Operator.new(operator) }
      end

      def evaluate(**args)
        first = @first&.evaluate(**args) || Object::Nothing.new

        @others.reduce(first) do |left, right|
          if right.call?
            right.statement.evaluate(**args, object: left)
          else
            statement = right.statement.evaluate(**args)

            left.call(
              **args,
              operator: right.operator,
              arguments: [::Code::Object::Argument.new(statement)]
            )
          end
        end
      end

      def resolve(**args)
        first = @first&.resolve(**args) || Object::Nothing.new

        list = Object::IdentifierList.new([first])

        (@others || []).each do |other|
          list.code_append(
            other.statement.resolve(**args, object: list.code_last)
          )
        end

        list
      end
    end
  end
end
