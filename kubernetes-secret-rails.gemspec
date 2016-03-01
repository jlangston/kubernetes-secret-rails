# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kubernetes/secret/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "kubernetes-secret-rails"
  spec.version       = Kubernetes::Secret::Rails::VERSION
  spec.authors       = ["Zack Siri"]
  spec.email         = ["zack@codemy.net"]

  spec.summary       = %q{Simple Wrapper for accessing secrets on kubernetes}
  spec.description   = %q{Simple wrapper for accessing secrets}
  spec.homepage      = "http://github.com/codemy/kubernetes-secret-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
