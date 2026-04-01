# frozen_string_literal: true

module ActiveSupport
  class TimeWithZone
    def to_code
      Code::Object::Time.new(self)
    end
  end
end
