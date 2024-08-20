# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "code-ruby"
  s.version = File.read("VERSION").strip
  s.summary = "a programming language for the internet"
  s.description = s.summary
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
  s.add_dependency "dorian-arguments"
end
