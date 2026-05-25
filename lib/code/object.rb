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
        description: "Returns documented instance and class functions available on the value.",
        examples: ["[].functions.keys.include?(:map)"]
      },
      "instance_functions" => {
        name: "instance_functions",
        description: "Returns documented functions available on values of the receiver.",
        examples: ["[].instance_functions.keys.include?(:map)"]
      },
      "class_functions" => {
        name: "class_functions",
        description: "Returns documented functions available on the receiver constructor.",
        examples: ["[].class_functions"]
      },
      "respond_to?" => {
        name: "respond_to?",
        description: "Returns whether the value responds to the named function.",
        examples: ["[].respond_to?(:map)"]
      }
    }.freeze
    CLASS_FUNCTIONS = {
      "new" => {
        name: "new",
        description: "Builds a new value for the class.",
        examples: ["List.new([1, 2])"]
      }
    }.freeze
    FUNCTION_DOCUMENTATION = {
      instance: {
        "Code::Object" => INSTANCE_FUNCTIONS,
        "Code::Object::List" => {
          "map" => {
            name: "map",
            description: "Returns a new list with each item transformed by a function or class.",
            examples: ["[1, 2, 3].map(Integer)"]
          }
        }
      },
      class: {
        "Code::Object" => CLASS_FUNCTIONS
      }
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
      FUNCTION_DOCUMENTATION.fetch(scope).fetch(klass.name, {})
    end

    def name
      self.class.name
    end

    def code_new(*args)
      self.class.code_new(*args)
    end
  end
end
