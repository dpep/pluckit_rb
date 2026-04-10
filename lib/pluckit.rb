require 'set'
require_relative 'pluckit/version'
require_relative 'pluckit/pluck'

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
