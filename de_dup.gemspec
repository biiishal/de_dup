# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "de_dup/version"

Gem::Specification.new do |spec|
  spec.name          = "de_dup"
  spec.version       = DeDup::VERSION
  spec.authors       = ["Bishal Shrestha"]
  spec.email         = ["bishalshrestha33@gmail.com"]

  spec.summary       = %q{DeDup helps de-duplicate files in a directory.}
  spec.description   = %q{DeDup helps de-duplicate files in a directory. Just pass a .zip file of the directory you want to de-duplicate and DeDup will list out paths to the files that are duplicated.}
  spec.homepage      = "https://github.com/biiishal/de_dup"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
