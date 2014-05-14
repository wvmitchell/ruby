class Grains

  def square(num_square)
    2 ** (num_square-1)
  end

  def total(from=64)
    if from < 2
      1
    else
      square(from) + total(from-1)
    end
  end

end
