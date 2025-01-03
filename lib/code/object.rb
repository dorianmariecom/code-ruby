# frozen_string_literal: true

class Code
  class Object
    NUMBER_CLASSES = [
      Integer,
      Decimal,
      String,
      ::Integer,
      ::Float,
      ::String,
      ::BigDecimal
    ].freeze

    attr_reader :raw

    delegate :to_s, :inspect, to: :raw

    def initialize(...)
    end

    def self.nothing?
      false
    end

    def nothing?
      false
    end

    def self.maybe
      Type::Maybe.new(self)
    end

    def self.repeat(minimum = 0, maximum = nil)
      Type::Repeat.new(self, minimum:, maximum:)
    end

    def self.|(other)
      Type::Or.new(self, other)
    end

    def self.call(**args)
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
        code_and_operator(code_value)
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
        Boolean.new(falsy?)
      when "truthy?"
        sig(args)
        Boolean.new(truthy?)
      when "||", "or"
        sig(args) { Object }
        code_or_operator(code_value)
      when "to_boolean"
        sig(args)
        Boolean.new(self)
      when "to_class"
        sig(args)
        Class.new(self)
      when "to_date"
        sig(args)
        Date.new(self)
      when "to_decimal"
        sig(args)
        Decimal.new(self)
      when "to_dictionary"
        sig(args)
        Dictionary.new(self)
      when "to_duration"
        sig(args)
        Duration.new(self)
      when "to_integer"
        sig(args)
        Integer.new(self)
      when "to_list"
        sig(args)
        List.new(self)
      when "to_nothing"
        sig(args)
        Nothing.new(self)
      when "to_range"
        sig(args)
        Range.new(self)
      when "to_string"
        sig(args)
        String.new(self)
      when "to_time"
        sig(args)
        Time.new(self)
      when "as_json"
        sig(args)
        code_as_json
      when "to_json"
        sig(args) { { pretty: Boolean.maybe } }

        if code_arguments.any?
          code_to_json(pretty: code_value.code_get(:pretty))
        else
          code_to_json
        end
      when /=$/
        sig(args) { Object }

        if code_operator.to_s == "="
          code_context = args.fetch(:context)
          code_context.code_set(self, value)
        else
          code_context = args.fetch(:context).code_lookup!(self)
          code_context.code_set(
            self,
            code_context.code_fetch(self).call(
              **args,
              operator: operator.to_s.chop,
              arguments: List.new([code_value])
            )
          )
        end

        context.code_fetch(self)
      else
        raise(Error, "#{code_operator.inspect} not defined on #{inspect}:Class")
      end
    end

    def self.code_new(*arguments)
      code_arguments = arguments.to_code

      new(*code_arguments.raw)
    end

    def self.code_and_operator(other)
      code_other = other.to_code

      truthy? ? code_other : self
    end

    def self.code_different(other)
      code_other = other.to_code

      Boolean.new(self != code_other)
    end

    def self.code_equal_equal(other)
      code_other = other.to_code

      Boolean.new(self == code_other)
    end

    def self.code_exclamation_point
      Boolean.new(falsy?)
    end

    def self.code_exclusive_range(value)
      code_value = value.to_code

      Range.new(self, code_value, exclude_end: true)
    end

    def self.code_inclusive_range(value)
      code_value = value.to_code

      Range.new(self, code_value, exclude_end: false)
    end

    def self.code_or_operator(other)
      code_other = other.to_code

      truthy? ? self : code_other
    end

    def self.code_self
      self
    end

    def self.code_equal_equal_equal(other)
      code_other = other.to_code

      Boolean.new(self === code_other)
    end

    def self.falsy?
      !truthy?
    end

    def self.multi_fetch(hash, *keys)
      keys.to_h { |key| [key, hash.fetch(key)] }
    end

    def self.sig(args, &)
      Type::Sig.sig(args, object: self, &)

      Nothing.new
    end

    def self.to_s
      name
    end

    def self.inspect
      name
    end

    def self.truthy?
      true
    end

    def self.to_json(...)
      as_json(...).to_json(...)
    end

    def self.as_json(...)
      name.as_json(...)
    end

    def self.code_to_json(pretty: nil)
      if Boolean.new(pretty).truthy?
        String.new(::JSON.pretty_generate(self))
      else
        String.new(to_json)
      end
    end

    def self.code_as_json
      to_ruby.as_json.to_code
    end

    def <=>(other)
      code_other = other.to_code

      raw <=> code_other.raw
    end

    def ==(other)
      code_other = other.to_code

      raw == code_other.raw
    end
    alias eql? ==

    def call(**args)
      code_operator = args.fetch(:operator, nil).to_code
      code_arguments = args.fetch(:arguments, []).to_code
      code_value = code_arguments.code_first

      case code_operator.to_s
      when "!", "not"
        sig(args)
        code_exclamation_point
      when "!=", "different"
        sig(args) { Object }
        code_different(code_value)
      when "&&", "and"
        sig(args) { Object }
        code_and_operator(code_value)
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
        Boolean.new(falsy?)
      when "truthy?"
        sig(args)
        Boolean.new(truthy?)
      when "||", "or"
        sig(args) { Object }
        code_or_operator(code_value)
      when "to_boolean"
        sig(args)
        Boolean.new(self)
      when "to_class"
        sig(args)
        Class.new(self)
      when "to_date"
        sig(args)
        Date.new(self)
      when "to_decimal"
        sig(args)
        Decimal.new(self)
      when "to_duration"
        sig(args)
        Duration.new(self)
      when "to_dictionary"
        sig(args)
        Dictionary.new(self)
      when "to_integer"
        sig(args)
        Integer.new(self)
      when "to_list"
        sig(args)
        List.new(self)
      when "to_nothing"
        sig(args)
        Nothing.new(self)
      when "to_range"
        sig(args)
        Range.new(self)
      when "to_string"
        sig(args)
        String.new(self)
      when "to_time"
        sig(args)
        Time.new(self)
      when "as_json"
        sig(args)
        code_as_json
      when "to_json"
        sig(args) { { pretty: Boolean.maybe } }

        if code_arguments.any?
          code_to_json(pretty: code_value.code_get(:pretty))
        else
          code_to_json
        end
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
              arguments: List.new([code_value])
            )
          )
        end

        code_context.code_fetch(self)
      else
        raise(
          Error,
          "#{code_operator.inspect} not defined on #{inspect}:#{self.class.name}"
        )
      end
    end

    def code_and_operator(other)
      code_other = other.to_code

      truthy? ? code_other : self
    end

    def code_different(other)
      code_other = other.to_code

      Boolean.new(self != code_other)
    end

    def code_equal_equal(other)
      code_other = other.to_code

      Boolean.new(self == code_other)
    end

    def code_exclamation_point
      Boolean.new(falsy?)
    end

    def code_exclusive_range(value)
      code_value = value.to_code

      Range.new(self, code_value, exclude_end: true)
    end

    def code_inclusive_range(value)
      code_value = value.to_code

      Range.new(self, code_value, exclude_end: false)
    end

    def code_or_operator(other)
      code_other = other.to_code

      truthy? ? self : code_other
    end

    def code_self
      self
    end

    def code_equal_equal_equal(other)
      code_other = other.to_code

      Boolean.new(self === code_other)
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

    def sig(args, &)
      Type::Sig.sig(args, object: self, &)

      Nothing.new
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
      if Boolean.new(pretty).truthy?
        String.new(::JSON.pretty_generate(self))
      else
        String.new(to_json)
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
  end
end
