# frozen_string_literal: true

class Code
  class Object
    NUMBER_CLASSES = [
      Integer,
      Decimal,
      String,
      ::Integer,
      ::Float,
      ::String,
      ::BigDecimal
    ].freeze
    INSTANCE_FUNCTIONS = {
      "functions" => {
        name: "functions",
        description: "returns documented instance and class functions available on the value.",
        examples: [
          "[].functions.keys.include?(:map)",
          "1.functions.keys.include?(:to_string)",
          "{}.functions.keys.include?(:fetch)"
        ]
      },
      "instance_functions" => {
        name: "instance_functions",
        description: "returns documented functions available on values of the receiver.",
        examples: [
          "[].instance_functions.keys.include?(:map)",
          "1.instance_functions.keys.include?(:to_string)",
          "{}.instance_functions.keys.include?(:fetch)"
        ]
      },
      "class_functions" => {
        name: "class_functions",
        description: "returns documented functions available on the receiver constructor.",
        examples: [
          "[].class_functions",
          "List.class_functions.keys.include?(:new)",
          "String.class_functions.keys.include?(:new)"
        ]
      },
      "respond_to?" => {
        name: "respond_to?",
        description: "returns whether the value responds to the named function.",
        examples: [
          "[].respond_to?(:map)",
          "1.respond_to?(:zero?)",
          "{}.respond_to?(:fetch)"
        ]
      },
      "present?" => {
        name: "present?",
        description: "returns whether the value is present.",
        examples: ["1.present?", ":hello.present?", "[1].present?"]
      },
      "blank?" => {
        name: "blank?",
        description: "returns whether the value is blank.",
        examples: ["nothing.blank?", "\"\".blank?", "[].blank?"]
      },
      "presence" => {
        name: "presence",
        description: "returns the value when present, otherwise nothing.",
        examples: [":hello.presence", "\"\".presence", "[1].presence"]
      },
      "presence_in" => {
        name: "presence_in",
        description: "returns the value when it is included in the list, otherwise nothing.",
        examples: [
          "2.presence_in([1, 2, 3])",
          "4.presence_in([1, 2, 3])",
          "\"a\".presence_in([\"a\", \"b\"])"
        ]
      },
      "is_a?" => {
        name: "is_a?",
        description: "returns whether the value is an instance of the class or one of its subclasses.",
        examples: ["1.is_a?(Integer)", ":a.is_a?(String)", "[].is_a?(List)"]
      },
      "is_an?" => {
        name: "is_an?",
        description: "alias for is_a?.",
        examples: ["1.is_an?(Integer)", ":a.is_an?(String)", "[].is_an?(List)"]
      },
      "kind_of?" => {
        name: "kind_of?",
        description: "alias for is_a?.",
        examples: ["1.kind_of?(Integer)", ":a.kind_of?(String)", "[].kind_of?(List)"]
      },
      "instance_of?" => {
        name: "instance_of?",
        description: "returns whether the value is exactly an instance of the class.",
        examples: [
          "1.instance_of?(Integer)",
          ":a.instance_of?(String)",
          "[].instance_of?(List)"
        ]
      },
      "!" => {
        name: "!",
        description: "returns the boolean negation of the value.",
        examples: ["!true", "!false", "!nothing"]
      },
      "not" => {
        name: "not",
        description: "returns the boolean negation of the value.",
        examples: ["true.not", "false.not", "nothing.not"]
      },
      "!=" => {
        name: "!=",
        description: "returns whether the value is different from another value.",
        examples: ["1 != 2", ":a != :b", "[1] != [2]"]
      },
      "different" => {
        name: "different",
        description: "returns whether the value is different from another value.",
        examples: ["1.different(2)", ":a.different(:b)", "[1].different([2])"]
      },
      "&&" => {
        name: "&&",
        description: "returns the other value when the receiver is truthy, otherwise the receiver.",
        examples: ["true && 1", "false && 1", "1 && 2"]
      },
      "and" => {
        name: "and",
        description: "returns the other value when the receiver is truthy, otherwise the receiver.",
        examples: ["true.and(1)", "false.and(1)", "1.and(2)"]
      },
      "+" => {
        name: "+",
        description: "returns the receiver for object types that do not override plus.",
        examples: ["Object.new +", "+Object.new", "nothing +"]
      },
      "self" => {
        name: "self",
        description: "returns the receiver.",
        examples: ["1.self", ":a.self", "[].self"]
      },
      ".." => {
        name: "..",
        description: "builds an inclusive range from the receiver to another value.",
        examples: ["1..3", ":a..:c", "Date.today..Date.tomorrow"]
      },
      "inclusive_range" => {
        name: "inclusive_range",
        description: "builds an inclusive range from the receiver to another value.",
        examples: [
          "1.inclusive_range(3)",
          ":a.inclusive_range(:c)",
          "Date.today.inclusive_range(Date.tomorrow)"
        ]
      },
      "..." => {
        name: "...",
        description: "builds an exclusive range from the receiver to another value.",
        examples: ["1...3", ":a...:c", "Date.today...Date.tomorrow"]
      },
      "exclusive_range" => {
        name: "exclusive_range",
        description: "builds an exclusive range from the receiver to another value.",
        examples: [
          "1.exclusive_range(3)",
          ":a.exclusive_range(:c)",
          "Date.today.exclusive_range(Date.tomorrow)"
        ]
      },
      "==" => {
        name: "==",
        description: "returns whether the value equals another value.",
        examples: ["1 == 1", ":a == :a", "[1] == [1]"]
      },
      "equal" => {
        name: "equal",
        description: "returns whether the value equals another value.",
        examples: ["1.equal(1)", ":a.equal(:a)", "[1].equal([1])"]
      },
      "equal?" => {
        name: "equal?",
        description: "returns whether the value equals another value.",
        examples: ["1.equal?(1)", ":a.equal?(:a)", "[1].equal?([1])"]
      },
      "same_object?" => {
        name: "same_object?",
        description: "returns whether the value and argument are the same object.",
        examples: [
          "a = [] b = a a.same_object?(b)",
          "[].same_object?([])",
          "a = {} b = a a.same_object?(b)"
        ]
      },
      ">" => {
        name: ">",
        description: "returns whether the value is greater than another value.",
        examples: ["2 > 1", ":b > :a", "Date.tomorrow > Date.today"]
      },
      "greater" => {
        name: "greater",
        description: "returns whether the value is greater than another value.",
        examples: [
          "2.greater(1)",
          ":b.greater(:a)",
          "Date.tomorrow.greater(Date.today)"
        ]
      },
      ">=" => {
        name: ">=",
        description: "returns whether the value is greater than or equal to another value.",
        examples: ["2 >= 2", ":b >= :a", "Date.today >= Date.today"]
      },
      "greater_or_equal" => {
        name: "greater_or_equal",
        description: "returns whether the value is greater than or equal to another value.",
        examples: [
          "2.greater_or_equal(2)",
          ":b.greater_or_equal(:a)",
          "Date.today.greater_or_equal(Date.today)"
        ]
      },
      "<=>" => {
        name: "<=>",
        description: "compares the value with another value and returns -1, 0, or 1.",
        examples: ["1 <=> 2", ":a <=> :b", "Date.today <=> Date.tomorrow"]
      },
      "compare" => {
        name: "compare",
        description: "compares the value with another value and returns -1, 0, or 1.",
        examples: [
          "1.compare(2)",
          ":a.compare(:b)",
          "Date.today.compare(Date.tomorrow)"
        ]
      },
      "<" => {
        name: "<",
        description: "returns whether the value is less than another value.",
        examples: ["1 < 2", ":a < :b", "Date.today < Date.tomorrow"]
      },
      "less" => {
        name: "less",
        description: "returns whether the value is less than another value.",
        examples: ["1.less(2)", ":a.less(:b)", "Date.today.less(Date.tomorrow)"]
      },
      "<=" => {
        name: "<=",
        description: "returns whether the value is less than or equal to another value.",
        examples: ["1 <= 1", ":a <= :b", "Date.today <= Date.today"]
      },
      "less_or_equal" => {
        name: "less_or_equal",
        description: "returns whether the value is less than or equal to another value.",
        examples: [
          "1.less_or_equal(1)",
          ":a.less_or_equal(:b)",
          "Date.today.less_or_equal(Date.today)"
        ]
      },
      "===" => {
        name: "===",
        description: "returns whether the value strictly equals another value.",
        examples: ["1 === 1", ":a === :a", "[1] === [1]"]
      },
      "strict_equal" => {
        name: "strict_equal",
        description: "returns whether the value strictly equals another value.",
        examples: ["1.strict_equal(1)", ":a.strict_equal(:a)", "[1].strict_equal([1])"]
      },
      "!==" => {
        name: "!==",
        description: "returns whether the value does not strictly equal another value.",
        examples: ["1 !== 2", ":a !== :b", "[1] !== [2]"]
      },
      "strict_different" => {
        name: "strict_different",
        description: "returns whether the value does not strictly equal another value.",
        examples: [
          "1.strict_different(2)",
          ":a.strict_different(:b)",
          "[1].strict_different([2])"
        ]
      },
      "falsy?" => {
        name: "falsy?",
        description: "returns whether the value is falsy.",
        examples: ["nothing.falsy?", "false.falsy?", "1.falsy?"]
      },
      "truthy?" => {
        name: "truthy?",
        description: "returns whether the value is truthy.",
        examples: ["1.truthy?", "true.truthy?", "nothing.truthy?"]
      },
      "true?" => {
        name: "true?",
        description: "returns whether the value is true.",
        examples: ["true.true?", "false.true?", "1.true?"]
      },
      "false?" => {
        name: "false?",
        description: "returns whether the value is false or nothing.",
        examples: ["false.false?", "nothing.false?", "true.false?"]
      },
      "||" => {
        name: "||",
        description: "returns the receiver when truthy, otherwise the other value.",
        examples: ["nothing || 1", "false || 1", "2 || 1"]
      },
      "or" => {
        name: "or",
        description: "returns the receiver when truthy, otherwise the other value.",
        examples: ["nothing.or(1)", "false.or(1)", "2.or(1)"]
      },
      "to_boolean" => {
        name: "to_boolean",
        description: "converts the value to a boolean.",
        examples: ["1.to_boolean", "nothing.to_boolean", "\"\".to_boolean"]
      },
      "to_class" => {
        name: "to_class",
        description: "converts the value to a class object.",
        examples: ["1.to_class", ":a.to_class", "[].to_class"]
      },
      "to_date" => {
        name: "to_date",
        description: "converts the value to a date.",
        examples: [
          "\"2026-05-25\".to_date",
          "Time.now.to_date",
          "Date.today.to_date"
        ]
      },
      "to_decimal" => {
        name: "to_decimal",
        description: "converts the value to a decimal.",
        examples: ["1.to_decimal", "\"1.5\".to_decimal", "2.0.to_decimal"]
      },
      "to_dictionary" => {
        name: "to_dictionary",
        description: "converts the value to a dictionary.",
        examples: ["[].to_dictionary", "{}.to_dictionary", "[[:a, 1]].to_dictionary"]
      },
      "to_duration" => {
        name: "to_duration",
        description: "converts the value to a duration.",
        examples: ["1.to_duration", "1.day.to_duration", "2.hours.to_duration"]
      },
      "to_integer" => {
        name: "to_integer",
        description: "converts the value to an integer.",
        examples: ["\"1\".to_integer", "1.5.to_integer", "1.to_integer"]
      },
      "to_list" => {
        name: "to_list",
        description: "converts the value to a list.",
        examples: ["1.to_list", "[1].to_list", "{}.to_list"]
      },
      "to_nothing" => {
        name: "to_nothing",
        description: "converts the value to nothing.",
        examples: ["1.to_nothing", ":a.to_nothing", "[].to_nothing"]
      },
      "to_range" => {
        name: "to_range",
        description: "converts the value to a range.",
        examples: ["1.to_range", "(1..3).to_range", "[1, 3].to_range"]
      },
      "to_string" => {
        name: "to_string",
        description: "converts the value to a string.",
        examples: ["1.to_string", "true.to_string", ":a.to_string"]
      },
      "inspect" => {
        name: "inspect",
        description: "returns a string representation of the value for inspection.",
        examples: ["1.inspect", ":a.inspect", "[1].inspect"]
      },
      "to_time" => {
        name: "to_time",
        description: "converts the value to a time.",
        examples: [
          "\"2026-05-25\".to_time",
          "Date.today.to_time",
          "Time.now.to_time"
        ]
      },
      "as_json" => {
        name: "as_json",
        description: "converts the value to a JSON-compatible value.",
        examples: ["{ a: 1 }.as_json", "[1, 2].as_json", ":a.as_json"]
      },
      "duplicate" => {
        name: "duplicate",
        description: "returns a shallow duplicate of the value.",
        examples: ["[1].duplicate", "{ a: 1 }.duplicate", ":a.duplicate"]
      },
      "deep_duplicate" => {
        name: "deep_duplicate",
        description: "returns a deep duplicate of the value.",
        examples: [
          "[{}].deep_duplicate",
          "{ a: [1] }.deep_duplicate",
          ":a.deep_duplicate"
        ]
      },
      "to_parameter" => {
        name: "to_parameter",
        description: "converts the value to a URL parameter string.",
        examples: [
          "\"Hello world\".to_parameter",
          "\"A/B\".to_parameter",
          "123.to_parameter"
        ]
      },
      "to_json" => {
        name: "to_json",
        description: "serializes the value as JSON.",
        examples: ["{ a: 1 }.to_json", "[1, 2].to_json", "\"a\".to_json"]
      },
      "send" => {
        name: "send",
        description: "calls a function by name with optional arguments.",
        examples: [
          "[1, 2].send(:size)",
          ":hello.send(:upcase)",
          "1.send(:zero?)"
        ]
      },
      "itself" => {
        name: "itself",
        description: "returns the receiver.",
        examples: ["1.itself", ":a.itself", "[].itself"]
      },
      "tap" => {
        name: "tap",
        description: "calls a function with the receiver and returns the receiver.",
        examples: [
          "1.tap((value) => { value })",
          ":a.tap((value) => { value.upcase })",
          "[1].tap((value) => { value.size })"
        ]
      },
      "then" => {
        name: "then",
        description: "calls a function with the receiver and returns the function result.",
        examples: [
          "1.then((value) => { value + 1 })",
          ":a.then((value) => { value.upcase })",
          "[1].then((value) => { value.size })"
        ]
      },
      "name" => {
        name: "name",
        description: "returns the value's class name.",
        examples: ["1.name", ":a.name", "[].name"]
      },
      "nothing?" => {
        name: "nothing?",
        description: "returns whether the value is nothing.",
        examples: ["nothing.nothing?", "1.nothing?", ":a.nothing?"]
      },
      "something?" => {
        name: "something?",
        description: "returns whether the value is not nothing.",
        examples: ["1.something?", ":a.something?", "nothing.something?"]
      }
    }.freeze
    CLASS_FUNCTIONS = {
      "new" => {
        name: "new",
        description: "builds a new value for the class.",
        examples: [
          "List.new([1, 2])",
          "String.new(:hello)",
          "Dictionary.new(a: 1)"
        ]
      }
    }.freeze

    def self.function_documentation(scope)
      case scope
      when :instance
        INSTANCE_FUNCTIONS
      when :class
        CLASS_FUNCTIONS
      else
        {}
      end
    end
    DOCUMENTATION_EXAMPLE_RECEIVERS = [
      "Object.new",
      "1",
      "[]"
    ].freeze
    DOCUMENTATION_OPERATOR_NAMES = {
      "code_bitwise_and" => ["&", "bitwise_and"],
      "code_bitwise_or" => ["|", "bitwise_or"],
      "code_bitwise_xor" => ["^", "bitwise_xor"],
      "code_decimal_divide" => ["decimal_divide"],
      "code_different" => ["!=", "different"],
      "code_divide" => ["divide"],
      "code_divide_modulo" => ["divide_modulo"],
      "code_division" => ["/", "division"],
      "code_exclusive_range" => ["...", "exclusive_range"],
      "code_exclamation_mark" => ["!", "not"],
      "code_get" => ["[]", "at", "get"],
      "code_has_key?" => ["has_key?", "key?"],
      "code_has_value?" => ["has_value?", "value?"],
      "code_inclusive_range" => ["..", "inclusive_range"],
      "code_left_shift" => ["<<", "left_shift"],
      "code_minus" => ["-", "minus"],
      "code_modulo" => ["%", "modulo"],
      "code_multiplication" => ["*", "multiplication"],
      "code_plus" => ["+", "plus"],
      "code_power" => ["**", "power"],
      "code_right_shift" => [">>", "right_shift"],
      "code_select" => ["select", "filter"],
      "code_select!" => ["select!", "filter!"],
      "code_size" => ["size", "length"],
      "code_strict_different" => ["!==", "strict_different"],
      "code_strict_equal" => ["===", "strict_equal"],
      "code_to_function" => ["&", "to_function"]
    }.freeze

    include Concerns::Shared
    extend Concerns::Shared

    def initialize(...)
    end

    def self.maybe
      Type::Maybe.new(self)
    end

    def self.repeat(minimum = 0, maximum = nil)
      Type::Repeat.new(self, minimum: minimum, maximum: maximum)
    end

    def self.|(other)
      Type::Or.new(self, other)
    end

    def self.code_new(*args)
      new(*args)
    end

    def self.functions
      class_functions
    end

    def self.instance_functions
      documented_functions_for(self, :instance)
    end

    def self.class_functions
      documented_functions_for(self, :class)
    end

    def self.documented_functions_for(klass, scope)
      Dictionary.new(
        function_documentation_for(klass, scope).transform_keys(&:to_s)
      )
    end

    def self.function_documentation_for(klass, scope)
      documentation = function_documentation_registry_for(klass, scope)
      inherited_function_documentation_for(klass, scope)
        .merge(automatic_function_documentation_for(klass, scope))
        .merge(documentation)
    end

    def self.inherited_function_documentation_for(klass, scope)
      return {} unless klass.is_a?(::Class)

      superclass = klass.superclass
      return {} unless superclass && superclass <= Object

      function_documentation_for(superclass, scope)
    rescue TypeError
      {}
    end

    def self.function_documentation_registry_for(klass, scope)
      klass.function_documentation(scope)
    end

    def self.automatic_function_documentation_for(klass, scope)
      automatic_function_methods_for(klass, scope).each_with_object({}) do |method_name, docs|
        automatic_function_names_for(method_name).each do |function_name|
          docs[function_name] = automatic_function_documentation(function_name, scope)
        end
      end
    end

    def self.automatic_function_methods_for(klass, scope)
      methods =
        case scope
        when :instance
          klass.public_instance_methods(false)
        when :class
          klass.public_methods(false)
        else
          []
        end

      methods.grep(/\Acode_/).map(&:to_s)
    end

    def self.automatic_function_names_for(method_name)
      DOCUMENTATION_OPERATOR_NAMES.fetch(method_name) do
        function_name = method_name.delete_prefix("code_").delete_suffix("_assign")
        names = [function_name]
        names << "#{function_name}=" if method_name.end_with?("_assign")
        names
      end
    end

    def self.automatic_function_documentation(function_name, scope)
      {
        name: function_name,
        description: "calls the #{function_name} function.",
        examples: automatic_function_examples(function_name, scope)
      }
    end

    def self.automatic_function_examples(function_name, scope)
      if scope == :class
        [
          "Object.#{function_name}",
          "List.#{function_name}",
          "String.#{function_name}"
        ]
      else
        DOCUMENTATION_EXAMPLE_RECEIVERS.map do |receiver|
          "#{receiver}.#{function_name}"
        end
      end
    end

    def name
      self.class.name
    end

    def code_new(*args)
      self.class.code_new(*args)
    end
  end
end
