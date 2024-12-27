# frozen_string_literal: true

class Code
  class Object
    class Json < Object
      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "parse"
          sig(args) { String }
          code_parse(code_value)
        else
          super
        end
      end

      def self.code_parse(value)
        code_value = value.to_code

        ::JSON.parse(code_value.raw).to_code
      rescue JSON::ParserError
        Nothing.new
      end
    end
  end
end
