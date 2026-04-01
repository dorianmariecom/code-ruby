# frozen_string_literal: true

class Module
  def to_code
    Code::Object::Class.new(self)
  end
end
