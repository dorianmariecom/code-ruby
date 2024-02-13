# frozen_string_literal: true

require "bigdecimal"
require "stringio"
require "timeout"
require "zeitwerk"
require "language-ruby"
require "active_support"
require "active_support/core_ext/numeric/time"
require "active_support/core_ext/date/conversions"

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.ignore("#{__dir__}/code-ruby.rb")
loader.setup
