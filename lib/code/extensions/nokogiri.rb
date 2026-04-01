# frozen_string_literal: true

module Nokogiri
  module XML
    class Element
      def to_code
        Code::Object::Html.new(self)
      end
    end
  end
end
