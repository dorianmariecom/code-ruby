# frozen_string_literal: true

class Code
  class Object
    class Context < Dictionary
      attr_reader :parent

      def initialize(*args, **_kargs, &_block)
        raw = args.first || Dictionary.new
        raw = raw.raw if raw.is_a?(Object)
        @raw = raw.to_h
        @parent = Context.new(args.second) if args.second
      end

      def lookup!(identifier)
        if code_has_key?(identifier).truthy?
          self
        elsif parent?
          parent.lookup!(identifier)
        else
            raise Error::Undefined, "#{identifier} is not defined"
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
