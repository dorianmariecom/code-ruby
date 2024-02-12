# frozen_string_literal: true

class Code
  class Object
    class RubyFunction < Function
      attr_reader :raw

      def initialize(raw)
        @raw = raw
      end

      def self.name
        "RubyFunction"
      end

      # TODO: fix / refactor
      def code_call(args:, globals:)
        regular_arguments =
          args
            .select(&:regular?)
            .map(&:value)
            .map { |argument| Ruby.from_code(argument) }

        keyword_arguments =
          args
            .select(&:keyword?)
            .map do |argument|
              [argument.name.to_sym, Ruby.from_code(argument.value)]
            end
            .to_h

        Ruby.to_code(raw.call(*regular_arguments, **keyword_arguments))
      end
    end
  end
end
