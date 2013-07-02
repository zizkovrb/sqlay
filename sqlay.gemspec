# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sqlay/version'

Gem::Specification.new do |spec|
  spec.name          = "sqlay"
  spec.version       = Sqlay::VERSION
  spec.authors       = ["Josef Šimánek"]
  spec.email         = ["retro@ballgag.cz"]
  spec.description   = %q{simple SQLite3 ruby wrapper}
  spec.summary       = %q{including many bugs, just for fun}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.extensions    = ["ext/sqlay/extconf.rb"]

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "sqlite3"
end
