# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code do
  [
    ["1 + 1", "2"],
    ["a = 1", "1"],
    ["a = 1 b = 2 c = a + b c", "3"],
    ["a = 1 a += 1 a", "2"],
    ["a = b = c = 1 a + b + c", "3"],
    ["3.times {}", "3"],
    ["a = 1 3.times { a += 1 } a", "4"],
    ['user = {} user[:name] = "Dorian" user[:name]', ":Dorian"],
    ['user = {} user.name = "Dorian" user.name', ":Dorian"],
    [
      "user = { name: :Dorian, age: 31 } user.delete_if(String) user.keys",
      '["age"]'
    ],
    [
      "(user = { name: :Dorian, age: 31 }).transform_values { user.name }.age",
      ":Dorian"
    ],
    ["1 & 1", "1"],
    ["true && false", "false"],
    ["true && true", "true"],
    ["1 | 2", "3"],
    ["1 ^ 2", "3"],
    %w[true true],
    %w[false false],
    ["[1, 2, 3].select { |n| n.even? }", "[2]"],
    ["[1, 2, 3].select { |n| n.even? }.select { |n| n.odd? }", "[]"],
    %w[{} {}],
    ["{ a: 1, b: 2, c: 3 }", '{"a" => 1, "b" => 2, "c" => 3}'],
    ['{ "first_name": "Dorian" }', '{"first_name" => "Dorian"}'],
    ["a = 1 a", "1"],
    ["a = 1 a += 1 a", "2"],
    ["a = 1 a -= 1 a", "0"],
    ["a = 1 a *= 2 a", "2"],
    ["a = 1 a /= 2 a", "0.5"],
    ["a = 10 a %= 2 a", "0"],
    ["a = 1 a >>= 1 a", "0"],
    ["a = 1 a <<= 1 a", "2"],
    ["a = 1 a |= 2 a", "3"],
    ["a = 1 a ^= 2 a", "3"],
    ["a = false a ||= true a", "true"],
    ["a = false a &&= true a", "false"],
    ["1 == 1", "true"],
    ["1 == 1 and 2 == 2", "true"],
    ["1 > 2", "false"],
    ["1 < 2", "true"],
    ["1 <= 1", "true"],
    ["1 >= 1", "true"],
    ["(true false)", "false"],
    ["if true 1", "1"],
    ["unless false 1", "1"],
    ["if false 1", "nothing"],
    ["unless true 1", "nothing"],
    ["if false 1 else 2", "2"],
    ["if false 1 elsif true 2", "2"],
    ["if false 1 elsif false 2", "nothing"],
    ["if false 1 else if true 2", "2"],
    ["if false 1 else if false 2", "nothing"],
    ["if false 1 else unless false 2", "2"],
    ["if false 1 else unless true 2", "nothing"],
    ["[]", "[]"],
    ["[1, 2, 3]", "[1, 2, 3]"],
    ["[1, 2, 3].include?(2)", "true"],
    ["[1, 2, 3].include?(4)", "false"],
    ["[[true]]", "[[true]]"],
    ["2 * 3", "6"],
    ["2 * 3 + 2", "8"],
    ["2 + 2 * 3", "8"],
    ["2 / 4", "0.5"],
    ["4 % 3", "1"],
    %w[!false true],
    %w[!!true true],
    %w[!!1 true],
    %w[+1 1],
    %w[+1.0 1.0],
    %w[+true true],
    ["not true", "false"],
    ["not not false", "false"],
    %w[0 0],
    %w[1.1 1.1],
    %w[0x10 16],
    %w[0o10 8],
    %w[0b10 2],
    %w[1e1 10],
    %w[1.0e1 10.0],
    %w[10e1.0 100.0],
    ["true or false", "true"],
    ["true and false", "false"],
    ["random = 1 random", "1"],
    ["true || false", "true"],
    ["false || false", "false"],
    ["2 ** 3", "8"],
    ["2 ** 3 ** 2", "512"],
    ["a rescue :oops", ":oops"],
    ["[1, 2].map(&:to_string)", "[:1, :2]"],
    %w['' ""],
    %w["" ''],
    %w[:hello :hello],
    %w[:admin? :admin?],
    %w[:update!.to_string :update!],
    ["'Hello Dorian'", '"Hello Dorian"'],
    ['"Hello Dorian"', '"Hello Dorian"'],
    ["'Hello \\{name}'", ':Hello + " \\{name}"'],
    ['"Hello \\{name}"', '"Hello \\{" + "name}"'],
    ["'Hello {1}'", '"Hello 1"'],
    ['"Hello {1}"', '"Hello 1"'],
    %w["Hello".include?("H") true],
    %w["Hello".downcase :hello],
    ["true ? 1", "1"],
    ["false ? 1", ""],
    ["true ? 1 : 2", "1"],
    ["false ? 1 : 2", "2"],
    %w[-1 -1],
    %w[--1 1],
    %w[-1.0 -1.0],
    %w[--1.0 1.0],
    ["while false", "nothing"],
    ["a = 0\nwhile a < 10 a += 1 end a", "10"],
    ["until true", "nothing"],
    ["a = 0\nuntil a > 10 a += 1 end a", "11"],
    ["1 >> 1", "0"],
    ["1 << 1", "2"],
    ["[1, 2].map(&:to_string)", '["1", "2"]']
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end

  [["puts(true)", "true\n"], %w[print(false) false]].each do |input, expected|
    it "#{input} prints #{expected}" do
      io = StringIO.new
      Code.evaluate(input, io:)
      expect(io.string).to eq(expected)
    end
  end

  it "converts nil" do
    ruby = Code::Ruby.from_code(Code.evaluate("a", ruby: { a: nil }))

    expect(ruby).to eq(nil)
  end

  it "works with downcase" do
    expect(Code.evaluate("downcase", "{ downcase: 1 }")).to eq(
      Code.evaluate("1")
    )
  end

  it "works with nested objects" do
    expect(
      Code.evaluate("items.first.title", ruby: { items: [{ title: "Hello" }] })
    ).to eq(Code.evaluate(":Hello"))
  end

  it "works with arrays" do
    expect(
      Code.evaluate(
        "items.map { |item| item.title }",
        ruby: {
          items: [{ title: "Hello" }]
        }
      )
    ).to eq(Code.evaluate("[:Hello]"))
  end
end
