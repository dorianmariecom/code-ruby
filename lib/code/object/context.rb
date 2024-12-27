# frozen_string_literal: true

class Code
  class Object
    class Context < Dictionary
      attr_reader :parent

      def initialize(*args, **_kargs, &)
        super(args.first)
        @parent = Context.new(args.second) unless args.second.to_code.nothing?
      end

      def lookup!(identifier)
        code_identifier = identifier.to_code

        if code_has_key?(code_identifier).truthy?
          self
        elsif parent?
          parent.lookup!(code_identifier)
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
