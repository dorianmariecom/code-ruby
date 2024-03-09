# frozen_string_literal: true

class Code
  class Object
    class String < Object
      def initialize(*args, **_kargs, &_block)
        raw = args.first || Nothing.new
        raw = raw.raw if raw.is_a?(Object)
        @raw = raw.to_s
      end

      def call(**args)
        operator = args.fetch(:operator, nil)
        arguments = args.fetch(:arguments, [])
        globals = multi_fetch(args, *GLOBALS)
        value = arguments.first&.value

        case operator.to_s
        when "&", "to_function"
          sig(args)
          code_to_function(**globals)
        when "*"
          sig(args) { Integer | Decimal }
          code_multiplication(value)
        when "+"
          sig(args) { Object }
          code_plus(value)
        when "downcase"
          sig(args)
          code_downcase
        when "include?"
          sig(args) { String }
          code_include?(value)
        when "reverse"
          sig(args)
          code_reverse
        else
          super
        end
      end

      def code_downcase
        String.new(raw.downcase)
      end

      def code_include?(value)
        Boolean.new(raw.include?(value.raw))
      end

      def code_multiplication(other)
        String.new(raw * other.raw)
      end

      def code_plus(other)
        String.new(raw + other.to_s)
      end

      def code_reverse
        String.new(raw.reverse)
      end

      def code_to_function(**globals)
        Node::Code.new(
          [
            {
              function: {
                parameters: [{ name: "_" }],
                body: [
                  {
                    left_operation: {
                      first: {
                        call: {
                          name: "_"
                        }
                      },
                      others: [
                        { operator: ".", statement: { call: { name: raw } } }
                      ]
                    }
                  }
                ]
              }
            }
          ]
        ).evaluate(**globals)
      end
    end
  end
end
