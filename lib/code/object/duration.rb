# frozen_string_literal: true

class Code
  class Object
    class Duration < Object
      def initialize(*args, **_kargs, &)
        if args.first.is_an?(::ActiveSupport::Duration)
          @raw = args.first
        elsif args.first.is_a?(Duration)
          @raw = args.first.raw
        else
          @raw = ::ActiveSupport::Duration.parse(args.first.to_s)
        end
      rescue ::ActiveSupport::Duration::ISO8601Parser::ParsingError
        @raw = 0.seconds
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code

        case code_operator.to_s
        when "ago"
          sig(args)
          code_ago
        when "from_now"
          sig(args)
          code_from_now
        else
          super
        end
      end

      def code_ago
        Time.new(raw.ago)
      end

      def code_from_now
        Time.new(raw.from_now)
      end
    end
  end
end
