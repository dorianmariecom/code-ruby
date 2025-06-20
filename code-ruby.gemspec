# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "code-ruby"
  s.version = File.read("VERSION").strip
  s.summary = "a programming language for the internet"
  s.description = s.summary
  s.authors = ["Dorian Marié"]
  s.email = "dorian@dorianmarie.com"
  s.files = `git ls-files`.lines.map(&:strip)
  s.require_paths = ["lib"]
  s.homepage = "https://github.com/dorianmariecom/code-ruby"
  s.license = "MIT"
  s.executables = "code"

  s.add_dependency "activesupport"
  s.add_dependency "base64"
  s.add_dependency "bigdecimal"
  s.add_dependency "did-you-mean"
  s.add_dependency "dorian-arguments"
  s.add_dependency "json"
  s.add_dependency "language-ruby"
  s.add_dependency "mail"
  s.add_dependency "net-http"
  s.add_dependency "net-smtp"
  s.add_dependency "nokogiri"
  s.add_dependency "uri"
  s.add_dependency "zeitwerk"

  s.metadata["rubygems_mfa_required"] = "true"

  s.required_ruby_version = ">= 3.0"
end
