class Octal

  attr_reader :octaldecimal

  def initialize(octaldecimal)
    @octaldecimal = octaldecimal
    check_invalid
  end

  def to_decimal
    octaldecimal.chars.reverse.map.with_index do |digit, index|
      digit.to_i * 8 ** index
    end.inject(:+)
  end

  def check_invalid
    if octaldecimal =~ /[a-zA-Z8-9]/
      @octaldecimal = '0'
    end
  end

end
