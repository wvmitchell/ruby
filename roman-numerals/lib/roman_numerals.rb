class Fixnum

  ROMAN_CONSTANTS = {"I" => 1, "V" => 5}

  def to_roman
    if self.edge_case
      "IV"
    else
      letters = []
      fives = self / 5
      test = self % 5
      ones = test / 1
      add_fives(letters, fives)
      add_ones(letters, ones)
      letters.join
    end
  end

  def edge_case
    self == 4
  end

  private

  def add_fives(letters, num)
    num.times { letters << 'V'}
  end

  def add_ones(letters, num)
    num.times { letters << 'I' }
  end

end
