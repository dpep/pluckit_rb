require_relative 'pluckit/pluck.rb'

module PluckIt
  VERSION = '1.0.0'
end



class Array
  def pluck *handles
    each_with_object(clone.clear) do |val, res|
      res << PluckIt.pluck(val, *handles)
    end
  end
end


class Hash
  def pluck *handles
    each_with_object(clone.clear) do |(key, val), res|
      res[key] = PluckIt.pluck(val, *handles)
    end
  end
end


class Set
  def pluck *handles
    each_with_object(clone.clear) do |val, res|
      res.add PluckIt.pluck(val, *handles)
    end
  end
end
