class Octal

  attr_reader :octaldecimal

  def initialize(octaldecimal)
    @octaldecimal = octaldecimal
  end

  def to_decimal
    octaldecimal.to_i(8)
  end

end
