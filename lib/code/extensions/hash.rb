# frozen_string_literal: true

class Hash
  def to_code
    Code::Object::Dictionary.new(self)
  end
end
