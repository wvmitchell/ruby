class Series

  attr_reader :digits

  def initialize(digits)
    @digits = digits.split("").map(&:to_i)
  end

  def largest_product(num_consecutive)
    return 1 if digits.empty?
    raise ArgumentError, "too many digits" if num_consecutive > digits.length
    largest_product_slice(num_consecutive).inject(1, :*)
  end

  private

  def largest_product_slice(num_consecutive)
    slices(num_consecutive).max_by do |slice|
      slice.inject(1, :*)
    end
  end

  def slices(size)
    digits.collect.with_index do |digit, index|
      slice = digits[index, size]
      slice if slice.length == size
    end.compact
  end

end
