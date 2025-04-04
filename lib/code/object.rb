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

    include Concerns::Shared
    extend Concerns::Shared

    def initialize(...)
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

    def self.code_new(*)
      new(*)
    end

    def name
      self.class.name
    end

    def code_new(*)
      self.class.code_new(*)
    end
  end
end
