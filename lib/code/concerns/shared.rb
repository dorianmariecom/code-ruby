# frozen_string_literal: true

class Code
  module Concerns
    module Shared
      attr_accessor :raw, :functions

      COMPOUND_ASSIGNMENT_OPERATORS = [
        "+=",
        "-=",
        "*=",
        "/=",
        "%=",
        "<<=",
        ">>=",
        "&=",
        "|=",
        "^=",
        "||=",
        "&&="
      ].freeze
      SHARED_OPERATORS = [
        "present?",
        "blank?",
        "presence",
        "presence_in",
        "is_a?",
        "is_an?",
        "kind_of?",
        "instance_of?",
        "new",
        "!",
        "not",
        "!=",
        "different",
        "&&",
        "and",
        "+",
        "self",
        "..",
        "inclusive_range",
        "...",
        "exclusive_range",
        "==",
        "equal",
        "equal?",
        "same_object?",
        ">",
        "greater",
        ">=",
        "greater_or_equal",
        "<=>",
        "compare",
        "<",
        "less",
        "<=",
        "less_or_equal",
        "===",
        "strict_equal",
        "!==",
        "strict_different",
        "falsy?",
        "truthy?",
        "true?",
        "false?",
        "||",
        "or",
        "to_boolean",
        "to_class",
        "to_date",
        "to_decimal",
        "to_dictionary",
        "to_duration",
        "to_integer",
        "to_list",
        "to_nothing",
        "to_range",
        "to_string",
        "inspect",
        "to_time",
        "as_json",
        "duplicate",
        "deep_duplicate",
        "to_parameter",
        "to_json",
        "functions",
        "instance_functions",
        "class_functions",
        "respond_to?",
        "send",
        "itself",
        "tap",
        "then",
        "name",
        "nothing?",
        "something?"
      ].freeze
      OPERATOR_METHOD_ALIASES = {
        "[]" => "get",
        "at" => "get",
        "length" => "size",
        "member?" => "include?",
        "key?" => "has_key?",
        "value?" => "has_value?",
        "filter" => "select",
        "filter!" => "select!"
      }.freeze

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first
        stored_value = code_dynamic_functions.code_fetch(code_operator)

        if stored_value.is_a?(Object::Function)
          return stored_value.call(**args, operator: nil, bound_self: self)
        end

        case code_operator.to_s
        when "present?"
          sig(args)
          code_present?
        when "blank?"
          sig(args)
          code_blank?
        when "presence"
          sig(args)
          code_presence
        when "presence_in"
          sig(args) { Object::List }
          code_presence_in(code_value)
        when "is_a?", "is_an?", "kind_of?"
          sig(args) { Object::Class }
          code_is_a?(code_value)
        when "instance_of?"
          sig(args) { Object::Class }
          code_instance_of?(code_value)
        when "new"
          sig(args) { Object.repeat }
          code_new(*code_arguments.raw)
        when "!", "not"
          sig(args)
          code_exclamation_mark
        when "!=", "different"
          sig(args) { Object }
          code_different(code_value)
        when "&&", "and"
          sig(args) { Object }
          code_and(code_value)
        when "+", "self"
          sig(args)
          code_self
        when "..", "inclusive_range"
          sig(args) { Object }
          code_inclusive_range(code_value)
        when "...", "exclusive_range"
          sig(args) { Object }
          code_exclusive_range(code_value)
        when "==", "equal", "equal?"
          sig(args) { Object }
          code_equal(code_value)
        when "same_object?"
          sig(args) { Object }
          code_same_object?(code_value)
        when ">", "greater"
          sig(args) { Object }
          code_greater(code_value)
        when ">=", "greater_or_equal"
          sig(args) { Object }
          code_greater_or_equal(code_value)
        when "<=>", "compare"
          sig(args) { Object }
          code_compare(code_value)
        when "<", "less"
          sig(args) { Object }
          code_less(code_value)
        when "<=", "less_or_equal"
          sig(args) { Object }
          code_less_or_equal(code_value)
        when "===", "strict_equal"
          sig(args) { Object }
          code_strict_equal(code_value)
        when "!==", "strict_different"
          sig(args) { Object }
          code_strict_different(code_value)
        when "falsy?"
          sig(args)
          code_falsy?
        when "truthy?"
          sig(args)
          code_truthy?
        when "true?"
          sig(args)
          code_true?
        when "false?"
          sig(args)
          code_false?
        when "||", "or"
          sig(args) { Object }
          code_or(code_value)
        when "to_boolean"
          sig(args)
          code_to_boolean
        when "to_class"
          sig(args)
          code_to_class
        when "to_date"
          sig(args)
          code_to_date
        when "to_decimal"
          sig(args)
          code_to_decimal
        when "to_dictionary"
          sig(args)
          code_to_dictionary
        when "to_duration"
          sig(args)
          code_to_duration
        when "to_integer"
          sig(args)
          code_to_integer
        when "to_list"
          sig(args)
          code_to_list
        when "to_nothing"
          sig(args)
          code_to_nothing
        when "to_range"
          sig(args)
          code_to_range
        when "to_string"
          sig(args)
          code_to_string
        when "inspect"
          sig(args)
          code_inspect
        when "to_time"
          sig(args)
          code_to_time
        when "as_json"
          sig(args)
          code_as_json
        when "duplicate"
          sig(args)
          code_duplicate
        when "deep_duplicate"
          sig(args)
          code_deep_duplicate
        when "to_parameter"
          sig(args)
          code_to_parameter
        when "to_json"
          sig(args) { { pretty: Object::Boolean.maybe } }

          if code_arguments.any?
            code_to_json(pretty: code_value.code_get(:pretty))
          else
            code_to_json
          end
        when "functions"
          sig(args)
          code_functions
        when "instance_functions"
          sig(args)
          code_instance_functions
        when "class_functions"
          sig(args)
          code_class_functions
        when "respond_to?"
          sig(args) { Object }
          code_respond_to?(code_value)
        when "send"
          sig(args) { [Object, Object.repeat] }
          code_send(*code_arguments.raw, **args)
        when "itself"
          sig(args)
          code_itself
        when "tap"
          sig(args) { Object::Function }
          code_tap(code_value, **args)
        when "then"
          sig(args) { Object::Function }
          code_then(code_value, **args)
        when "name"
          sig(args)
          code_name
        when "nothing?"
          sig(args)
          code_nothing?
        when "something?"
          sig(args)
          code_something?
        when /=$/
          sig(args) { Object }

          if code_operator.to_s == "="
            code_context = args.fetch(:context)
            code_context.code_set(self, code_value)
          elsif setter_operator?(code_operator)
            code_dynamic_functions.code_set(code_operator.to_s.chop, code_value)
            code_value
          else
            code_context = args.fetch(:context).code_lookup!(self)
            code_context.code_set(
              self,
              code_context.code_fetch(self).call(
                **args,
                operator: code_operator.to_s.chop,
                arguments: Object::List.new([code_value])
              )
            )
          end

          code_context.code_fetch(self)
        else
          raise(
            Error,
            "#{code_operator.inspect} not defined on #{code_inspect}:#{code_name}"
          )
        end
      end

      def <=>(other)
        code_other = other.to_code
        return -1 if self.class != code_other.class

        raw <=> code_other.raw
      end

      def ==(other)
        code_other = other.to_code
        return false if self.class != code_other.class

        raw == code_other.raw
      end

      def eql?(other)
        code_other = other.to_code
        return false if self.class != code_other.class

        raw.eql?(code_other.raw)
      end

      def code_and(other)
        code_other = other.to_code

        truthy? ? code_other : self
      end

      def code_different(other)
        code_other = other.to_code

        Object::Boolean.new(self != code_other)
      end

      def code_equal(other)
        code_other = other.to_code

        Object::Boolean.new(self == code_other)
      end

      def code_compare(other)
        code_other = other.to_code

        Object::Integer.new(self <=> code_other)
      end

      def code_greater(other)
        code_other = other.to_code

        Object::Boolean.new((self <=> code_other).positive?)
      end

      def code_greater_or_equal(other)
        code_other = other.to_code

        Object::Boolean.new((self <=> code_other) >= 0)
      end

      def code_less(other)
        code_other = other.to_code

        Object::Boolean.new((self <=> code_other).negative?)
      end

      def code_less_or_equal(other)
        code_other = other.to_code

        Object::Boolean.new((self <=> code_other) <= 0)
      end

      def code_exclamation_mark
        Object::Boolean.new(falsy?)
      end

      def code_exclusive_range(value)
        code_value = value.to_code

        Object::Range.new(self, code_value, exclude_end: true)
      end

      def code_inclusive_range(value)
        code_value = value.to_code

        Object::Range.new(self, code_value, exclude_end: false)
      end

      def code_or(other)
        code_other = other.to_code

        truthy? ? self : code_other
      end

      def code_self
        self
      end

      def code_strict_equal(other)
        code_other = other.to_code

        Object::Boolean.new(self === code_other)
      end

      def code_strict_different(other)
        code_other = other.to_code

        Object::Boolean.new(!(self === code_other))
      end

      def falsy?
        !truthy?
      end

      def hash
        [self.class, raw].hash
      end

      def multi_fetch(hash, *keys)
        keys.to_h { |key| [key, hash.fetch(key)] }
      end

      def sig(args, &block)
        Type::Sig.sig(args, object: self, &block)

        Object::Nothing.new
      end

      def truthy?
        true
      end

      def to_json(...)
        as_json(...).to_json(...)
      end

      def as_json(...)
        raw.as_json(...)
      end

      def code_to_json(pretty: nil)
        if Object::Boolean.new(pretty).truthy?
          Object::String.new(::JSON.pretty_generate(self))
        else
          Object::String.new(to_json)
        end
      end

      def code_as_json
        as_json.to_code
      end

      def to_code
        self
      end

      def succ
        self.class.new(raw.succ)
      end

      def code_duplicate
        self.class.new(self)
      end

      def code_deep_duplicate
        self.class.new(self)
      end

      def self.code_fetch(...)
        Object::Nothing.new
      end

      def self.code_set(...)
        Object::Nothing.new
      end

      def self.code_get(...)
        Object::Nothing.new
      end

      def code_fetch(key)
        code_dynamic_functions.code_fetch(key)
      end

      def code_set(key, value)
        code_dynamic_functions.code_set(key, value)
      end

      def code_get(key)
        code_dynamic_functions.code_get(key)
      end

      def code_has_key?(key)
        code_dynamic_functions.code_has_key?(key)
      end

      def code_to_parameter
        code_to_string.code_parameterize
      end

      def to_s
        code_to_string.raw
      end

      def to_i
        code_to_integer.raw
      end

      def inspect
        code_inspect.raw
      end

      def code_nothing?
        Object::Boolean.new(nothing?)
      end

      def code_something?
        Object::Boolean.new(something?)
      end

      def nothing?
        false
      end

      def something?
        !nothing?
      end

      def code_falsy?
        Object::Boolean.new(falsy?)
      end

      def code_truthy?
        Object::Boolean.new(truthy?)
      end

      def code_true?
        Object::Boolean.new(self == Object::Boolean.new(true))
      end

      def code_false?
        Object::Boolean.new(self == Object::Boolean.new(false) || nothing?)
      end

      def code_to_boolean
        Object::Boolean.new(self)
      end

      def code_to_class
        Object::Class.new(self)
      end

      def code_to_date
        Object::Date.new(self)
      end

      def code_to_decimal
        Object::Decimal.new(self)
      end

      def code_to_dictionary
        Object::Dictionary.new(self)
      end

      def code_to_duration
        Object::Duration.new(self)
      end

      def code_to_integer
        Object::Integer.new(self)
      end

      def code_to_list
        Object::List.new(self)
      end

      def code_to_nothing
        Object::Nothing.new(self)
      end

      def code_to_range
        Object::Range.new(self)
      end

      def code_to_string
        Object::String.new(self)
      end

      def code_to_time
        Object::Time.new(self)
      end

      def code_inspect
        code_to_string
      end

      def code_name
        Object::String.new(name.to_s.split("::")[2..].join("::"))
      end

      def code_functions
        code_instance_functions.code_merge(code_class_functions)
      end

      def code_instance_functions
        Object.documented_functions_for(self.class, :instance).code_merge(
          dynamic_functions_documentation
        )
      end

      def code_class_functions
        dynamic_functions_documentation
      end

      def code_respond_to?(operator)
        code_operator = operator.to_code

        Object::Boolean.new(code_respond_to_operator?(code_operator))
      end

      def code_is_a?(klass)
        code_klass = klass.to_code

        Object::Boolean.new(is_a?(code_klass.raw))
      end

      def code_instance_of?(klass)
        code_klass = klass.to_code

        Object::Boolean.new(instance_of?(code_klass.raw))
      end

      def code_same_object?(other)
        code_other = other.to_code

        Object::Boolean.new(equal?(code_other))
      end

      def code_itself
        self
      end

      def code_send(operator, *arguments, **globals)
        code_operator = operator.to_code

        call(
          **globals,
          arguments: Object::List.new(arguments),
          operator: code_operator
        )
      end

      def code_tap(function, **globals)
        code_function = function.to_code
        code_function.call(
          **globals,
          arguments: Object::List.new([self]),
          operator: nil
        )
        self
      end

      def code_then(function, **globals)
        code_function = function.to_code
        code_function.call(
          **globals,
          arguments: Object::List.new([self]),
          operator: nil
        )
      end

      def present?
        true
      end

      def blank?
        !present?
      end

      def code_present?
        Object::Boolean.new(present?)
      end

      def code_blank?
        Object::Boolean.new(blank?)
      end

      def code_presence
        present? ? self : Object::Nothing.new
      end

      def code_presence_in(list = [])
        code_list = list.to_code

        code_list.code_include?(self).truthy? ? self : Object::Nothing.new
      end

      def code_documentable_functions
        Object::Dictionary.new(
          code_dynamic_functions.raw.merge(dictionary_attributes)
        )
      end

      private

      def setter_operator?(operator)
        !COMPOUND_ASSIGNMENT_OPERATORS.include?(operator.to_s)
      end

      def code_respond_to_operator?(operator)
        operator_name = operator.to_s

        SHARED_OPERATORS.include?(operator_name) ||
          code_operator_method_defined?(operator_name) ||
          code_functions.code_has_key?(operator).truthy?
      end

      def code_operator_method_defined?(operator_name)
        method_name = :"code_#{OPERATOR_METHOD_ALIASES.fetch(operator_name, operator_name)}"
        return false unless respond_to?(method_name)

        method(method_name).owner != Shared
      end

      def code_dynamic_functions
        self.functions = Object::Dictionary.new if functions.blank?

        functions
      end

      def dynamic_functions_documentation
        Object::Dictionary.new(
          code_documentable_functions.raw.to_h do |key, value|
            name = key.to_s
            [
              name,
              Object::Dictionary.new(
                "name" => Object::String.new(name),
                "description" => Object::String.new(
                  dynamic_function_description(value)
                ),
                "examples" => Object::List.new(dynamic_function_examples(value)),
                "function" => value
              )
            ]
          end
        )
      end

      def dictionary_attributes
        return {} unless is_a?(Object::Dictionary)

        raw
      end

      def dynamic_function_description(value)
        code_value = value.to_code
        return "" unless code_value.is_a?(Object::Function)

        code_value.documentation.code_get("description").to_s
      end

      def dynamic_function_examples(value)
        code_value = value.to_code
        return [] unless code_value.is_a?(Object::Function)

        code_value.documentation.code_get("examples").to_code.code_to_list.raw
      end
    end
  end
end
