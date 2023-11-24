# frozen_string_literal: true

class Code
  class Object
    class Context < Dictionary
      attr_reader :parent

      def initialize(raw = {}, parent: nil)
        @raw = raw
        @parent = parent
      end

      def self.name
        "Context"
      end

      def lookup!(identifier)
        if code_has_key?(identifier).truthy?
          self
        elsif parent?
          parent.lookup!(identifier)
        else
          raise Code::Error::Undefined, "#{identifier} is not defined"
        end
      end

      def merge(other)
        Context.new(raw.merge(other.raw), parent: parent || other.parent)
      end

      def parent?
        !!parent
      end
    end
  end
end
