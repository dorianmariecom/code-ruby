# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code do
  (
    [
      "{ a: 1, b: 2 }.transform_values { |key| key.upcase }",
      "{ a: { b: [1, 2, 3, 4] } }.dig(:a, :b, 2)",
      "{ a: 1, b: 2 }.transform_values { |key, value, index| index * 2 }",
      "{ a: 1, b: 2 }.transform_values { |key, value, index, dictionary| dictionary.a }",
      "sum = (a, b: 2) => { a + b } sum(1)",
      "Object.new !== Object.new"
    ] +
      %w[
        1..3
        1...3
        :abc.size
        Date.new.change
        {}.zero?
        {}.any?
        {}.many?
        1.zero?
        1.any?
        1.many?
        1.0.zero?
        1.0.any?
        1.0.many?
        [].zero?
        [].any?
        [].many?
        Base64
        Base64.new
        Smtp
        Smtp.new
        Time.monday?
        Time.tuesday?
        Time.wednesday?
        Time.thursday?
        Time.friday?
        Time.saturday?
        Time.sunday?
        Time.now.monday?
        Time.now.tuesday?
        Time.now.wednesday?
        Time.now.thursday?
        Time.now.friday?
        Time.now.saturday?
        Time.now.sunday?
        Time.now.second
        Time.now.seconds
        Time.now.minute
        Time.now.minutes
        Time.now.hour
        Time.now.hours
        Time.now.day
        Time.now.days
        Time.now.month
        Time.now.months
        Time.now.year
        Time.now.years
        Time.second
        Time.seconds
        Time.minute
        Time.minutes
        Time.hour
        Time.hours
        Time.day
        Time.days
        Time.month
        Time.months
        Time.year
        Time.years
        1.day.ago
        1.day.from_now
        1.hour.ago
        1.hour.from_now
        2.days.ago
        2.days.from_now
        2.hours.ago
        2.hours.ago.hour
        2.hours.from_now
        2.hours.from_now.hour
        Time.hour
        Date.hour
        Boolean.new
        Boolean.new(true)
        Boolean.new(false)
        Class.new
        Class.new(Boolean)
        Class.new(Class)
        Context.new
        Context.new(a:1)
        Date.new
        Date.new.hour
        Date.new("2024-03-05")
        Date.new("2024-03-05").hour
        Date.today
        Date.yesterday
        Date.tomorrow
        Date.tomorrow.hour
        Decimal.new
        Decimal.new(0)
        Decimal.new(1.2)
        Dictionary.new
        Dictionary.new(a:1)
        Duration.new
        Duration.new(1.day)
        Duration.new("P1D")
        Function.new
        Integer.new
        Integer.new(0)
        Integer.new(1)
        Integer.new(1.2)
        List.new
        List.new([])
        List.new([1,2])
        Nothing.new
        Nothing.new(1)
        Object.new
        Object.new(1)
        Range.new
        Range.new(1,2)
        Range.new(-1)
        Range.new(1,2,exclude_end:false)
        Range.new(1,2,exclude_end:true)
        String.new
        String.new(:hello)
        Time.new
        Time.new("2024-03-05.06:10:59.UTC")
        Time.now
        Time.tomorrow
        Time.yesterday
        Time.tomorrow
        Code.new
        Parameter.new
        IdentifierList.new
        IdentifierList.new([])
        Time.new(nothing).before?
        Html.link_to
        Html.link_to('/')
        Html.link_to('Home','/')
        Json.parse('1')
        Json.parse('[]')
        Json.parse('{}')
        Json.parse('random-string')
        {}["".to_string]
      ] + ["Time.hour >= 6 and Time.hour <= 23"]
  ).each { |input| it(input) { described_class.evaluate(input) } }

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
    %w[1.day.ago.after? false],
    %w[1.day.ago.after?(1.day.from_now) false],
    %w[1.day.ago.before? true],
    %w[1.day.ago.before?(1.day.from_now) true],
    %w[1.day.from_now.after? true],
    %w[1.day.from_now.after?(1.day.ago) true],
    %w[1.day.from_now.before? false],
    %w[1.day.from_now.before?(1.day.ago) false],
    %w[10e1.0 100.0],
    %w[1e1 10],
    %w[2.days.ago.future? false],
    %w[2.days.ago.past? true],
    %w[2.days.from_now.future? true],
    %w[2.days.from_now.past? false],
    %w[9975×14÷8 17456.25],
    %w[:Hello.include?(:H) true],
    %w[:admin? :admin?],
    %w[:hello :hello],
    %w[:update!.to_string :update!],
    %w[Boolean(1) true],
    %w[Boolean(2.days.ago) true],
    %w[Boolean(2.days.ago) true],
    %w[Boolean(false) false],
    %w[Boolean(nothing) false],
    %w[Boolean(true) true],
    %w[Boolean({}) true],
    %w[Boolean.new false],
    %w[Boolean.new(1) true],
    %w[Boolean.new(2.days.ago) true],
    %w[Boolean.new(2.days.ago) true],
    %w[Boolean.new(false) false],
    %w[Boolean.new(nothing) false],
    %w[Boolean.new(true) true],
    %w[Boolean.new({}) true],
    %w[Class(2.days.ago) Time],
    %w[Class(Boolean) Boolean],
    %w[Class(Time) Time],
    %w[Class(nothing) Nothing],
    %w[Class(true) Boolean],
    %w[Class.new Nothing],
    %w[Class.new Nothing],
    %w[Class.new(2.days.ago) Time],
    %w[Class.new(Boolean) Boolean],
    %w[Class.new(Date) Date],
    %w[Class.new(Time) Time],
    %w[Class.new(nothing) Nothing],
    %w[Class.new(true) Boolean],
    %w[Date Date],
    %w[Date("0001-01-01").to_string :0001-01-01],
    %w[Date("2024-03-02").to_string :2024-03-02],
    %w[Decimal(1) 1.0],
    %w[Decimal(1) 1],
    %w[Decimal(:1) 1.0],
    %w[Decimal(:1) 1],
    %w[Decimal.new 0],
    %w[Decimal.new(1) 1.0],
    %w[Decimal.new(1) 1],
    %w[Decimal.new(:1) 1.0],
    %w[Decimal.new(:1) 1],
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
    ["2 * 3 + 2", "8"],
    ["2 * 3", "6"],
    ["2 ** 3 ** 2", "512"],
    ["2 ** 3", "8"],
    ["2 + 2 * 3", "8"],
    ["2 / 4", "0.5"],
    ["3.times {}", "3"],
    ["4 % 3", "1"],
    ["Boolean([])", "true"],
    ["Boolean(true, false)", "true"],
    ["Boolean.new([])", "true"],
    ["Boolean.new(false, true)", "false"],
    ["Boolean.new(true, false)", "true"],
    ["Class(true, 1)", "Boolean"],
    ["Class.new(Boolean, Time)", "Boolean"],
    ["Class.new(Time, Boolean)", "Time"],
    %w[Date("2024-3-2").to_string :2024-03-02],
    %w[Date("2024-3-2").to_string :2024-03-02],
    ["Decimal(1, :2)", "100"],
    ["Decimal(:1, 2)", "100.0"],
    ["Decimal.new(1, :2)", "100"],
    ["Decimal.new(:1, 2)", "100.0"],
    ["[,,].include?(4)", "false"],
    ["[,].include?(4)", "false"],
    ["[1, 2, 3,  \n  ].include?(4)", "false"],
    ["[1, 2, 3,].include?(4)", "false"],
    ["[1, 2, 3]", "[1, 2, 3]"],
    ["[1, 2, 3].include?(2)", "true"],
    ["[1, 2, 3].include?(4)", "false"],
    ["[1, 2, 3].map { |i| next if i == 2 i ** 2}", "[1, nothing, 9]"],
    ["[1, 2, 3].map { |i| next(0) if i.even? i ** 2}", "[1, 0, 9]"],
    ["[1, 2, 3].select { |n| n.even? }", "[2]"],
    ["[1, 2, 3].select { |n| n.even? }.select { |n| n.odd? }", "[]"],
    ["[1, 2].map(&:to_string)", "[:1, :2]"],
    ["[1, 2].map(&:to_string)", '["1", "2"]'],
    ["[1, 2].map(&:to_string)", '["1", "2"]'],
    ["[1].each do end", "[1]"],
    ["[[true]]", "[[true]]"],
    ["[]", "[]"],
    ["\r\n", "nothing"],
    ["a = 0 [1, 2, 3].each { |i| next if i == 2 a += i } a", "4"],
    ["a = 0 loop a += 1 break end a", "1"],
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
    ['{ "first_name": "Dorian" }.as_json', '{"first_name" => "Dorian"}'],
    %w[nothing.to_json :null],
    %w[1.to_json "1"],
    %w[1.0.to_json '"1.0"'],
    %w[1.1.to_json '"1.1"'],
    ["a = {} a.merge!(a: 1) a", "{a: 1}"],
    ["a = {} a.merge(a: 1) a", "{}"],
    %w[1&.even? false],
    ["nothing&.even? || 1", "1"],
    ["nothing&.even? && 1", "nothing"],
    %w[2&.even? true],
    ["a = 1 a&.even?", "false"],
    ["a = 2 a&.even?", "true"],
    ["a = nothing a&.even?", "nothing"],
    ["false && puts(:Hello)", "false"],
    ["true || puts(:Hello)", "true"],
    ["false and puts(:Hello)", "false"],
    ["true or puts(:Hello)", "true"],
    ["[1, 2].join", "'12'"],
    ["[1, 2].join(',')", "'1,2'"],
    ["[nothing, 2].join(',')", "',2'"],
    ["[nothing, nothing].join", "''"],
    ["[1, 2].select(&:even?)", "[2]"],
    ["[1, 2].reject(&:even?)", "[1]"],
    ["a = [1, 2] a.select!(&:even?) a", "[2]"],
    ["a = [1, 2] a.reject!(&:even?) a", "[1]"],
    ["[1, 2].map(&:even?)", "[false, true]"],
    ["a = [1, 2] a.map!(&:even?) a", "[false, true]"],
    ["[1, 2, 3].any?", "true"],
    ["[1, 2, 3].any?(&:even?)", "true"],
    ["[1, 2, 3].none?", "false"],
    ["[1, 2, 3].none?(&:even?)", "false"],
    ["subject = 1 { subject }", "{ subject: 1 }"],
    ["subject = 1 { subject: }", "{ subject: 1 }"],
    ["'{1} {2}'", "'1 2'"],
    %w[Json.parse("1") 1],
    %w[{a:1}.to_query "a=1"],
    ["", ""]
  ].each do |input, expected|
    it "#{input} == #{expected}" do
      output = StringIO.new
      code_input = described_class.evaluate(input, output: output)
      code_expected = described_class.evaluate(expected)
      expect(code_input).to eq(code_expected)
      expect(output.string).to eq("")
      next if code_input.is_a?(Code::Object::Decimal)

      expect(code_input.to_json).to eq(code_expected.to_json)
      YAML.unsafe_load(code_input.to_yaml)
      YAML.unsafe_load(code_expected.to_yaml)
    end
  end

  [["puts(true)", "true\n"], %w[print(false) false]].each do |input, expected|
    it "#{input} prints #{expected}" do
      output = StringIO.new
      described_class.evaluate(input, output: output)
      expect(output.string).to eq(expected)
    end
  end

  it "doesn't crash with dictionnary as parameter" do
    described_class.evaluate(<<~INPUT)
      [
        {
          videos: [{}]
        },
        {
          videos: [{}]
        }
      ].map do |post|
        post.videos.map { |video| }
      end
    INPUT
  end

  it "doesn't crash with functions" do
    described_class.evaluate(<<~INPUT)
      send! = (subject:) => { subject }

      send!(subject: "pomodoro start")
      send!(subject: "pomodoro break")
      send!(subject: "pomodoro start")
      send!(subject: "pomodoro break")
    INPUT
  end
end
