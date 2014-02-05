# The Proverb Builder
class Proverb
  def initialize(*items)
    @qualifier = items[-1][:qualifier] if items[-1].class == Hash
    @items = @qualifier ? items[0..-2] : items
  end

  def to_s
    stanza = ''
    @items.each_cons(2) do |pair|
      first_object = pair[0]
      second_object = pair[1]
      stanza += "For want of a #{first_object} the #{second_object} was lost.\n"
    end
    stanza += final_line
  end

  private

  def final_line
    if @qualifier
      "And all for the want of a #{@qualifier + ' ' + @items[0]}."
    else
      "And all for the want of a #{@items[0]}."
    end
  end
end
