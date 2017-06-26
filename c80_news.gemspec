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

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_dependency 'activesupport'
  spec.add_dependency "rails"
  spec.add_dependency "local_time"
  spec.add_dependency "c80_lazy_images"
end
