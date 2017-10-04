$LOAD_PATH.unshift 'lib'
package_name = 'pluckit'
require "#{package_name}"
package = PluckIt


Gem::Specification.new do |s|
  s.name        = package_name
  s.version     = package.const_get 'VERSION'
  s.authors     = ['Daniel Pepper']
  s.summary     = 'PluckIt'
  s.description = 'Extract values from Enumerables'
  s.homepage    = "https://github.com/dpep/#{package_name}"
  s.license     = 'MIT'

  s.files       = Dir.glob('lib/**/*')
  s.test_files  = Dir.glob('test/**/test_*')

  s.add_development_dependency 'minitest', '~> 5'
  s.add_development_dependency 'rake', '~> 10'
end
