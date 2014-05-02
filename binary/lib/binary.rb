class Binary

  attr_reader :binary_text

  def initialize(binary_text)
    @binary_text = binary_text
  end

  def to_decimal
    digits.map.with_index {|digit, index| digit.to_i * 2 ** index}.inject(:+)
  end

  def digits
    @binary_text.split("").reverse
  end
end
