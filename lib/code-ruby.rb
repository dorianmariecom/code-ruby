# frozen_string_literal: true

require "active_support/all"
require "base64"
require "bigdecimal"
require "bigdecimal/util"
require "did_you_mean"
require "json"
require "language-ruby"
require "net/http"
require "stringio"
require "timeout"
require "uri"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.ignore("#{__dir__}/code-ruby.rb")
loader.setup

module WordNumberComparaisons
  def zero?
    zero?
  end

  def one?
    self == 1
  end

  def two?
    self == 2
  end

  def three?
    self == 3
  end

  def four?
    self == 4
  end

  def five?
    self == 5
  end

  def six?
    self == 6
  end

  def seven?
    self == 7
  end

  def eight?
    self == 8
  end

  def nine?
    self == 9
  end

  def ten?
    self == 10
  end
end

class Object
  alias is_an? is_a?

  def to_code
    raise NotImplementedError, "to_code not defined on #{self.class.name}"
  end
end

class NilClass
  def to_code
    Code::Object::Nothing.new(self)
  end
end

class TrueClass
  def to_code
    Code::Object::Boolean.new(self)
  end
end

class FalseClass
  def to_code
    Code::Object::Boolean.new(self)
  end
end

class String
  def to_code
    Code::Object::String.new(self)
  end
end

class Symbol
  def to_code
    Code::Object::String.new(self)
  end
end

class Integer
  include WordNumberComparaisons

  def to_code
    Code::Object::Integer.new(self)
  end
end

class Float
  include WordNumberComparaisons

  def to_code
    Code::Object::Decimal.new(self)
  end
end

class BigDecimal
  include WordNumberComparaisons

  def to_code
    Code::Object::Decimal.new(self)
  end
end

class Array
  def to_code
    Code::Object::List.new(self)
  end
end

class Hash
  def to_code
    Code::Object::Dictionary.new(self)
  end
end
