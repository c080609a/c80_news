# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'c80_news/version'

Gem::Specification.new do |spec|
  spec.name          = "c80_news"
  spec.version       = C80News::VERSION
  spec.authors       = ["C80609A"]
  spec.email         = ["c080609a@gmail.com"]

  spec.summary       = "News gem"
  spec.description   = "Gem adds news to site"
  spec.homepage      = "https://github.com/c080609a/c80_news"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'activesupport', ['>= 3.0.0']
  spec.add_dependency "rails", "~> 4.2.0"
  spec.add_dependency "local_time"
  spec.add_dependency "c80_lazy_images"
end
