# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'record_me/version'

Gem::Specification.new do |spec|
  spec.name          = "record_me"
  spec.version       = RecordMe::VERSION
  spec.authors       = ["Marco Gallardo"]
  spec.email         = ["marco.gallardo@tangosource.com"]
  spec.description   = %q{Record sounds}
  spec.summary       = %q{Record sounds}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
