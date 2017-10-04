module PluckIt
  VERSION = '0.0.1'

  class << self

    def pluck v, handle
      if v.is_a? Array
        if handle.is_a? Regexp
          v.grep handle
        else
          v[handle]
        end
      elsif v.is_a? Hash
        v[handle]
      elsif ([Symbol, String].include? handle.class) and v.respond_to? handle
        if v.method(handle).arity <= 0
          v.send handle
        else
          v.send handle, v
        end
      else
        raise ArgumentError.new "invalid handle: #{handle}, for value #{v}"
      end
    end

  end
end


class Array
  def pluck(handle)
    map {|x| PluckIt.pluck x, handle }
  end
end


class Hash
  def pluck(handle)
    res = values.map {|x| PluckIt.pluck x, handle }
    Hash[keys.zip res]
  end
end
