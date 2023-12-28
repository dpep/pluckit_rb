require "byebug"
require "rspec"
require "simplecov"

SimpleCov.start do
  add_filter "spec/"
end

if ENV["CI"] == "true" || ENV["CODECOV_TOKEN"]
  require "simplecov_json_formatter"
  SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
end

# load this gem
gem_name = Dir.glob("*.gemspec")[0].split(".")[0]
require gem_name

RSpec.configure do |config|
  # allow "fit" examples
  config.filter_run_when_matching :focus

  config.mock_with :rspec do |mocks|
    # verify existence of stubbed methods
    mocks.verify_partial_doubles = true
  end

  # monkey patch unless :skip_patch
  config.before do |example|
    if example.metadata[:skip_patch]
      if Array.method_defined?(:pluck)
        Array.class_eval { remove_method(:pluck) }
        Hash.class_eval { remove_method(:pluck) }
        Set.class_eval { remove_method(:pluck) }
      end
    else
      load "./lib/pluckit.rb"
    end
  end
end

class ABC
  attr_accessor :val

  def initialize(v = nil)
    self.val = v
  end

  def ott
    123
  end
end
