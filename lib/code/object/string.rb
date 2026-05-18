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
        when "[]", "at", "get"
          sig(args) { Integer }
          code_get(code_value)
        when "capitalize"
          sig(args)
          code_capitalize
        when "characters"
          sig(args)
          code_characters
        when "bytes"
          sig(args)
          code_bytes
        when "chomp"
          sig(args)
          code_chomp
        when "chop"
          sig(args)
          code_chop
        when "delete"
          sig(args) { String }
          code_delete(code_value)
        when "delete_prefix"
          sig(args) { String }
          code_delete_prefix(code_value)
        when "delete_suffix"
          sig(args) { String }
          code_delete_suffix(code_value)
        when "empty?"
          sig(args)
          code_empty?
        when "first"
          sig(args) { Integer.maybe }
          code_first(code_value)
        when "index"
          sig(args) { String }
          code_index(code_value)
        when "last"
          sig(args) { Integer.maybe }
          code_last(code_value)
        when "lines"
          sig(args)
          code_lines
        when "reverse"
          sig(args)
          code_reverse
        when "right_index"
          sig(args) { String }
          code_right_index(code_value)
        when "parameterize"
          sig(args)
          code_parameterize
        when "squish"
          sig(args)
          code_squish
        when "substitute"
          sig(args) { [String, String.maybe] }
          code_substitute(*code_arguments.raw)
        when "substitute!"
          sig(args) { [String, String.maybe] }
          code_substitute!(*code_arguments.raw)
        when "substitute_all"
          sig(args) { [String, String.maybe] }
          code_substitute_all(*code_arguments.raw)
        when "substitute_all!"
          sig(args) { [String, String.maybe] }
          code_substitute_all!(*code_arguments.raw)
        when "substitute_once"
          sig(args) { [String, String.maybe] }
          code_substitute_once(*code_arguments.raw)
        when "substitute_once!"
          sig(args) { [String, String.maybe] }
          code_substitute_once!(*code_arguments.raw)
        when "swapcase"
          sig(args)
          code_swapcase
        when "titleize"
          sig(args)
          code_titleize
        when "upcase"
          sig(args)
          code_upcase
        when "size"
          sig(args)
          code_size
        when "strip"
          sig(args)
          code_strip
        when "left_strip"
          sig(args)
          code_left_strip
        when "right_strip"
          sig(args)
          code_right_strip
        when "slice"
          sig(args) { Object.repeat(1) }
          code_slice(*code_arguments.raw)
        when "left_justify"
          sig(args) { [Integer, String.maybe] }
          code_left_justify(*code_arguments.raw)
        when "right_justify"
          sig(args) { [Integer, String.maybe] }
          code_right_justify(*code_arguments.raw)
        when "split"
          sig(args) { String.maybe }
          code_split(code_value)
        when "words"
          sig(args)
          code_words
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

      def code_capitalize
        String.new(raw.capitalize)
      end

      def code_characters
        List.new(raw.chars)
      end

      def code_bytes
        List.new(raw.bytes)
      end

      def code_chomp
        String.new(raw.chomp)
      end

      def code_chop
        String.new(raw.chop)
      end

      def code_delete(value)
        code_value = value.to_code
        String.new(raw.delete(code_value.raw))
      end

      def code_delete_prefix(value)
        code_value = value.to_code
        String.new(raw.delete_prefix(code_value.raw))
      end

      def code_delete_suffix(value)
        code_value = value.to_code
        String.new(raw.delete_suffix(code_value.raw))
      end

      def code_empty?
        Boolean.new(raw.empty?)
      end

      def code_get(value)
        code_value = value.to_code
        raw[code_value.raw].to_code
      end

      def code_include?(value)
        code_value = value.to_code
        Boolean.new(raw.include?(code_value.raw))
      end

      def code_index(value)
        code_value = value.to_code
        raw.index(code_value.raw).to_code
      end

      def code_last(n = nil)
        code_n = n.to_code
        code_n = Integer.new(1) if code_n.nothing?
        String.new(raw.last(code_n.raw))
      end

      def code_lines
        List.new(raw.lines)
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

      def code_right_index(value)
        code_value = value.to_code
        raw.rindex(code_value.raw).to_code
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

      def code_squish
        String.new(raw.squish)
      end

      def code_substitute(from = nil, to = nil)
        code_substitute_all(from, to)
      end

      def code_substitute!(from = nil, to = nil)
        code_substitute_all!(from, to)
      end

      def code_substitute_all(from = nil, to = nil)
        code_from = from.to_code
        code_to = to.to_code

        String.new(raw.gsub(code_from.to_s, code_to.to_s))
      end

      def code_substitute_all!(from = nil, to = nil)
        self.raw = code_substitute_all(from, to).raw
        self
      end

      def code_substitute_once(from = nil, to = nil)
        code_from = from.to_code
        code_to = to.to_code

        String.new(raw.sub(code_from.to_s, code_to.to_s))
      end

      def code_substitute_once!(from = nil, to = nil)
        self.raw = code_substitute_once(from, to).raw
        self
      end

      def code_swapcase
        String.new(raw.swapcase)
      end

      def code_titleize
        String.new(raw.titleize)
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
      rescue ArgumentError, Encoding::CompatibilityError => e
        raise unless e.message.include?("invalid byte sequence")

        String.new(sanitized_utf8_raw.strip)
      end

      def code_left_strip
        String.new(raw.lstrip)
      end

      def code_right_strip
        String.new(raw.rstrip)
      end

      def code_slice(*arguments)
        code_arguments = arguments.to_code.raw

        if code_arguments.first.is_a?(Range)
          code_range = code_arguments.first
          range =
            ::Range.new(
              code_range.code_left.to_i,
              code_range.code_right.to_i,
              code_range.exclude_end?
            )

          return raw.slice(range).to_code
        end

        raw.slice(*code_arguments.map(&:to_i)).to_code
      end

      def code_left_justify(width, padding = nil)
        code_width = width.to_code
        code_padding = padding.to_code
        code_padding = String.new(" ") if code_padding.nothing?

        String.new(raw.ljust(code_width.raw, code_padding.to_s))
      end

      def code_right_justify(width, padding = nil)
        code_width = width.to_code
        code_padding = padding.to_code
        code_padding = String.new(" ") if code_padding.nothing?

        String.new(raw.rjust(code_width.raw, code_padding.to_s))
      end

      def code_split(value)
        code_value = value.to_code

        if code_value.nothing?
          List.new(raw.split)
        else
          List.new(raw.split(code_value.to_s))
        end
      end

      def code_words
        List.new(raw.split)
      end

      def present?
        raw.present?
      end

      private

      def sanitized_utf8_raw
        raw
          .dup
          .force_encoding(::Encoding::UTF_8)
          .encode(::Encoding::UTF_8, invalid: :replace, undef: :replace)
      end
    end
  end
end
