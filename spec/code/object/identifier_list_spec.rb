# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::IdentifierList do
  it "assigns square bracket keys in parent context from nested scopes" do
    parent_context = Code::Object::Context.new
    child_context = Code::Object::Context.new({}, parent_context)
    code_identifier = Code::Object::String.new("github")
    code_index = Code::Object::Integer.new(1)

    parent_context.code_set(code_identifier, Code::Object::Dictionary.new(a: 1))

    identifier_list = described_class.new([code_identifier, code_index])

    identifier_list.call(
      operator: "=",
      arguments: Code::Object::List.new([Code::Object::Integer.new(2)]),
      context: child_context,
      error: StringIO.new,
      input: StringIO.new,
      object: Code::Object::Global.new,
      output: StringIO.new,
      source: ""
    )

    expect(parent_context.code_fetch(code_identifier).code_fetch(code_index)).to eq(
      Code::Object::Integer.new(2)
    )
  end

  it "keeps context for ||= assignments in nested context receivers" do
    code_context = Code::Object::Context.new
    code_identifier = Code::Object::String.new("value")
    code_key = Code::Object::String.new("key")

    code_context.code_set(
      code_identifier,
      Code::Object::Dictionary.new(code_key => Code::Object::Dictionary.new(a: 1))
    )

    identifier_list = described_class.new([code_identifier, code_key])

    expect do
      identifier_list.send(
        :assign_in_context,
        context: code_context,
        assignment_operator: "||=",
        code_value: Code::Object::Dictionary.new(b: 2),
        arguments: Code::Object::List.new([Code::Object::Dictionary.new(b: 2)]),
        operator: "||=",
        error: StringIO.new,
        input: StringIO.new,
        object: Code::Object::Global.new,
        output: StringIO.new,
        source: ""
      )
    end.not_to raise_error
  end
end
