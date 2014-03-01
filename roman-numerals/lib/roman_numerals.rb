class Fixnum

  ROMAN_CONSTANTS = {"I" => 1, "V" => 5}

  def to_roman
    if self.edge_case
      case self
      when 4 then 'IV'
      when 9 then 'IX'
      end
    else
      letters = []
      tens = self / 10
      test = self % 10
      fives = test / 5
      test = test % 5
      ones = test / 1
      add_tens(letters, tens)
      add_fives(letters, fives)
      add_ones(letters, ones)
      letters.join
    end
  end

  def edge_case
    self == 4 || self == 9
  end

  private

  def add_tens(letters, num)
    num.times { letters << 'X' }
  end

  def add_fives(letters, num)
    num.times { letters << 'V'}
  end

  def add_ones(letters, num)
    num.times { letters << 'I' }
  end

end
