# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code do
  [
    [
      "user = { name: :Dorian, age: 31 } user.delete_if(String) user.keys",
      '["age"]'
    ],
    [
      "(user = { name: :Dorian, age: 31 }).transform_values { user.name }.age",
      ":Dorian"
    ],
    %w[!!1 true],
    %w[!!true true],
    %w[!false true],
    %w["" ''],
    %w["Hello".downcase :hello],
    %w['' ""],
    %w[+1 1],
    %w[+1.0 1.0],
    %w[+true true],
    %w[--1 1],
    %w[--1.0 1.0],
    %w[-1 -1],
    %w[-1.0 -1.0],
    %w[0 0],
    %w[0b10 2],
    %w[0o10 8],
    %w[0x10 16],
    %w[1.0e1 10.0],
    %w[1.1 1.1],
    %w[10e1.0 100.0],
    %w[1e1 10],
    %w[9975×14÷8 17456.25],
    %w[:Hello.include?(:H) true],
    %w[:admin? :admin?],
    %w[:hello :hello],
    %w[:update!.to_string :update!],
    %w[false false],
    %w[true true],
    %w[{} {}],
    ["'Hello Dorian'", '"Hello Dorian"'],
    ["'Hello \\{name}'", ':Hello + " \\{name}"'],
    ["'Hello {1}'", '"Hello 1"'],
    ["(true false)", "false"],
    ["1 & 1", "1"],
    ["1 + 1", "2"],
    ["1 < 2", "true"],
    ["1 << 1", "2"],
    ["1 <= 1", "true"],
    ["1 == 1 and 2 == 2", "true"],
    ["1 == 1", "true"],
    ["1 > 2", "false"],
    ["1 >= 1", "true"],
    ["1 >> 1", "0"],
    ["1 ^ 2", "3"],
    ["1 | 2", "3"],
    ["1.day.ago.after?(1.day.from_now)", 'false'],
    ["1.day.ago.before?(1.day.from_now)", 'true'],
    ["1.day.from_now.after?(1.day.ago)", 'true'],
    ["1.day.from_now.before?(1.day.ago)", 'false'],
    ["1.day.ago.after?", 'false'],
    ["1.day.ago.before?", 'true'],
    ["1.day.from_now.after?", "true"],
    ["1.day.from_now.before?", "false"],
    ["2 * 3 + 2", "8"],
    ["2 * 3", "6"],
    ["2 ** 3 ** 2", "512"],
    ["2 ** 3", "8"],
    ["2 + 2 * 3", "8"],
    ["2 / 4", "0.5"],
    ["3.times {}", "3"],
    ["4 % 3", "1"],
    ["[,,].include?(4)", "false"],
    ["[,].include?(4)", "false"],
    ["[1, 2, 3,  \n  ].include?(4)", "false"],
    ["[1, 2, 3,].include?(4)", "false"],
    ["[1, 2, 3]", "[1, 2, 3]"],
    ["[1, 2, 3].include?(2)", "true"],
    ["[1, 2, 3].include?(4)", "false"],
    ["[1, 2, 3].select { |n| n.even? }", "[2]"],
    ["[1, 2, 3].select { |n| n.even? }.select { |n| n.odd? }", "[]"],
    ["[1, 2].map(&:to_string)", "[:1, :2]"],
    ["[1, 2].map(&:to_string)", '["1", "2"]'],
    ["[1, 2].map(&:to_string)", '["1", "2"]'],
    ["[1].each do end", "[1]"],
    ["[[true]]", "[[true]]"],
    ["[]", "[]"],
    ["\r\n", "nothing"],
    ["a = 0\nuntil a > 10 a += 1 end a", "11"],
    ["a = 0\nwhile a < 10 a += 1 end a", "10"],
    ["a = 1 3.times { a += 1 } a", "4"],
    ["a = 1 a *= 2 a", "2"],
    ["a = 1 a += 1 a", "2"],
    ["a = 1 a += 1 a", "2"],
    ["a = 1 a -= 1 a", "0"],
    ["a = 1 a /= 2 a", "0.5"],
    ["a = 1 a <<= 1 a", "2"],
    ["a = 1 a >>= 1 a", "0"],
    ["a = 1 a ^= 2 a", "3"],
    ["a = 1 a |= 2 a", "3"],
    ["a = 1 a", "1"],
    ["a = 1 b = 2 c = a + b c", "3"],
    ["a = 1", "1"],
    ["a = 10 a %= 2 a", "0"],
    ["a = b = c = 1 a + b + c", "3"],
    ["a = false a &&= true a", "false"],
    ["a = false a ||= true a", "true"],
    ["a rescue :oops", ":oops"],
    ["false ? 1 : 2", "2"],
    ["false ? 1", ""],
    ["false || false", "false"],
    ["if false 1 else 2", "2"],
    ["if false 1 else if false 2", "nothing"],
    ["if false 1 else if true 2", "2"],
    ["if false 1 else unless false 2", "2"],
    ["if false 1 else unless true 2", "nothing"],
    ["if false 1 elsif false 2", "nothing"],
    ["if false 1 elsif true 2", "2"],
    ["if false 1", "nothing"],
    ["if true 1", "1"],
    ["not not false", "false"],
    ["not true", "false"],
    ["random = 1 random", "1"],
    ["true && false", "false"],
    ["true && true", "true"],
    ["true ? 1 : 2", "1"],
    ["true ? 1", "1"],
    ["true and false", "false"],
    ["true or false", "true"],
    ["true || false", "true"],
    ["unless false 1", "1"],
    ["unless true 1", "nothing"],
    ["until true", "nothing"],
    ["while false", "nothing"],
    ["{ a: 1, b: 2, c: 3 }", '{"a" => 1, "b" => 2, "c" => 3}'],
    ['"Hello Dorian"', '"Hello Dorian"'],
    ['"Hello \\{name}"', '"Hello \\{" + "name}"'],
    ['"Hello {1}"', '"Hello 1"'],
    ['user = {} user.name = "Dorian" user.name', ":Dorian"],
    ['user = {} user[:name] = "Dorian" user[:name]', ":Dorian"],
    ['{ "first_name": "Dorian" }', '{"first_name" => "Dorian"}'],
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      expect(Code.evaluate(input)).to eq(Code.evaluate(expected))
    end
  end

  [["puts(true)", "true\n"], %w[print(false) false]].each do |input, expected|
    it "#{input} prints #{expected}" do
      output = StringIO.new
      Code.evaluate(input, output:)
      expect(output.string).to eq(expected)
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

  describe "#fetch" do
    it "returns the value when present" do
      expect(Code.evaluate("fetch(:downcase)", "{ downcase: 1 }")).to eq(
        Code.evaluate("1")
      )
    end

    it "returns the default value when not present" do
      expect(Code.evaluate("fetch(:downcase) { 2 }")).to eq(
        Code.evaluate("2")
      )
    end
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

  [
    "1.day.ago",
    "1.day.from_now",
    "1.hour.ago",
    "1.hour.from_now",
    "2.days.ago",
    "2.days.from_now",
    "2.hours.ago",
    "2.hours.from_now",
    "Date.tomorrow",
    "Time.tomorrow",
  ].each do |input|
    it(input) { Code.evaluate(input) }
  end
end
