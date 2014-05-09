class Triangle

  def initialize(*sides)
  end

  def kind
    equilateral?
  end

  private

  def equilateral?
    :equilateral
  end

end
