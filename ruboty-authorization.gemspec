# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/authorization/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-authorization"
  spec.version       = Ruboty::Authorization::VERSION
  spec.authors       = ["Morioka Shuhei", "Speee, Inc."]
  spec.email         = ["selmertsx@gmail.com"]

  spec.summary       = %q{ Authorization Library for Ruboty plugin tasks }
  spec.description   = %q{ Authorization Library for Ruboty plugin tasks }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
