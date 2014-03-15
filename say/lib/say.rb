require 'humanize'

class Say

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def in_english
    raise_if_out_of_bounds
    number.humanize.gsub('and ', '').gsub(',', '')
  end

  private

  def raise_if_out_of_bounds
    raise(ArgumentError) if (number < 0 || number >= 1000000000000)
  end

end
