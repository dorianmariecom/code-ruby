# frozen_string_literal: true

class Code
  class Object
    class Context < Dictionary
      attr_reader :parent

      def initialize(*args, **_kargs, &_block)
        super(args.first)
        @parent = args.second if args.second.is_a?(Dictionary)
      end

      def code_lookup!(identifier)
        code_identifier = identifier.to_code

        if code_has_key?(code_identifier).truthy?
          self
        elsif parent?
          parent.code_lookup!(code_identifier)
        else
          raise Error, "#{code_identifier} is not defined"
        end
      end

      def merge(other)
        Context.new(raw.merge(other.raw), parent || other.parent)
      end

      def parent?
        !!parent
      end
    end
  end
end
