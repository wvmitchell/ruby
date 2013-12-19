class Binary

  attr_reader :binary_num

  def initialize(binary_num)
    @binary_num = binary_num
  end

  def to_decimal
    binary_digits = binary_num.chars.reverse
    decimal_sum = 0
    binary_digits.each_with_index do |digit, index|
      decimal_sum += digit.to_i * (2**index)
    end
    decimal_sum
  end
end
