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
          "#{operator} not defined on #{inspect}:Class"
        )
      end
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
      unless respond_to?(:raw)
        raise NotImplementedError, "#{self.class.name}#hash"
      end

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
      raise NotImplementedError, "#{self.class.name}#to_s"
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
      raise NotImplementedError, "#{self.class}#as_json"
    end
  end
end
