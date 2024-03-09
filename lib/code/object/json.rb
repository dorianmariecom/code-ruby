class Code
  class Object
    class Json < Object
      def self.to_code(json)
        if json.is_an?(Object)
          json
        elsif json.is_a?(::Hash)
          Dictionary.new(json)
        elsif json.is_a?(::Array)
          List.new(json)
        elsif json.is_a?(::String)
          String.new(json)
        elsif json.is_a?(::Float)
          Decimal.new(json)
        elsif json.is_an?(::Integer)
          Integer.new(json)
        elsif json.is_a?(::TrueClass)
          Boolean.new(json)
        elsif json.is_a?(::FalseClass)
          Boolean.new(json)
        elsif json.is_a?(::NilClass)
          Nothing.new(json)
        else
          Nothing.new
        end
      end
    end
  end
end
