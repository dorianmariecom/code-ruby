# frozen_string_literal: true

class BigDecimal
  include WordNumberComparaisons

  def to_code
    Code::Object::Decimal.new(self)
  end
end
