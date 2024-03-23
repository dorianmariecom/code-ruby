# frozen_string_literal: true

require "active_support/all"
require "bigdecimal"
require "bigdecimal/util"
require "did_you_mean"
require "json"
require "language-ruby"
require "stringio"
require "timeout"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.ignore("#{__dir__}/code-ruby.rb")
loader.setup

class Object
  alias_method :is_an?, :is_a?
end
