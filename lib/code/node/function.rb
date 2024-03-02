# frozen_string_literal: true

class Code
  class Node
    class Function < Node
      def initialize(parsed)
        return if parsed.blank?
        @parameters = parsed.delete(:parameters).presence || []
        @parameters.map! { |parameter| Node::FunctionParameter.new(parameter) }

        @body = Node::Code.new(parsed.delete(:body).presence)
      end

      def evaluate(**_args)
        ::Code::Object::Function.new(parameters: @parameters, body: @body)
      end
    end
  end
end
