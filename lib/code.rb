# frozen_string_literal: true

class Code
  GLOBALS = %i[context error input object output source object].freeze
  DEFAULT_TIMEOUT = 0

  def initialize(
    source,
    context: Object::Context.new,
    error: StringIO.new,
    input: StringIO.new,
    object: Object::Global.new,
    output: StringIO.new,
    timeout: DEFAULT_TIMEOUT
  )
    @context = context
    @error = error
    @input = input
    @object = object
    @output = output
    @source = source
    @timeout = timeout
  end

  def self.parse(source, timeout: DEFAULT_TIMEOUT)
    Timeout.timeout(timeout) { Parser.parse(source).to_raw }
  end

  def self.evaluate(...)
    new(...).evaluate
  end

  def evaluate
    Timeout.timeout(timeout) do
      Node::Code.new(Code.parse(source)).evaluate(
        context: context,
        error: error,
        input: input,
        object: object,
        output: output,
        source: source,
        timeout: timeout
      )
    end
  end

  private

  attr_reader :context, :error, :input, :object, :output, :source, :timeout
end
