# frozen_string_literal: true

class Code
  class Object
    class String < Object
      def initialize(*args, **_kargs, &)
        @raw =
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
        when "first"
          sig(args) { Integer.maybe }
          code_first(code_value)
        when "reverse"
          sig(args)
          code_reverse
        when "parameterize"
          sig(args)
          code_parameterize
        else
          super
        end
      end

      def code_downcase
        String.new(raw.downcase)
      end

      def code_include?(value)
        code_value = value.to_code
        Boolean.new(raw.include?(code_value.raw))
      end

      def code_multiplication(other)
        code_other = other.to_code
        String.new(raw * code_other.raw)
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

      def code_first(n = nil)
        code_n = n.to_code
        code_n = Integer.new(1) if code_n.nothing?
        String.new(raw.first(code_n.raw))
      end
    end
  end
end
