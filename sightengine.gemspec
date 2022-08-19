# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sightengine/version'

Gem::Specification.new do |spec|
  spec.name          = "sightengine"
  spec.version       = Sightengine::VERSION
  spec.authors       = ["Léonard Hetsch"]
  spec.email         = ["leo.hetsch@gmail.com"]

  spec.summary       = %q{Ruby wrapper for the Sightengine image moderation API}
  spec.description   = %q{Unofficial wrapper for the Sightengine API which provides image moderation including nudity detection, scammer detection, face attributes, and more.}
  spec.homepage      = "https://github.com/leoht/sightengine"
  spec.license       = "MIT"

  spec.required_ruby_version = Gem::Requirement.new("~> 2.7.6")

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "> 2.0.0"

  spec.add_development_dependency "bundler", "~> 2.3.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.0"
end
