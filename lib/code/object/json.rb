# frozen_string_literal: true

class Code
  class Object
    class Json < Object
      def self.to_code(json)
        if json.is_an?(Object)
          json
        elsif json.is_a?(::Hash)
          Dictionary.new(
            json
              .transform_keys { |key| Json.to_code(key) }
              .transform_values { |value| Json.to_code(value) }
          )
        elsif json.is_a?(::Array)
          List.new(json.map { |element| Json.to_code(element) })
        elsif json.is_a?(::String)
          String.new(json)
        elsif json.is_a?(::Float)
          Decimal.new(json)
        elsif json.is_an?(::Integer)
          Integer.new(json)
        elsif json.is_a?(::TrueClass) || json.is_a?(::FalseClass)
          Boolean.new(json)
        elsif json.is_a?(::NilClass)
          Nothing.new(json)
        else
          raise Error, "#{json.inspect} not supported"
        end
      end
    end
  end
end
