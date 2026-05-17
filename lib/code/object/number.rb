# frozen_string_literal: true

class Code
  class Object
    class Number < Object
      def code_between?(min, max)
        code_min = min.to_code
        code_max = max.to_code

        Boolean.new(raw.between?(code_min.raw, code_max.raw))
      end

      def code_clamp(min, max)
        code_min = min.to_code
        code_max = max.to_code

        self.class.new(raw.clamp(code_min.raw, code_max.raw))
      end

      def code_divide(other)
        code_other = other.to_code

        Integer.new(raw.div(code_other.raw))
      end

      def code_divide_modulo(other)
        code_other = other.to_code

        List.new(raw.divmod(code_other.raw))
      end

      def code_next
        code_plus(Integer.new(1))
      end

      def code_previous
        code_minus(Integer.new(1))
      end

      def code_remainder(other)
        code_other = other.to_code

        self.class.new(raw.remainder(code_other.raw))
      end

      def code_successor
        code_next
      end

      def code_predecessor
        code_previous
      end
    end
  end
end
