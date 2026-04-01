# frozen_string_literal: true

class TrueClass
  def to_code
    Code::Object::Boolean.new(self)
  end
end
