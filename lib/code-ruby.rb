# frozen_string_literal: true

require "active_support/all"
require "base64"
require "bigdecimal"
require "bigdecimal/util"
require "date"
require "did_you_mean"
require "digest"
require "icalendar"
require "json"
require "mail"
require "net/http"
require "nokogiri"
require "stringio"
require "timeout"
require "uri"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.ignore("#{__dir__}/code-ruby.rb")
loader.setup

require_relative "code/extensions/word_number_comparaisons"
require_relative "code/extensions/object"
require_relative "code/extensions/class"
require_relative "code/extensions/module"
require_relative "code/extensions/nil_class"
require_relative "code/extensions/true_class"
require_relative "code/extensions/false_class"
require_relative "code/extensions/string"
require_relative "code/extensions/symbol"
require_relative "code/extensions/integer"
require_relative "code/extensions/float"
require_relative "code/extensions/big_decimal"
require_relative "code/extensions/array"
require_relative "code/extensions/hash"
require_relative "code/extensions/nokogiri"
require_relative "code/extensions/active_support"
