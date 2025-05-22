# frozen_string_literal: true

class Code
  class Object
    class Base64 < Object
      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "encode"
          sig(args) { String }
          code_encode(code_value)
        when "decode"
          sig(args) { String }
          code_decode(code_value)
        when "strict_encode"
          sig(args) { String }
          code_strict_encode(code_value)
        when "strict_decode"
          sig(args) { String }
          code_strict_decode(code_value)
        when "urlsafe_encode"
          sig(args) { String }
          code_urlsafe_encode(code_value)
        when "urlsafe_decode"
          sig(args) { String }
          code_urlsafe_decode(code_value)
        else
          super
        end
      end

      def self.code_encode(string)
        code_string = string.to_code

        String.new(::Base64.encode64(code_string.to_s))
      end

      def self.code_decode(string)
        code_string = string.to_code

        String.new(::Base64.decode64(code_string.to_s))
      end

      def self.code_strict_encode(string)
        code_string = string.to_code

        String.new(::Base64.strict_encode64(code_string.to_s))
      end

      def self.code_strict_decode(string)
        code_string = string.to_code

        String.new(::Base64.strict_decode64(code_string.to_s))
      end

      def self.code_urlsafe_encode(string)
        code_string = string.to_code

        String.new(::Base64.urlsafe_encode64(code_string.to_s))
      end

      def self.code_urlsafe_decode(string)
        code_string = string.to_code

        String.new(::Base64.urlsafe_decode64(code_string.to_s))
      end
    end
  end
end
