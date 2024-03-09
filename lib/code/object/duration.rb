# frozen_string_literal: true

class Code
  class Object
    class Duration < Object
      def initialize(*args, **_kargs, &_block)
        raw = args.first || 0.seconds
        raw = raw.raw if raw.is_an?(Object)
        raw = raw.iso8601 if raw.is_an?(::ActiveSupport::Duration)
        @raw = ::ActiveSupport::Duration.parse(raw.to_s)
      rescue ::ActiveSupport::Duration::ISO8601Parser::ParsingError
        raise Error, "#{raw.inspect} is not a valid duration"
      end

      def call(**args)
        operator = args.fetch(:operator, nil)

        case operator.to_s
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
