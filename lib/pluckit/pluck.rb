module PluckIt
  extend self

  refine Array do
    def pluck *handles
      PluckIt.pluck self, *handles
    end
  end

  refine Hash do
    def pluck *handles
      PluckIt.pluck self, *handles
    end
  end

  refine Set do
    def pluck *handles
      PluckIt.pluck self, *handles
    end
  end

  def pluck enumerable, *handles
    items = enumerable.each_with_object(
      enumerable.clone.clear
    )
    # TODO: if no clone / clear, use new

    if enumerable.is_a?(Hash)
      items.each do |(key, val), res|
        res[key] = pluckit(val, *handles)
      end
    elsif enumerable.is_a?(Set)
      items.each do |val, res|
        res.add pluckit(val, *handles)
      end
    else
      items.each do |val, res|
        res << pluckit(val, *handles)
      end
    end
  end

  def pluckit v, *handles
    if handles.count > 1
      handles.map {|h| pluckit_single v, h }
    else
      pluckit_single v, handles.first
    end
  end

  private

  def pluckit_single v, handle
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
