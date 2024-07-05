# frozen_string_literal: true

require "English"
require_relative "lib/code/version"

Gem::Specification.new do |s|
  s.name = "code-ruby"
  s.version = ::Code::Version
  s.summary = "A programming language"
  s.description = 'A programming language, like Code.evaluate("1 + 1") # => 2'
  s.authors = ["Dorian Marié"]
  s.email = "dorian@dorianmarie.fr"
  s.files = `git ls-files`.lines.map(&:strip)
  s.require_paths = ["lib"]
  s.homepage = "https://github.com/dorianmariecom/code-ruby"
  s.license = "MIT"
  s.executables = "code"

  s.add_dependency "activesupport"
  s.add_dependency "bigdecimal"
  s.add_dependency "did-you-mean"
  s.add_dependency "json"
  s.add_dependency "language-ruby"
  s.add_dependency "zeitwerk"
end
