# frozen_string_literal: true

class Code
  EMPTY_STRING = ""
  GLOBALS = %i[io context object].freeze
  DEFAULT_TIMEOUT = 0

  def initialize(input, io: StringIO.new, timeout: DEFAULT_TIMEOUT, ruby: {})
    @input = input
    @parsed = Timeout.timeout(timeout) { ::Code::Parser.parse(@input).to_raw }
    @io = io
    @timeout = timeout || DEFAULT_TIMEOUT
    @ruby = ::Code::Ruby.to_code(ruby || {}).code_to_context
  end

  def self.evaluate(
    input,
    context = "",
    io: StringIO.new,
    timeout: DEFAULT_TIMEOUT,
    ruby: {}
  )
    new(input, io:, timeout:, ruby:).evaluate(context)
  end

  def evaluate(context = "")
    Timeout.timeout(timeout) do
      context =
        if context == EMPTY_STRING
          Object::Context.new
        else
          Code.evaluate(context, timeout:, io:, ruby:).code_to_context
        end

      raise(Error::IncompatibleContext) unless context.is_a?(Object::Context)

      context = context.merge(ruby)

      Node::Code.new(parsed).evaluate(context:, io:)
    end
  end

  private

  attr_reader :input, :parsed, :timeout, :io, :ruby
end
