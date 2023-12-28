package_name = File.basename(__FILE__).split(".")[0]
require "./lib/#{package_name}/version"

package = PluckIt

Gem::Specification.new do |s|
  s.name        = File.basename(__FILE__).split(".")[0]
  s.version     = package.const_get "VERSION"
  s.authors     = ["Daniel Pepper"]
  s.summary     = "PluckIt"
  s.description = "Extract values from Enumerables"
  s.homepage    = "https://github.com/dpep/#{package_name}_rb"
  s.license     = "MIT"
  s.files       = `git ls-files * ":!:spec"`.split("\n")

  s.add_development_dependency "byebug"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
end
