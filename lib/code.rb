# frozen_string_literal: true

class Code
  EMPTY_STRING = ""
  GLOBALS = %i[output error context object].freeze
  DEFAULT_TIMEOUT = 0

  def initialize(
    input,
    output: StringIO.new,
    error: StringIO.new,
    timeout: DEFAULT_TIMEOUT
  )
    @input = input
    @parsed = Timeout.timeout(timeout) { ::Code::Parser.parse(input).to_raw }
    @output = output
    @error = error
    @timeout = timeout || DEFAULT_TIMEOUT
  end

  def self.evaluate(
    input,
    context = EMPTY_STRING,
    output: StringIO.new,
    error: StringIO.new,
    timeout: DEFAULT_TIMEOUT
  )
    new(input, output:, error:, timeout:).evaluate(context)
  end

  def evaluate(context = EMPTY_STRING)
    Timeout.timeout(timeout) do
      context =
        if context == EMPTY_STRING
          Object::Context.new
        else
          Code.evaluate(
            context,
            timeout:,
            output:,
            error:,
          ).code_to_context
        end

      Node::Code.new(parsed).evaluate(context:, output:, error:)
    end
  end

  private

  attr_reader :input, :parsed, :timeout, :output, :error
end
