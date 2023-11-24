# frozen_string_literal: true

class Code
  class Object
    class Nothing < ::Code::Object
      attr_reader :raw

      def initialize
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
    end
  end
end
