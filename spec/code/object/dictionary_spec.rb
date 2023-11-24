# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Dictionary do
  let(:context) { '{ first_name: "Dorian", language: :code }' }

  [
    ["{} == {}", "true"],
    ['{ "name" => "Dorian" } == { name: :Dorian }', "true"],
    %w[context.first_name :Dorian],
    ["context[:first_name]", ":Dorian"],
    %w[context.language :code],
    ["context > { first_name: :Dorian", "true"],
    ["{ first_name: :Dorian } < context", "true"],
    ["context <= context", "true"],
    ["context >= {}", "true"],
    ["context <=> context", "0"],
    ["context === context", "true"],
    ["{ first_name: :Dorian }.any? { |_, value| value == :Dorian }", "true"],
    %w[context.any?(String) true],
    ["{ a: nothing }.compact", "{}"],
    ["d = { a: nothing } d.compact! d", "{}"],
    %w[context.dig(:first_name) :Dorian],
    %w[context.empty? false],
    %w[context.truthy? true],
    %w[context.falsy? false],
    %w[context.fetch(:first_name) :Dorian],
    ["context.fetch(:unknown) { :Good }", ":Good"],
    ["context.fetch(:first_name, :language)", "context"],
    [
      "context.fetch(:first_name, :last_name) { :Marié }",
      "{ first_name: :Dorian, last_name: :Marié }"
    ],
    ["context.delete(:last_name) { true }", "true"],
    [
      "context.delete(:first_name, :language)",
      "{ first_name: :Dorian, language: :code }"
    ],
    ["{ first_name: :Dorian }.delete_if(String)", "{}"],
    ["{ age: 31 }.delete_unless(Number)", "{ age: 31 }"],
    ["{ age: 31 }.delete_unless(Integer)", "{ age: 31 }"],
    ["{ first_name: :Dorian }.delete_if { |_, value| value == :Dorian }", "{}"],
    ["{ age: 31 }.delete_unless { |key| key == :age }", "{ age: 31 }"],
    ["{ first_name: :Dorian }.keep_if(String)", "{ first_name: :Dorian }"],
    ["{ age: 31 }.keep_unless(Number)", "{}"],
    ["{ age: 31 }.keep_unless(Integer)", "{}"],
    ["{ first_name: :Dorian }.keep_if { |_, value| value != :Dorian }", "{}"],
    ["{ age: 31 }.keep_unless { |key| key == :age }", "{}"],
    ["context.except(:first_name, :language)", "{}"],
    ["context.fetch_values(:first_name, :language)", "[:Dorian, :code]"],
    ["context.fetch_values(:first_name)", "[:Dorian]"],
    %w[context.select(String) context],
    %w[context.select(Integer) {}],
    ["context.select(Integer) context", "context"],
    %w[context.select!(Integer) {}],
    ["context.select!(Integer) context", "{}"],
    [
      "context.select { |key, value, dictionnary, index| key == :first_name }",
      "{ first_name: :Dorian }"
    ],
    [
      "context.select { |key, value, dictionnary, index| value == :Dorian }",
      "{ first_name: :Dorian }"
    ],
    [
      "context.select { |key, value, dictionnary, index| dictionnary.two? }",
      "context"
    ],
    [
      "context.select { |key, value, dictionnary, index| index.zero? }",
      "{ first_name: :Dorian }"
    ],
    ["{ a: 1, b: [2, 3] }.to_list", "[[:a, 1], [:b, [2, 3]]]"],
    ["{ a: 1, b: [2, 3] }.flatten", "[:a, 1, :b, 2, 3]"],
    ["{ a: 1, b: [2, 3] }.flatten(0)", "[[:a, 1], [:b, [2, 3]]]"],
    ["{ a: 1, b: [2, 3] }.flatten(1)", "[:a, 1, :b, [2, 3]]"],
    ["{ a: 1, b: [2, 3] }.flatten(-1)", "[:a, 1, :b, 2, 3]"],
    %w[context.has_key?(:first_name) true],
    %w[context.has_key?(:unknown) false],
    %w[context.has_value?(:Dorian) true],
    %w[context.has_value?(:Unknown) false],
    ["context.invert", "{ Dorian: :first_name, code: :language }"],
    %w[context.key(:Dorian) :first_name],
    %w[context.key(:Unknown) nothing],
    ["context.key(:Unknown) { true }", "true"],
    ["{ a: 1 }.merge(b: 2)", "{ a: 1, b: 2 }"],
    ["{ a: 1 }.merge({ b: 2 })", "{ a: 1, b: 2 }"],
    ["{ a: 1 }.merge({ a: 2 })", "{ a: 2 }"],
    ["{ a: 1 }.merge({ a: 2 }) { |_, old, new| old + new }", "{ a: 3 }"]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input, context)).to eq(
        Code.evaluate(expected, context)
      )
    end
  end
end
