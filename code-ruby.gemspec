# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "code-ruby"
  s.version = File.read("VERSION").strip
  s.summary = "a programming language for the internet"
  s.description = "a compact, embeddable scripting language for the internet"
  s.authors = ["Dorian Marié"]
  s.email = "dorian@dorianmarie.com"
  s.files =
    IO.popen(
      %w[git ls-files -z -- lib bin/code LICENSE README.md VERSION],
      &:read
    ).split("\x0")
  s.require_paths = ["lib"]
  s.homepage = "https://github.com/dorianmariecom/code-ruby"
  s.license = "MIT"
  s.executables = "code"

  s.add_dependency "activesupport", ">= 7.1.6", "< 9"
  s.add_dependency "base64", ">= 0.3.0", "< 1"
  s.add_dependency "bigdecimal", ">= 4.1.2", "< 5"
  s.add_dependency "did-you-mean", ">= 0.1.1", "< 1"
  s.add_dependency "dorian-arguments", ">= 1.2.3", "< 2"
  s.add_dependency "icalendar", ">= 2.12.3", "< 3"
  s.add_dependency "json", ">= 2.20.0", "< 3"
  s.add_dependency "language-ruby", ">= 1.2.0", "< 2"
  s.add_dependency "mail", ">= 2.9.0", "< 3"
  s.add_dependency "net-http", ">= 0.9.1", "< 1"
  s.add_dependency "net-smtp", ">= 0.5.1", "< 1"
  s.add_dependency "nokogiri", ">= 1.17.2", "< 2"
  s.add_dependency "uri", ">= 1.1.1", "< 2"
  s.add_dependency "zeitwerk", ">= 2.6.18", "< 3"

  s.metadata["rubygems_mfa_required"] = "true"

  s.required_ruby_version = ">= 4.0"
end
