# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'indigo/version'

Gem::Specification.new do |spec|
  spec.name          = "indigo"
  spec.version       = Indigo::VERSION
  spec.authors       = ["David Radcliffe"]
  spec.email         = ["radcliffe.david@gmail.com"]
  spec.description   = %q{A simple ruby wrapper for the Indigo API.}
  spec.summary       = %q{A simple ruby wrapper for the Indigo API.}
  spec.homepage      = "https://github.com/dwradcliffe/indigo"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
