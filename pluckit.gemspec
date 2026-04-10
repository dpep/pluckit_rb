package_name = File.basename(__FILE__, '.gemspec')
require_relative File.join('lib', package_name, 'version')
package = PluckIt

Gem::Specification.new do |s|
  s.description = 'Extract values from Enumerables'
  s.authors     = ['Daniel Pepper']
  s.files       = `git ls-files * ':!:spec'`.split("\n")
  s.homepage    = "https://github.com/dpep/rb_#{package_name}"
  s.license     = 'MIT'
  s.name        = package_name
  s.summary     = 'PluckIt'
  s.version     = package.const_get('VERSION')

  s.required_ruby_version = '>= 3'

  s.add_development_dependency 'debug', '>= 1'
  s.add_development_dependency 'rspec', '>= 3.10'
  s.add_development_dependency 'rspec-debugging'
  s.add_development_dependency 'simplecov', '>= 0.22'
end
