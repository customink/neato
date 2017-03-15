# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'neato/version'

Gem::Specification.new do |spec|
  spec.name          = "neato"
  spec.version       = Neato::VERSION
  spec.authors       = ["Ken Collins"]
  spec.email         = ["ken@metaskills.net"]
  spec.summary       = %q{Demo using two Sass libs.}
  spec.description   = %q{Demo using two Sass libs.}
  spec.homepage      = "https://github.com/metaskills/neato"
  spec.license       = "MIT"
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
end
