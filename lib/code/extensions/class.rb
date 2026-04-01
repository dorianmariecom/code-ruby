# frozen_string_literal: true

class Class
  def to_code
    Code::Object::Class.new(self)
  end
end
