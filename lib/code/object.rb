# frozen_string_literal: true

class Code
  class Object
    attr_reader :raw

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
      operator = args.fetch(:operator, nil)
      arguments = args.fetch(:arguments, List.new)
      value = arguments.code_first

      case operator.to_s
      when "new"
        sig(args) { Object.repeat }
        code_new(*arguments.raw)
      when "!", "not"
        sig(args)
        code_exclamation_point
      when "!=", "different"
        sig(args) { Object }
        code_different(value)
      when "&&", "and"
        sig(args) { Object }
        code_and_operator(value)
      when "+", "self"
        sig(args)
        code_self
      when "..", "inclusive_range"
        sig(args) { Object }
        code_inclusive_range(value)
      when "...", "exclusive_range"
        sig(args) { Object }
        code_exclusive_range(value)
      when "==", "equal"
        sig(args) { Object }
        code_equal_equal(value)
      when "===", "strict_equal"
        sig(args) { Object }
        code_equal_equal_equal(value)
      when "falsy?"
        sig(args)
        Boolean.new(falsy?)
      when "truthy?"
        sig(args)
        Boolean.new(truthy?)
      when "||", "or"
        sig(args) { Object }
        code_or_operator(value)
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
        Time.zone.local(self)
      when "as_json"
        sig(args)
        code_as_json
      when "to_json"
        sig(args) { { pretty: Boolean.maybe } }
        if arguments.any?
          code_to_json(pretty: value.code_get(String.new(:pretty)))
        else
          code_to_json
        end
      when /=$/
        sig(args) { Object }

        if operator == "="
          context = args[:context]
          context.code_set(self, value)
        else
          context = args[:context].lookup!(self)
          context.code_set(
            self,
            context.code_fetch(self).call(
              **args,
              operator: operator.chop,
              arguments: List.new([value])
            )
          )
        end

        context.code_fetch(self)
      else
        raise(
          Error::Undefined,
          "#{operator.inspect} not defined on #{inspect}:Class"
        )
      end
    end

    def self.code_new(*)
      new(*)
    end

    def self.code_and_operator(other)
      truthy? ? other : self
    end

    def self.code_different(other)
      Boolean.new(self != other)
    end

    def self.code_equal_equal(other)
      Boolean.new(self == other)
    end

    def self.code_exclamation_point
      Boolean.new(falsy?)
    end

    def self.code_exclusive_range(value)
      Range.new(self, value, exclude_end: true)
    end

    def self.code_inclusive_range(value)
      Range.new(self, value, exclude_end: false)
    end

    def self.code_or_operator(other)
      truthy? ? self : other
    end

    def self.code_self
      self
    end

    def self.code_equal_equal_equal(other)
      Boolean.new(self === other)
    end

    def self.falsy?
      !truthy?
    end

    def self.multi_fetch(hash, *keys)
      keys.to_h { |key| [key, hash.fetch(key)] }
    end

    def self.sig(args, &)
      Type::Sig.sig(args, object: self, &)
      nil
    end

    def self.to_s
      name
    end

    def self.inspect
      to_s
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
      Json.to_code(as_json)
    end

    def <=>(other)
      if respond_to?(:raw)
        raw <=> (other.respond_to?(:raw) ? other.raw : other)
      else
        other <=> self
      end
    end

    def ==(other)
      if respond_to?(:raw)
        raw == (other.respond_to?(:raw) ? other.raw : other)
      else
        other == self
      end
    end
    alias eql? ==

    def call(**args)
      operator = args.fetch(:operator, nil)
      arguments = args.fetch(:arguments, List.new)
      value = arguments.code_first

      case operator.to_s
      when "!", "not"
        sig(args)
        code_exclamation_point
      when "!=", "different"
        sig(args) { Object }
        code_different(value)
      when "&&", "and"
        sig(args) { Object }
        code_and_operator(value)
      when "+", "self"
        sig(args)
        code_self
      when "..", "inclusive_range"
        sig(args) { Object }
        code_inclusive_range(value)
      when "...", "exclusive_range"
        sig(args) { Object }
        code_exclusive_range(value)
      when "==", "equal"
        sig(args) { Object }
        code_equal_equal(value)
      when "===", "strict_equal"
        sig(args) { Object }
        code_equal_equal_equal(value)
      when "falsy?"
        sig(args)
        Boolean.new(falsy?)
      when "truthy?"
        sig(args)
        Boolean.new(truthy?)
      when "||", "or"
        sig(args) { Object }
        code_or_operator(value)
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
        Time.zone.local(self)
      when "as_json"
        sig(args)
        code_as_json
      when "to_json"
        sig(args) { { pretty: Boolean.maybe } }
        if arguments.any?
          code_to_json(pretty: value.code_get(String.new(:pretty)))
        else
          code_to_json
        end
      when /=$/
        sig(args) { Object }

        if operator == "="
          context = args[:context]
          context.code_set(self, value)
        else
          context = args[:context].lookup!(self)
          context.code_set(
            self,
            context.code_fetch(self).call(
              **args,
              operator: operator.chop,
              arguments: List.new([value])
            )
          )
        end

        context.code_fetch(self)
      else
        raise(
          Error::Undefined,
          "#{operator.inspect} not defined on #{inspect}:#{self.class.name}"
        )
      end
    end

    def code_and_operator(other)
      truthy? ? other : self
    end

    def code_different(other)
      Boolean.new(self != other)
    end

    def code_equal_equal(other)
      Boolean.new(self == other)
    end

    def code_exclamation_point
      Boolean.new(falsy?)
    end

    def code_exclusive_range(value)
      Range.new(
        self,
        value,
        Dictionary.new({ String.new(:exclude_end) => Boolean.new(true) })
      )
    end

    def code_inclusive_range(value)
      Range.new(
        self,
        value,
        Dictionary.new({ String.new(:exclude_end) => Boolean.new(false) })
      )
    end

    def code_or_operator(other)
      truthy? ? self : other
    end

    def code_self
      self
    end

    def code_equal_equal_equal(other)
      Boolean.new(self === other)
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
      nil
    end

    delegate :to_s, to: :raw

    def inspect
      to_s
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
      Json.to_code(as_json)
    end

    def succ
      raw.respond_to?(:succ) ? self.class.new(raw.succ) : self.class.new(self)
    end
  end
end
