# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Object::Dictionary do
  let(:dictionary) { 'dictionary = { first_name: "Dorian", language: :code }' }

  [
    [
      "dictionary.select { |key, value, dictionnary, index| key == :first_name }",
      "{ first_name: :Dorian }"
    ],
    [
      "dictionary.select { |key, value, dictionnary, index| value == :Dorian }",
      "{ first_name: :Dorian }"
    ],
    [
      "dictionary.select { |key, value, dictionnary, index| dictionnary.two? }",
      "dictionary"
    ],
    [
      "dictionary.select { |key, value, dictionnary, index| index.zero? }",
      "{ first_name: :Dorian }"
    ],
    [
      "dictionary.fetch(:first_name, :last_name) { :Marié }",
      "{ first_name: :Dorian, last_name: :Marié }"
    ],
    ["dictionary.delete(:last_name) { true }", "true"],
    [
      "dictionary.delete(:first_name, :language)",
      "{ first_name: :Dorian, language: :code }"
    ],
    %w[dictionary.any?(String) true],
    %w[dictionary.dig(:first_name) :Dorian],
    %w[dictionary.empty? false],
    %w[dictionary.falsy? false],
    %w[dictionary.fetch(:first_name) :Dorian],
    %w[dictionary.first_name :Dorian],
    %w[dictionary.has_key?(:first_name) true],
    %w[dictionary.has_key?(:unknown) false],
    %w[dictionary.has_value?(:Dorian) true],
    %w[dictionary.has_value?(:Unknown) false],
    %w[dictionary.key(:Dorian) :first_name],
    %w[dictionary.key(:Unknown) nothing],
    %w[dictionary.language :code],
    %w[dictionary.select!(Integer) {}],
    %w[dictionary.select(Integer) {}],
    %w[dictionary.select(String) dictionary],
    %w[dictionary.truthy? true],
    ["d = { a: nothing } d.compact! d", "{}"],
    ["dictionary <= dictionary", "true"],
    ["dictionary <=> dictionary", "0"],
    ["dictionary === dictionary", "true"],
    ["dictionary > { first_name: :Dorian", "true"],
    ["dictionary >= {}", "true"],
    ["dictionary.except(:first_name, :language)", "{}"],
    ["dictionary.fetch(:first_name, :language)", "dictionary"],
    ["dictionary.fetch(:unknown) { :Good }", ":Good"],
    ["dictionary.fetch_values(:first_name)", "[:Dorian]"],
    ["dictionary.fetch_values(:first_name, :language)", "[:Dorian, :code]"],
    ["dictionary.invert", "{ Dorian: :first_name, code: :language }"],
    ["dictionary.key(:Unknown) { true }", "true"],
    ["dictionary.select!(Integer) dictionary", "{}"],
    ["dictionary.select(Integer) dictionary", "dictionary"],
    ["dictionary[:first_name]", ":Dorian"],
    ["{ a: 1 }.merge(b: 2)", "{ a: 1, b: 2 }"],
    ["{ a: 1 }.merge({ a: 2 }) { |_, old, new| old + new }", "{ a: 3 }"],
    ["{ a: 1 }.merge({ a: 2 })", "{ a: 2 }"],
    ["{ a: 1 }.merge({ b: 2 })", "{ a: 1, b: 2 }"],
    ["{ a: 1, b: [2, 3] }.flatten", "[:a, 1, :b, 2, 3]"],
    ["{ a: 1, b: [2, 3] }.flatten(-1)", "[:a, 1, :b, 2, 3]"],
    ["{ a: 1, b: [2, 3] }.flatten(0)", "[[:a, 1], [:b, [2, 3]]]"],
    ["{ a: 1, b: [2, 3] }.flatten(1)", "[:a, 1, :b, [2, 3]]"],
    ["{ a: 1, b: [2, 3] }.to_list", "[[:a, 1], [:b, [2, 3]]]"],
    ["{ a: nothing }.compact", "{}"],
    ["{ age: 31 }.delete_unless { |key| key == :age }", "{ age: 31 }"],
    ["{ age: 31 }.delete_unless(Integer)", "{ age: 31 }"],
    ["{ age: 31 }.delete_unless(Number)", "{ age: 31 }"],
    ["{ age: 31 }.keep_unless { |key| key == :age }", "{}"],
    ["{ age: 31 }.keep_unless(Integer)", "{}"],
    ["{ age: 31 }.keep_unless(Number)", "{}"],
    ["{ first_name: :Dorian } < dictionary", "true"],
    ["{ first_name: :Dorian }.any? { |_, value| value == :Dorian }", "true"],
    ["{ first_name: :Dorian }.delete_if { |_, value| value == :Dorian }", "{}"],
    ["{ first_name: :Dorian }.delete_if(String)", "{}"],
    ["{ first_name: :Dorian }.keep_if { |_, value| value != :Dorian }", "{}"],
    ["{ first_name: :Dorian }.keep_if(String)", "{ first_name: :Dorian }"],
    ["{} == {}", "true"],
    ['{ "name" => "Dorian" } == { name: :Dorian }', "true"]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate("#{dictionary} #{input}")).to eq(
        Code.evaluate("#{dictionary} #{expected}")
      )
    end
  end
end
