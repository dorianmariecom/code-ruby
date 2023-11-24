# frozen_string_literal: true

class Code
  class Parser
    class Class < Language
      def statement
        While
      end

      def name
        Name
      end

      def code
        Code
      end

      def whitespace
        Whitespace
      end

      def whitespace?
        whitespace.maybe
      end

      def class_keyword
        str("class")
      end

      def end_keyword
        str("end")
      end

      def lesser
        str("<")
      end

      def root
        (
          class_keyword << whitespace? << name.aka(:name) <<
            (
              whitespace? << lesser << whitespace? << name.aka(:superclass)
            ).maybe << code.aka(:body) << end_keyword.maybe
        ).aka(:class) | statement
      end
    end
  end
end
