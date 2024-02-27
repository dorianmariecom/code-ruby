# frozen_string_literal: true

require "active_support"
require "active_support/core_ext/date/conversions"
require "active_support/core_ext/numeric/time"
require "active_support/core_ext/object/json"
require "bigdecimal"
require "json"
require "language-ruby"
require "stringio"
require "timeout"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.ignore("#{__dir__}/code-ruby.rb")
loader.setup
