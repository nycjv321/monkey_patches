# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monkey_patches/version'

Gem::Specification.new do |spec|
  spec.name          = "monkey_patches"
  spec.version       = MonkeyPatches::VERSION
  spec.authors       = ["Javier L. Velasquez"]
  spec.email         = ["nycjv321@gmail.com"]
  spec.summary       = "Monkey patches for standard libs"
  spec.description   = "Provides new functionality to some standard classes"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
