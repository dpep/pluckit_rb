module PluckIt
  VERSION = '0.2.0'

  class << self

    def pluck v, *handles
      if handles.count > 1
        handles.map {|h| pluck_single v, h }
      else
        pluck_single v, handles.first
      end
    end


    private

    def pluck_single v, handle
      if v.is_a? Hash
        v[handle]
      elsif ([Symbol, String].include? handle.class) and v.respond_to? handle
        v.send handle
      elsif handle.is_a? Regexp and v.respond_to? :grep
        v.grep handle
      elsif v.is_a? Array
        v[handle]
      else
        raise ArgumentError.new "invalid handle: #{handle}, for value #{v}"
      end
    end

  end
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
