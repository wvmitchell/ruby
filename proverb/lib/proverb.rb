class Proverb

  def initialize(*things)
    @qualifier = things[-1][:qualifier] if things[-1].class == Hash
    @things = @qualifier ? things[0..-2] : things
    @lines = @things.count - 1
  end

  def to_s
    stanza = ""
    @things.each_cons(2) do |pair|
      stanza += "For want of a #{pair[0]} the #{pair[1]} was lost.\n"
    end
    stanza += final_line
  end

  def final_line
    if @qualifier
      "And all for the want of a #{@qualifier + ' ' + @things[0]}."
    else
      "And all for the want of a #{@things[0]}."
    end
  end

end
