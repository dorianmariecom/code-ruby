# frozen_string_literal: true

class Code
  module Concerns
    module Shared
      attr_reader :raw

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first

        case code_operator.to_s
        when "new"
          sig(args) { Object.repeat }
          code_new(*code_arguments.raw)
        when "!", "not"
          sig(args)
          code_exclamation_point
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
        when "==", "equal"
          sig(args) { Object }
          code_equal_equal(code_value)
        when "===", "strict_equal"
          sig(args) { Object }
          code_equal_equal_equal(code_value)
        when "falsy?"
          sig(args)
          code_falsy?
        when "truthy?"
          sig(args)
          code_truthy?
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
        when "name"
          sig(args)
          code_name
        when /=$/
          sig(args) { Object }

          if code_operator.to_s == "="
            code_context = args.fetch(:context)
            code_context.code_set(self, code_value)
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

        [raw, self.class] <=> [code_other.raw, code_other.class]
      end

      def ==(other)
        code_other = other.to_code

        [raw, self.class] == [code_other.raw, code_other.class]
      end

      def eql?(other)
        code_other = other.to_code

        [raw, self.class].eql?([code_other.raw, code_other.class])
      end

      def code_and(other)
        code_other = other.to_code

        truthy? ? code_other : self
      end

      def code_different(other)
        code_other = other.to_code

        Object::Boolean.new(self != code_other)
      end

      def code_equal_equal(other)
        code_other = other.to_code

        Object::Boolean.new(self == code_other)
      end

      def code_exclamation_point
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

      def code_equal_equal_equal(other)
        code_other = other.to_code

        Object::Boolean.new(self === code_other)
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

      def code_fetch(...)
        Object::Nothing.new
      end

      def code_set(...)
        Object::Nothing.new
      end

      def code_get(...)
        Object::Nothing.new
      end

      def code_to_parameter
        code_to_string.code_parameterize
      end

      def to_s
        code_to_string.raw
      end

      def inspect
        code_inspect.raw
      end

      def nothing?
        false
      end

      def code_falsy?
        Object::Boolean.new(falsy?)
      end

      def code_truthy?
        Object::Boolean.new(truthy?)
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
    end
  end
end
