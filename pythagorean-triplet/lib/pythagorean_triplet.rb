require 'pry'
class Triplet
  attr_reader :sides

  def initialize(*sides)
    @sides = sides
  end

  def sum
    sides.inject(:+)
  end

  def product
    sides.inject(1, :*)
  end

  def pythagorean?
    sides[0] ** 2 + sides[1] **2 == sides[2] ** 2
  end

  def self.where(options)
    max = options[:max_factor] || 5
    min = options[:min_factor] || 1
    sum = options[:sum]

    pythagorean_triangles(min, max).collect do |triangle|
      sum ? (triangle if triangle.sum == sum) : triangle
    end.uniq do |triangle|
      triangle.product
    end
  end

  def self.pythagorean_triangles(min_factor, max_factor)
    triangles = []
    range = (min_factor..max_factor)
    range.to_a.each do |i|
      range.to_a.each do |j|
        range.to_a.each do |k|
          test = new(i, j, k)
          triangles << test if test.pythagorean?
        end
      end
    end
    triangles
  end

end
