# frozen_string_literal: true

class String
  def to_code
    Code::Object::String.new(self)
  end
end
