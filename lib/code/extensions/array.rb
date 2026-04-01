# frozen_string_literal: true

class Array
  def to_code
    Code::Object::List.new(self)
  end
end
