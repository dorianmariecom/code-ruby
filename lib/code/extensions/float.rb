# frozen_string_literal: true

class Float
  include WordNumberComparaisons

  def to_code
    Code::Object::Decimal.new(self)
  end
end
