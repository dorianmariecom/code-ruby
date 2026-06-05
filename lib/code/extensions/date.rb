# frozen_string_literal: true

class Date
  def to_code
    Code::Object::Date.new(self)
  end
end
