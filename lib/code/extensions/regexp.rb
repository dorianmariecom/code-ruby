# frozen_string_literal: true

class Regexp
  def to_code
    Code::Object::Regex.new(self)
  end
end
