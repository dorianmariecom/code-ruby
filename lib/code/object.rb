# frozen_string_literal: true

class Code
  class Object
    def self.maybe
      Type::Maybe.new(self)
    end

    def self.name
      "Object"
    end

    def self.repeat(minimum = 0, maximum = nil)
      Type::Repeat.new(self, minimum:, maximum:)
    end

    def self.|(other)
      Type::Or.new(self, other)
    end

    def self.sig(args, &block)
      Type::Sig.sig(args, object: self, &block)
      nil
    end

    def self.call(**args)
      operator = args.fetch(:operator, nil)
      arguments = args.fetch(:arguments, [])
      value = arguments.first&.value

      case operator.to_s
      when "new"
        sig(args) { Object.repeat }
        code_new(*arguments.map(&:value))
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
      when "to_string"
        sig(args)
        code_to_string
      when "truthy?"
        sig(args)
        Boolean.new(truthy?)
      when "||", "or"
        sig(args) { Object }
        code_or_operator(value)
      when "to_boolean"
      when "to_class"
          sig(args) { Object.maybe }
          value ? Class.new(value) : Class.new(Class)
        when "Date"
          sig(args) { Object.maybe }
          value ? Date.new(value) : Class.new(Date)
        when "Decimal"
          sig(args) { Object.maybe }
          value ? Decimal.new(value) : Class.new(Decimal)
        when "Dictionary"
          sig(args) { Object.maybe }
          value ? Dictionary.new(value) : Class.new(Dictionary)
        when "Function"
          sig(args) { Object.maybe }
          value ? Function.new(value) : Class.new(Function)
        when "Integer"
          sig(args) { Object.maybe }
          value ? Integer.new(value) : Class.new(Integer)
        when "List"
          sig(args) { Object.maybe }
          value ? List.new(value) : Class.new(List)
        when "Nothing"
          sig(args) { Object.maybe }
          value ? Nothing.new(value) : Class.new(Nothing)
        when "Number"
          sig(args) { Object.maybe }
          value ? Number.new(value) : Class.new(Number)
        when "Object"
          sig(args) { Object.maybe }
          value ? Object.new(value) : Class.new(Object)
        when "Range"
          sig(args) { Object.maybe }
          value ? Range.new(value) : Class.new(Range)
        when "String"
          sig(args) { Object.maybe }
          value ? String.new(value) : Class.new(String)
        when "Time"
          sig(args) { Object.maybe }
          value ? Time.new(value) : Class.new(Time)
        when "evaluate"
          sig(args) { Object }
          Code.evaluate(value.to_s)
        when "p"
          sig(args) { Object.repeat }
          output.puts(*arguments.map(&:value).map(&:inspect))
          Nothing.new
        when "print"
          sig(args) { Object.repeat }
          output.print(*arguments.map(&:value))
          Nothing.new
        when "puts"
          sig(args) { Object.repeat }
          output.puts(*arguments.map(&:value))
          Nothing.new
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
              operator: operator[..-2],
              arguments: [Argument.new(value)]
            )
          )
        end

        context.code_fetch(self)
      else
        raise(
          Code::Error::Undefined,
          "#{operator} not defined on #{inspect}:Class"
        )
      end
    end

    def self.code_new(*arguments)
      new(*arguments)
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

    def self.code_to_string
      String.new(to_s)
    end

    def self.falsy?
      !truthy?
    end

    def self.multi_fetch(hash, *keys)
      keys.map { |key| [key, hash.fetch(key)] }.to_h
    end

    def self.sig(args, &block)
      Type::Sig.sig(args, object: self, &block)
      nil
    end

    def self.name
      "Object"
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
      arguments = args.fetch(:arguments, [])
      value = arguments.first&.value

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
      when "to_string"
        sig(args)
        code_to_string
      when "truthy?"
        sig(args)
        Boolean.new(truthy?)
      when "||", "or"
        sig(args) { Object }
        code_or_operator(value)
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
              operator: operator[..-2],
              arguments: [Argument.new(value)]
            )
          )
        end

        context.code_fetch(self)
      else
        raise(
          Code::Error::Undefined,
          "#{operator} not defined on #{inspect}:#{self.class.name}"
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
      Range.new(self, value, exclude_end: true)
    end

    def code_inclusive_range(value)
      Range.new(self, value, exclude_end: false)
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

    def code_to_string
      String.new(to_s)
    end

    def falsy?
      !truthy?
    end

    def hash
      [self.class, raw].hash
    end

    def multi_fetch(hash, *keys)
      keys.map { |key| [key, hash.fetch(key)] }.to_h
    end

    def sig(args, &block)
      Type::Sig.sig(args, object: self, &block)
      nil
    end

    def to_s
      raw.to_s
    end

    def inspect
      to_s
    end

    def truthy?
      true
    end

    def to_json(...)
      as_json(...).to_json
    end

    def as_json(...)
      raw.as_json
    end
  end
end
