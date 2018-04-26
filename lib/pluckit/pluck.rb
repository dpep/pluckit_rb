module PluckIt
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
      elsif v.respond_to? :[]
        v[handle]
      else
        raise ArgumentError.new "invalid handle: #{handle}, for value #{v}"
      end
    end

  end
end
