require_relative 'pluckit/pluck.rb'

module PluckIt
  VERSION = '1.1.0'
end



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
