# frozen_string_literal: true

class Object
  alias is_an? is_a?

  def to_code
    raise NotImplementedError, "to_code not defined on #{self.class.name}"
  end
end
