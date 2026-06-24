# frozen_string_literal: true

class Code
  class Object
    class Regex < Object
      CLASS_DOCUMENTATION = {
        name: "Regex",
        description:
          "represents a regular expression pattern with explicit matching options.",
        examples: [
          "Regex",
          "Regex.new(\"a|b|c\")",
          "Regex.new(\"^hello\", ignore_case: true)"
        ]
      }.freeze
      INSTANCE_FUNCTIONS = {
        "match?" => {
          name: "match?",
          description: "returns whether the regex matches a string.",
          examples: [
            "Regex.new(\"a|b|c\").match?(\"b\")",
            "Regex.new(\"^hello\").match?(\"hello world\")",
            "Regex.new(\"^hello\").match?(\"say hello\")"
          ]
        },
        "source" => {
          name: "source",
          description: "returns the regex pattern source.",
          examples: [
            "Regex.new(\"a|b|c\").source",
            "Regex.new(\"^hello\").source",
            "Regex.new(\"hello\", ignore_case: true).source"
          ]
        },
        "options" => {
          name: "options",
          description: "returns the enabled regex options.",
          examples: [
            "Regex.new(\"hello\").options",
            "Regex.new(\"hello\", ignore_case: true).options.ignore_case",
            "Regex.new(\"hello\", multiple_lines: true).options.multiple_lines"
          ]
        },
        "ignore_case?" => {
          name: "ignore_case?",
          description: "returns whether the regex ignores case.",
          examples: [
            "Regex.new(\"hello\").ignore_case?",
            "Regex.new(\"hello\", ignore_case: true).ignore_case?",
            "Regex.new(\"hello\", ignore_case: false).ignore_case?"
          ]
        },
        "extended?" => {
          name: "extended?",
          description: "returns whether the regex ignores whitespace and comments.",
          examples: [
            "Regex.new(\"hello\").extended?",
            "Regex.new(\"hello\", extended: true).extended?",
            "Regex.new(\"hello\", extended: false).extended?"
          ]
        },
        "multiple_lines?" => {
          name: "multiple_lines?",
          description: "returns whether the regex matches across multiple lines.",
          examples: [
            "Regex.new(\"hello\").multiple_lines?",
            "Regex.new(\"hello\", multiple_lines: true).multiple_lines?",
            "Regex.new(\"hello\", multiple_lines: false).multiple_lines?"
          ]
        },
        "fixed_encoding?" => {
          name: "fixed_encoding?",
          description: "returns whether the regex has fixed encoding.",
          examples: [
            "Regex.new(\"hello\").fixed_encoding?",
            "Regex.new(\"hello\", fixed_encoding: true).fixed_encoding?",
            "Regex.new(\"hello\", fixed_encoding: false).fixed_encoding?"
          ]
        },
        "no_encoding?" => {
          name: "no_encoding?",
          description: "returns whether the regex has no encoding.",
          examples: [
            "Regex.new(\"hello\").no_encoding?",
            "Regex.new(\"hello\", no_encoding: true).no_encoding?",
            "Regex.new(\"hello\", no_encoding: false).no_encoding?"
          ]
        }
      }.freeze
      OPTION_FLAGS = {
        "ignore_case" => ::Regexp::IGNORECASE,
        "extended" => ::Regexp::EXTENDED,
        "multiple_lines" => ::Regexp::MULTILINE,
        "fixed_encoding" => ::Regexp::FIXEDENCODING,
        "no_encoding" => ::Regexp::NOENCODING
      }.freeze

      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance

        {}
      end

      def initialize(*args, **kargs, &_block)
        raise Error, "Regex.new: pattern is required" if args.empty?
        raise Error, "Regex.new: expected 1-2 arguments" if args.size > 2

        pattern = args.first
        option_values = {}

        if args[1]
          case args[1]
          when Dictionary
            args[1].raw.each do |key, value|
              option_values[key.to_s] =
                value.is_an?(Object) ? value.truthy? : !!value
            end
          when ::Hash
            args[1].each do |key, value|
              option_values[key.to_s] =
                value.is_an?(Object) ? value.truthy? : !!value
            end
          else
            raise Error, "Regex.new: options must be a dictionary"
          end
        end

        kargs.each do |key, value|
          option_values[key.to_s] =
            value.is_an?(Object) ? value.truthy? : !!value
        end

        options =
          option_values.reduce(0) do |flags, (name, enabled)|
            flag = OPTION_FLAGS[name]
            raise Error, "unknown regex option: #{name}" unless flag

            enabled ? flags | flag : flags
          end

        self.raw =
          if pattern.is_a?(Regex)
            ::Regexp.new(pattern.raw.source, pattern.raw.options | options)
          elsif pattern.is_a?(::Regexp)
            ::Regexp.new(pattern.source, pattern.options | options)
          else
            ::Regexp.new(pattern.to_s, options)
          end
      rescue ::RegexpError => e
        raise Error, "invalid regex: #{e.message}"
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, List.new).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "match?"
          sig(args) { String }
          code_match?(code_value)
        when "source"
          sig(args)
          code_source
        when "options"
          sig(args)
          code_options
        when "ignore_case?"
          sig(args)
          code_ignore_case?
        when "extended?"
          sig(args)
          code_extended?
        when "multiple_lines?"
          sig(args)
          code_multiple_lines?
        when "fixed_encoding?"
          sig(args)
          code_fixed_encoding?
        when "no_encoding?"
          sig(args)
          code_no_encoding?
        else
          super
        end
      end

      def code_match?(string)
        Boolean.new(raw.match?(string.to_s))
      end

      def code_source
        String.new(raw.source)
      end

      def code_options
        Dictionary.new(
          OPTION_FLAGS.transform_values { |flag| (raw.options & flag) == flag }
        )
      end

      def code_ignore_case?
        Boolean.new((raw.options & ::Regexp::IGNORECASE) == ::Regexp::IGNORECASE)
      end

      def code_extended?
        Boolean.new((raw.options & ::Regexp::EXTENDED) == ::Regexp::EXTENDED)
      end

      def code_multiple_lines?
        Boolean.new((raw.options & ::Regexp::MULTILINE) == ::Regexp::MULTILINE)
      end

      def code_fixed_encoding?
        Boolean.new(
          (raw.options & ::Regexp::FIXEDENCODING) == ::Regexp::FIXEDENCODING
        )
      end

      def code_no_encoding?
        Boolean.new((raw.options & ::Regexp::NOENCODING) == ::Regexp::NOENCODING)
      end

      def code_to_string
        code_source
      end

      def code_inspect
        String.new(raw.inspect)
      end

    end
  end
end
