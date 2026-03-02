# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::IdentifierList do
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
