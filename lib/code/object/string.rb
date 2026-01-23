# frozen_string_literal: true

class Code
  class Object
    class String < Object
      def initialize(*args, **_kargs, &_block)
        self.raw =
          if args.first.is_an?(Class)
            args.first.raw.name
          elsif args.first.is_an?(Object)
            args.first.raw.to_s
          elsif args.first.is_a?(::Class)
            args.first.name
          elsif args.first
            args.first.to_s
          else
            ""
          end
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, List.new).to_code
        globals = multi_fetch(args, *GLOBALS)
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "&", "to_function"
          sig(args)
          code_to_function(**globals)
        when "*"
          sig(args) { Integer | Decimal }
          code_multiplication(code_value)
        when "+"
          sig(args) { Object }
          code_plus(code_value)
        when "downcase"
          sig(args)
          code_downcase
        when "include?"
          sig(args) { String }
          code_include?(code_value)
        when "starts_with?"
          sig(args) { String }
          code_starts_with?(code_value)
        when "start_with?"
          sig(args) { String }
          code_start_with?(code_value)
        when "ends_with?"
          sig(args) { String }
          code_ends_with?(code_value)
        when "end_with?"
          sig(args) { String }
          code_end_with?(code_value)
        when "first"
          sig(args) { Integer.maybe }
          code_first(code_value)
        when "reverse"
          sig(args)
          code_reverse
        when "parameterize"
          sig(args)
          code_parameterize
        when "substitute"
          sig(args) { [String, String.maybe] }
          code_substitute(*code_arguments.raw)
        when "upcase"
          sig(args)
          code_upcase
        when "size"
          sig(args)
          code_size
        when "strip"
          sig(args)
          code_strip
        when "split"
          sig(args) { String }
          code_split(code_value)
        else
          super
        end
      end

      def code_downcase
        String.new(raw.downcase)
      end

      def code_upcase
        String.new(raw.upcase)
      end

      def code_include?(value)
        code_value = value.to_code
        Boolean.new(raw.include?(code_value.raw))
      end

      def code_multiplication(other)
        code_other = other.to_code
        String.new(raw * code_other.raw)
      end

      def code_starts_with?(value)
        code_value = value.to_code
        Boolean.new(raw.start_with?(code_value.raw))
      end

      def code_start_with?(value)
        code_starts_with?(value)
      end

      def code_end_with?(value)
        code_value = value.to_code
        Boolean.new(raw.end_with?(code_value.raw))
      end

      def code_ends_with?(value)
        code_end_with?(value)
      end

      def code_plus(other)
        code_other = other.to_code
        String.new(raw + code_other.to_s)
      end

      def code_reverse
        String.new(raw.reverse)
      end

      def code_to_function(**_globals)
        Function.new([{ name: "_" }], "_.#{raw}")
      end

      def code_inspect
        String.new(raw.inspect)
      end

      def code_parameterize
        String.new(raw.parameterize)
      end

      def code_substitute(from = nil, to = nil)
        code_from = from.to_code
        code_to = to.to_code

        String.new(raw.gsub(code_from.to_s, code_to.to_s))
      end

      def code_first(n = nil)
        code_n = n.to_code
        code_n = Integer.new(1) if code_n.nothing?
        String.new(raw.first(code_n.raw))
      end

      def code_size
        Integer.new(raw.size)
      end

      def code_strip
        String.new(raw.strip)
      end

      def code_split(value)
        code_value = value.to_code

        List.new(raw.split(code_value.to_s))
      end

      def present?
        raw.present?
      end
    end
  end
end
