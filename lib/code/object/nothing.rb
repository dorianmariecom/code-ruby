# frozen_string_literal: true

class Code
  class Object
    class Nothing < Object
      def initialize(*_args, **_kargs, &_block)
        @raw = nil
      end

      def self.name
        "Nothing"
      end

      def inspect
        "nothing"
      end

      def to_s
        ""
      end

      def truthy?
        false
      end

      def as_json(...)
        raw.as_json(...)
      end
    end
  end
end
