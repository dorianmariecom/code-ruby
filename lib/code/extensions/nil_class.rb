# frozen_string_literal: true

class NilClass
  def to_code
    Code::Object::Nothing.new(self)
  end
end
