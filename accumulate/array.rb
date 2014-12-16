class Array

  def accumulate(&block)
    self.collect { |element| block.call(element) }
  end

end
