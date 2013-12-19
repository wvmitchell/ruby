class Triangle

  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise TriangleError unless legalTriangle?
  end

  def kind
    if isEquilateral?
      :equilateral
    elsif isIsosceles?
      :isosceles
    else
      :scalene
    end
  end

  def isEquilateral?
    (sides[0] == sides[1]) && (sides[1] == sides[2])
  end

  def isIsosceles?
    (sides[0] == sides[1]) || (sides[1] == sides[2]) || (sides[0] == sides[2])
  end

  def legalTriangle?
    legalSize? && sidesNonZero?
  end

  def legalSize?
    sorted = sides.sort
    sorted[2] < (sorted[0]+sorted[1])
  end

  def sidesNonZero?
    (sides[0] > 0) && (sides[1] > 0) && (sides[2] > 0)
  end

end

class TriangleError < StandardError
end
