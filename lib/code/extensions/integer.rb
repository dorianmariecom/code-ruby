# frozen_string_literal: true

class Integer
  include WordNumberComparaisons

  def to_code
    Code::Object::Integer.new(self)
  end
end
