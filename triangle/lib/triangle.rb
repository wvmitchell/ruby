class Triangle

  attr_reader :sides

  def initialize(*sides)
    @sides = sides
    raise TriangleError unless legal_triangle?
  end

  def kind
    equilateral? || isosceles? || scalene?
  end

  private

  def equilateral?
    :equilateral if sides.uniq.length == 1
  end

  def isosceles?
    :isosceles if sides.uniq.length == 2
  end

  def scalene?
    :scalene
  end

  def legal_triangle?
    positive_lengths? && valid_inequality?
  end

  def positive_lengths?
    sides.all? {|side| side > 0}
  end

  def valid_inequality?
    a, b, c = sides.sort
    c < a + b
  end

end

class TriangleError < StandardError
end
