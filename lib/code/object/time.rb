# frozen_string_literal: true

class Code
  class Object
    class Time < Object
      DEFAULT_ZONE = "Etc/UTC"

      def initialize(*args, **_kargs, &_block)
        ::Time.zone ||= DEFAULT_ZONE
        raw = args.first.presence || ::Time.zone.now
        raw = raw.raw if raw.is_an?(Object)
        @raw = ::Time.zone.parse(raw.to_s)
      end

      def self.call(**args)
        operator = args.fetch(:operator, nil)

        case operator.to_s
        when "now"
          sig(args)
          code_now
        when "tomorrow"
          sig(args)
          code_tomorrow
        when "yesterday"
          sig(args)
          code_yesterday
        else
          super
        end
      end

      def self.code_tomorrow
        ::Time.zone ||= DEFAULT_ZONE
        new(::Time.zone.tomorrow)
      end

      def self.code_yesterday
        ::Time.zone ||= DEFAULT_ZONE
        new(::Time.zone.yesterday)
      end

      def self.code_now
        ::Time.zone ||= DEFAULT_ZONE
        new(::Time.zone.now)
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, List.new)
        value = arguments.code_first

        case operator.to_s
        when "after?"
          sig(args) { Time.maybe }
          code_after?(value)
        when "before?"
          sig(args) { Time.maybe }
          code_before?(value)
        when "past?"
          sig(args)
          code_past?
        when "future?"
          sig(args)
          code_future?
        else
          super
        end
      end

      def code_after?(other = nil)
        other = Time.code_now if other.nil? || other.is_a?(Nothing)
        Boolean.new(raw.after?(other.raw))
      end

      def code_before?(other = nil)
        other = Time.code_now if other.nil? || other.is_a?(Nothing)
        Boolean.new(raw.before?(other.raw))
      end

      def code_past?
        code_before?
      end

      def code_future?
        code_after?
      end
    end
  end
end
