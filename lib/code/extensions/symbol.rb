# frozen_string_literal: true

class Symbol
  def to_code
    Code::Object::String.new(self)
  end
end
