# frozen_string_literal: true

class Code
  class Object
    class Url < Object
      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code

        case code_operator.to_s
        when "encode"
          sig(args) { Object.maybe }
          code_encode(*code_arguments.raw)
        else
          super
        end
      end

      def self.code_encode(string = nil)
        code_string = string.to_code

        String.new(CGI.escape(string.to_s))
      end
    end
  end
end
