# frozen_string_literal: true

class Code
  class Node
    class Base16 < Node
      def initialize(parsed)
        return if parsed.blank?
        @base_16 = parsed.presence
      end

      def evaluate(**_args)
        if @base_16
          Object::Integer.new(@base_16.to_i(16))
        else
          Object::Nothing.new
        end
      end
    end
  end
end
