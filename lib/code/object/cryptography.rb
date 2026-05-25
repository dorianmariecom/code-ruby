# frozen_string_literal: true

class Code
  class Object
    class Cryptography < Object
      CLASS_FUNCTIONS = {
        "md5" => {
          name: "md5",
          description: "returns the md5 digest for a value.",
          examples: [
            "Cryptography.md5(:hello)",
            "Cryptography.md5(:hello, format: :hex)",
            "Cryptography.md5(:hello, format: :base64)"
          ]
        },
        "sha1" => {
          name: "sha1",
          description: "returns the sha1 digest for a value.",
          examples: [
            "Cryptography.sha1(:hello)",
            "Cryptography.sha1(:hello, format: :hex)",
            "Cryptography.sha1(:hello, format: :base64)"
          ]
        },
        "sha256" => {
          name: "sha256",
          description: "returns the sha256 digest for a value.",
          examples: [
            "Cryptography.sha256(:hello)",
            "Cryptography.sha256(:hello, format: :hex)",
            "Cryptography.sha256(:hello, format: :base64)"
          ]
        },
        "sha384" => {
          name: "sha384",
          description: "returns the sha384 digest for a value.",
          examples: [
            "Cryptography.sha384(:hello)",
            "Cryptography.sha384(:hello, format: :hex)",
            "Cryptography.sha384(:hello, format: :base64)"
          ]
        },
        "sha512" => {
          name: "sha512",
          description: "returns the sha512 digest for a value.",
          examples: [
            "Cryptography.sha512(:hello)",
            "Cryptography.sha512(:hello, format: :hex)",
            "Cryptography.sha512(:hello, format: :base64)"
          ]
        }
      }.freeze

      def self.function_documentation(scope)
        return CLASS_FUNCTIONS if scope == :class

        {}
      end

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        arguments = code_arguments.raw

        case code_operator.to_s
        when "md5"
          sig(args) { [Object, { format: String.maybe }] }
          code_md5(*arguments)
        when "sha1"
          sig(args) { [Object, { format: String.maybe }] }
          code_sha1(*arguments)
        when "sha256"
          sig(args) { [Object, { format: String.maybe }] }
          code_sha256(*arguments)
        when "sha384"
          sig(args) { [Object, { format: String.maybe }] }
          code_sha384(*arguments)
        when "sha512"
          sig(args) { [Object, { format: String.maybe }] }
          code_sha512(*arguments)
        else
          super
        end
      end

      def self.code_md5(*arguments)
        payload = arguments[0]
        options = arguments[1] || Nothing.new
        code_payload = payload.to_code
        options = options.to_code
        options = Dictionary.new unless options.is_a?(Dictionary)
        code_format = options.code_get("format")
        code_format = String.new("hexdigest") if code_format.nothing?
        format = code_format.to_s.downcase

        case format
        when "hexdigest", "hex"
          String.new(::Digest::MD5.hexdigest(code_payload.to_s))
        when "digest"
          String.new(::Digest::MD5.digest(code_payload.to_s))
        when "base64"
          String.new(
            ::Base64.strict_encode64(::Digest::MD5.digest(code_payload.to_s))
          )
        else
          raise Error, "Cryptography: unknown format #{format.inspect}"
        end
      end

      def self.code_sha1(*arguments)
        payload = arguments[0]
        options = arguments[1] || Nothing.new
        code_payload = payload.to_code
        options = options.to_code
        options = Dictionary.new unless options.is_a?(Dictionary)
        code_format = options.code_get("format")
        code_format = String.new("hexdigest") if code_format.nothing?
        format = code_format.to_s.downcase

        case format
        when "hexdigest", "hex"
          String.new(::Digest::SHA1.hexdigest(code_payload.to_s))
        when "digest"
          String.new(::Digest::SHA1.digest(code_payload.to_s))
        when "base64"
          String.new(
            ::Base64.strict_encode64(::Digest::SHA1.digest(code_payload.to_s))
          )
        else
          raise Error, "Cryptography: unknown format #{format.inspect}"
        end
      end

      def self.code_sha256(*arguments)
        payload = arguments[0]
        options = arguments[1] || Nothing.new
        code_payload = payload.to_code
        options = options.to_code
        options = Dictionary.new unless options.is_a?(Dictionary)
        code_format = options.code_get("format")
        code_format = String.new("hexdigest") if code_format.nothing?
        format = code_format.to_s.downcase

        case format
        when "hexdigest", "hex"
          String.new(::Digest::SHA256.hexdigest(code_payload.to_s))
        when "digest"
          String.new(::Digest::SHA256.digest(code_payload.to_s))
        when "base64"
          String.new(
            ::Base64.strict_encode64(::Digest::SHA256.digest(code_payload.to_s))
          )
        else
          raise Error, "Cryptography: unknown format #{format.inspect}"
        end
      end

      def self.code_sha384(*arguments)
        payload = arguments[0]
        options = arguments[1] || Nothing.new
        code_payload = payload.to_code
        options = options.to_code
        options = Dictionary.new unless options.is_a?(Dictionary)
        code_format = options.code_get("format")
        code_format = String.new("hexdigest") if code_format.nothing?
        format = code_format.to_s.downcase

        case format
        when "hexdigest", "hex"
          String.new(::Digest::SHA384.hexdigest(code_payload.to_s))
        when "digest"
          String.new(::Digest::SHA384.digest(code_payload.to_s))
        when "base64"
          String.new(
            ::Base64.strict_encode64(::Digest::SHA384.digest(code_payload.to_s))
          )
        else
          raise Error, "Cryptography: unknown format #{format.inspect}"
        end
      end

      def self.code_sha512(*arguments)
        payload = arguments[0]
        options = arguments[1] || Nothing.new
        code_payload = payload.to_code
        options = options.to_code
        options = Dictionary.new unless options.is_a?(Dictionary)
        code_format = options.code_get("format")
        code_format = String.new("hexdigest") if code_format.nothing?
        format = code_format.to_s.downcase

        case format
        when "hexdigest", "hex"
          String.new(::Digest::SHA512.hexdigest(code_payload.to_s))
        when "digest"
          String.new(::Digest::SHA512.digest(code_payload.to_s))
        when "base64"
          String.new(
            ::Base64.strict_encode64(::Digest::SHA512.digest(code_payload.to_s))
          )
        else
          raise Error, "Cryptography: unknown format #{format.inspect}"
        end
      end
    end
  end
end
