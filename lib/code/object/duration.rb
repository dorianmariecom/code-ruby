# frozen_string_literal: true

class Code
  class Object
    class Duration < Object
      INSTANCE_FUNCTIONS = {
        "ago" => {
          name: "ago",
          description: "returns the time this duration before now.",
          examples: ["1.day.ago", "2.hours.ago", "30.minutes.ago"]
        },
        "from_now" => {
          name: "from_now",
          description: "returns the time this duration after now.",
          examples: ["1.day.from_now", "2.hours.from_now", "30.minutes.from_now"]
        }
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      def initialize(*args, **_kargs, &_block)
        self.raw =
          if args.first.is_an?(::ActiveSupport::Duration)
            args.first
          elsif args.first.is_a?(Duration)
            args.first.raw
          else
            ::ActiveSupport::Duration.parse(args.first.to_s)
          end
      rescue ::ActiveSupport::Duration::ISO8601Parser::ParsingError
        self.raw = 0.seconds
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
