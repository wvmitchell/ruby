class SumOfMultiples

  def self.to(up_to)
    (0...up_to).inject do |sum, num|
      if num % 3 == 0
        sum + num
      else
        sum + 0
      end
    end
  end

end
