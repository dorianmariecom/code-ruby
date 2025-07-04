# frozen_string_literal: true

class Code
  class Node
    class If < Node
      IF_KEYWORD = "if"
      UNLESS_KEYWORD = "unless"
      ELSIF_KEYWORD = "elsif"
      ELSUNLESS_KEYWORD = "elsunless"
      ELSE_KEYWORD = "else"

      class Else < Node
        attr_reader :operator, :statement, :body

        def initialize(parsed)
          return if parsed.blank?

          @operator = parsed.delete(:operator).presence
          @body = Node::Code.new(parsed.delete(:body).presence)

          return unless parsed.key?(:statement)

          @statement = Node::Statement.new(parsed.delete(:statement).presence)
        end
      end

      def initialize(parsed)
        return if parsed.blank?

        @first_operator = parsed.delete(:first_operator).presence
        @first_statement =
          Node::Statement.new(parsed.delete(:first_statement).presence)
        @first_body = Node::Code.new(parsed.delete(:first_body).presence)
        @elses = parsed.delete(:elses).presence || []
        @elses.map! { |elses| Node::If::Else.new(elses) }
      end

      def evaluate(**args)
        if (
             @first_operator == IF_KEYWORD &&
               @first_statement.evaluate(**args).truthy?
           ) ||
             (
               @first_operator == UNLESS_KEYWORD &&
                 @first_statement.evaluate(**args).falsy?
             )
          @first_body.evaluate(**args)
        else
          (@elses || []).each do |elses|
            if (
                 elses.operator == ELSIF_KEYWORD &&
                   elses.statement.evaluate(**args).truthy?
               ) ||
                 (
                   elses.operator == ELSUNLESS_KEYWORD &&
                     elses.statement.evaluate(**args).falsy?
                 ) ||
                 (
                   elses.operator == IF_KEYWORD &&
                     elses.statement.evaluate(**args).truthy?
                 ) ||
                 (
                   elses.operator == UNLESS_KEYWORD &&
                     elses.statement.evaluate(**args).falsy?
                 ) || (elses.operator == ELSE_KEYWORD)
              return elses.body.evaluate(**args)
            end
          end

          ::Code::Object::Nothing.new
        end
      end
    end
  end
end
