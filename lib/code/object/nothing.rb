# frozen_string_literal: true

class Code
  class Object
    class Nothing < Object
      def initialize(*_args, **_kargs, &_block)
        @raw = nil
      end

      def truthy?
        false
      end
    end
  end
end
