# frozen_string_literal: true

class FalseClass
  def to_code
    Code::Object::Boolean.new(self)
  end
end
