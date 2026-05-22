require_relative 'lib/pluckit/version'

Gem::Specification.new do |s|
  s.description = 'Extract values from Enumerables'
  s.authors     = ['Daniel Pepper']
  s.files       = `git ls-files * ':!:spec'`.split("\n")
  s.homepage    = 'https://github.com/dpep/rb_pluckit'
  s.license     = 'MIT'
  s.name        = 'pluckit'
  s.summary     = 'PluckIt'
  s.version     = PluckIt::VERSION

  s.required_ruby_version = '>= 3'

  s.add_development_dependency 'debug', '>= 1'
  s.add_development_dependency 'rspec', '>= 3.10'
  s.add_development_dependency 'rspec-debugging'
  s.add_development_dependency 'simplecov', '>= 0.22'
end
