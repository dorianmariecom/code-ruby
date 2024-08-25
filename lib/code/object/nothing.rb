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
    end
  end
end
