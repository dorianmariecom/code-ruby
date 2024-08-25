# frozen_string_literal: true

require_relative "../code"

Code::Version =
  Gem::Version.new(File.read(File.expand_path("../../VERSION", __dir__)))
