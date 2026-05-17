# frozen_string_literal: true

class Code
  class Object
    class Nothing < Object
      def initialize(*_args, **_kargs, &_block)
        self.raw = nil
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code

        case code_operator.to_s
        when "empty?"
          sig(args)
          code_empty?
        else
          super
        end
      end

      def truthy?
        false
      end

      def present?
        false
      end

      def nothing?
        true
      end

      def code_empty?
        Boolean.new(true)
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
