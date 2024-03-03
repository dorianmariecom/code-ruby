# frozen_string_literal: true

class Code
  class Parser
    class Error < Error
    end

    def initialize(input)
      @input = input
    end

    def self.parse(...)
      new(...).parse
    end

    def parse
      Code.parse(input)
    rescue Language::Parser::NotEndOfInput => e
      raise Error, e.message
    end

    private

    attr_reader :input
  end
end
