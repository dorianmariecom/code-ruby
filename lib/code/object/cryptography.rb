# frozen_string_literal: true

class Code
  class Object
    class Cryptography < Object
      CLASS_DOCUMENTATION = {
        name: "Cryptography",
        description:
          "computes md5, sha1, sha256, sha384, and sha512 message digests in hex, digest, or base64 format.",
        examples: [
          "Cryptography.md5(:hello)",
          "Cryptography.sha256(:hello, format: :hex)",
          "Cryptography.sha512(:hello, format: :base64)"
        ]
      }.freeze
      HMAC_ALGORITHM = "SHA256"
      DEFAULT_FORMAT = "hex"
      CLASS_FUNCTIONS = {
        "hmac_sha256" => {
          name: "hmac_sha256",
          description: "returns an HMAC SHA256 signature as hex, digest, or base64.",
          examples: [
            'Cryptography.hmac_sha256("key", "hello")',
            'Cryptography.hmac_sha256("key", "hello", format: :base64)',
            'Cryptography.hmac_sha256("key", "hello", format: :digest).size'
          ]
        },
        "md5" => {
          name: "md5",
          description:
            "returns an md5 message digest as hex text by default, with digest and base64 formats available.",
          examples: [
            "Cryptography.md5(:hello)",
            "Cryptography.md5(:hello, format: :hex)",
            "Cryptography.md5(:hello, format: :base64)"
          ]
        },
        "sha1" => {
          name: "sha1",
          description:
            "returns a sha1 message digest as hex text by default, with digest and base64 formats available.",
          examples: [
            "Cryptography.sha1(:hello)",
            "Cryptography.sha1(:hello, format: :hex)",
            "Cryptography.sha1(:hello, format: :base64)"
          ]
        },
        "sha256" => {
          name: "sha256",
          description:
            "returns a sha256 message digest as hex text by default, with digest and base64 formats available.",
          examples: [
            "Cryptography.sha256(:hello)",
            "Cryptography.sha256(:hello, format: :hex)",
            "Cryptography.sha256(:hello, format: :base64)"
          ]
        },
        "sha384" => {
          name: "sha384",
          description:
            "returns a sha384 message digest as hex text by default, with digest and base64 formats available.",
          examples: [
            "Cryptography.sha384(:hello)",
            "Cryptography.sha384(:hello, format: :hex)",
            "Cryptography.sha384(:hello, format: :base64)"
          ]
        },
        "sha512" => {
          name: "sha512",
          description:
            "returns a sha512 message digest as hex text by default, with digest and base64 formats available.",
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
        when "hmac_sha256"
          sig(args) { [Object, Object, { format: String.maybe }] }
          code_hmac_sha256(*arguments)
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

      def self.code_hmac_sha256(key, payload, options = nil)
        code_format = (options || {}).to_code.code_get("format")
        format = code_format.nothing? ? DEFAULT_FORMAT : code_format.to_s.downcase
        digest = OpenSSL::HMAC.digest(HMAC_ALGORITHM, key.to_s, payload.to_s)
        case format
        when "hex", "hexdigest"
          digest.unpack1("H*").to_code
        when "digest"
          digest.to_code
        when "base64"
          ::Base64.strict_encode64(digest).to_code
        else
          raise Error, "Cryptography: unknown format #{format.inspect}"
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
