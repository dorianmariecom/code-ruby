# frozen_string_literal: true

class Code
  class Object
    class Nothing < Object
      def initialize(*_args, **_kargs, &)
        @raw = nil
      end

      def truthy?
        false
      end

      def nothing?
        true
      end

      def code_to_string
        String.new
      end

      def code_inspect
        String.new("nothing")
      end
    end
  end
end
