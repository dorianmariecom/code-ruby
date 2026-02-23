# frozen_string_literal: true

class Code
  GLOBALS = %i[context error input object output source].freeze
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
  rescue Timeout::Error
    raise Error, "timeout"
  end

  def self.evaluate(...)
    new(...).evaluate
  end

  def self.format(source_or_tree, timeout: DEFAULT_TIMEOUT)
    parse_tree =
      if source_or_tree.is_a?(::String)
        parse(source_or_tree, timeout: timeout)
      else
        source_or_tree
      end

    Format.format(parse_tree)
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
  rescue Timeout::Error
    raise Error, "timeout"
  rescue Interrupt
    raise Error, "interrupt"
  end

  private

  attr_reader :context, :error, :input, :object, :output, :source, :timeout
end
