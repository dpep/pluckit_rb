module PluckIt
  VERSION = '0.1.0'

  class << self

    def pluck v, handle
      if v.is_a? Hash
        v[handle]
      elsif ([Symbol, String].include? handle.class) and v.respond_to? handle
        v.send handle
      elsif v.is_a? Array
        if handle.is_a? Regexp
          v.grep handle
        else
          v[handle]
        end
      else
        raise ArgumentError.new "invalid handle: #{handle}, for value #{v}"
      end
    end

  end
end


class Array
  def pluck(handle)
    each_with_object(clone.clear) do |val, res|
      res << PluckIt.pluck(val, handle)
    end
  end
end


class Hash
  def pluck(handle)
    each_with_object(clone.clear) do |(key, val), res|
      res[key] = PluckIt.pluck(val, handle)
    end
  end
end


class Set
  def pluck(handle)
    each_with_object(clone.clear) do |val, res|
      res.add PluckIt.pluck(val, handle)
    end
  end
end
