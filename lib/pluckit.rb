require_relative 'pluckit/pluck.rb'
require_relative 'pluckit/version.rb'

class Array
  def pluck *handles
    PluckIt.pluck self, *handles
  end
end

class Hash
  def pluck *handles
    PluckIt.pluck self, *handles
  end
end

class Set
  def pluck *handles
    PluckIt.pluck self, *handles
  end
end
