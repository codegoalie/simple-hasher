# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simplehasher/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Marshall"]
  gem.email         = ["chris@chrismar035.com"]
  gem.description   = "Reversible method to turn an integer into an alphanumeric string"
  gem.summary       = "Useful for 'hiding' record ids in urls, etc."
  gem.homepage      = "http://github.com/chrismar035/simple-hasher"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "simple-hasher"
  gem.require_paths = ["lib"]
  gem.version       = SimpleHasher::VERSION

  gem.add_development_dependency 'rspec'
end
