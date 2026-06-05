# frozen_string_literal: true

class Code
  class Node
    class Function < Node
      def initialize(parsed)
        return if parsed.blank?

        @parameters = parsed.delete(:parameters).presence || []
        @parameters.map! { |parameter| FunctionParameter.new(parameter) }

        @body = Code.new(parsed.delete(:body).presence)
      end

      def evaluate(**args)
        Object::Function.new(
          @parameters,
          @body,
          args.fetch(:context),
          args.fetch(:previous_object)
        )
      end
    end
  end
end
