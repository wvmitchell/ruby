class Fixnum

  def to_roman
    letters = []
    if self.edge_case
      if four?
        letters << 'IV'
      elsif nine?
        letters << 'IX'
      else
        letters << 'XL' + (self%40).to_roman
      end
    else
      tens = self / 10
      test = self % 10
      fives = test / 5
      test = test % 5
      ones = test / 1
      add_tens(letters, tens)
      add_fives(letters, fives)
      add_ones(letters, ones)
    end
    letters.join
  end

  def edge_case
    four? || nine? || forties?
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

  def four?
    self == 4
  end

  def nine?
    self == 9
  end

  def forties?
    self >= 40 && self < 50
  end

end
