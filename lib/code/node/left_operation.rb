# frozen_string_literal: true

class Code
  class Node
    class LeftOperation < Node
      class Operator < Node
        DOT = "."
        COLON_COLON = "::"
        AMPERSAND_DOT = "&."
        OR_KEYWORD = "or"
        PIPE_PIPE = "||"
        AND_KEYWORD = "and"
        AMPERSAND_AMPERSAND = "&&"

        attr_reader :operator, :statement

        def initialize(parsed)
          return if parsed.blank?

          @operator = parsed.delete(:operator).presence
          @statement = Statement.new(parsed.delete(:statement).presence)
        end

        def call?
          [DOT, COLON_COLON].include?(operator)
        end

        def safe_call?
          operator == AMPERSAND_DOT
        end

        def or?
          [OR_KEYWORD, PIPE_PIPE].include?(operator)
        end

        def and?
          [AND_KEYWORD, AMPERSAND_AMPERSAND].include?(operator)
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
          elsif right.safe_call?
            if left.is_an?(Object::Nothing)
              Object::Nothing.new
            else
              right.statement.evaluate(**args, object: left)
            end
          elsif (right.or? && left.truthy?) || (right.and? && left.falsy?)
            left
          else
            left.call(
              **args,
              operator: right.operator,
              arguments: Object::List.new([right.statement.evaluate(**args)])
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
