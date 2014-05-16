class Octal

  attr_reader :octaldecimal

  def initialize(octaldecimal)
    @octaldecimal = octaldecimal
    check_invalid
  end

  def to_decimal
    octaldecimal.to_i(8)
  end

  def check_invalid
    if octaldecimal.chars.any? {|char| char.to_i > 7}
      @octaldecimal = "0"
    end
  end

end
