class SumOfMultiples

  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(up_to)
    (0...up_to).inject do |sum, num|
      if num % 3 == 0 || num % 5 == 0
        sum + num
      else
        sum
      end
    end
  end

  def to(up_to)
    (0...up_to).inject do |sum, num|
      if multiples.any? {|mult| num % mult == 0}
        sum + num
      else
        sum
      end
    end
  end

end
