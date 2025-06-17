# frozen_string_literal: true

class Code
  class Parser
    class Equal < RightOperation
      def statement
        Rescue
      end

      def equal
        str("=")
      end

      def plus
        str("+")
      end

      def minus
        str("-")
      end

      def asterisk
        str("*")
      end

      def slash
        str("/")
      end

      def percent
        str("%")
      end

      def greater
        str(">")
      end

      def lesser
        str("<")
      end

      def ampersand
        str("&")
      end

      def pipe
        str("|")
      end

      def caret
        str("^")
      end

      def right_statement
        Statement
      end

      def operator
        equal | (plus << equal) | (minus << equal) | (asterisk << equal) |
          (slash << equal) | (percent << equal) |
          (greater << greater << equal) | (lesser << lesser << equal) |
          (ampersand << equal) | (pipe << equal) | (caret << equal) |
          (pipe << pipe << equal) | (ampersand << ampersand << equal)
      end
    end
  end
end
