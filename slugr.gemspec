lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "slugr/version"

Gem::Specification.new do |spec|
  spec.name          = "slugr"
  spec.version       = Slugr::VERSION
  spec.authors       = ["Michael Edlund"]
  spec.email         = ["medlund@mac.com"]

  spec.summary       = %q{Smooth cruisin' permalink slugs for ActiveRecord objects.}
  spec.description   = %q{Slugr is a gem to automatically create ActiveRecord object slugs for use in permalinks based on a title, name, headline, or some other unique and descriptive string field.}
  spec.homepage      = "https://github.com/arcticleo/slugr"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency "activerecord", ">= 5.0"
end
