# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "foreman_db"
  spec.version       = "0.0.1"
  spec.authors       = ["Mateusz Zawisza"]
  spec.email         = ["mateusz@getbase.com"]
  spec.description   = "Foreman API wrapper"
  spec.summary       = "Foreman API wrapper"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.bindir        = "executables"
  spec.executables   = spec.files.grep(%r{^executables/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
end
