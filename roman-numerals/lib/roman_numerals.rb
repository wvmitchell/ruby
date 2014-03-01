class Fixnum

  def to_roman
    letters = []
    if self.edge_case
      if four?
        letters << 'IV'
      elsif nine?
        letters << 'IX'
      elsif forties?
        letters << 'XL' + (self-40).to_roman
      elsif nineties?
        letters << 'XC' + (self-90).to_roman
      elsif fourhundreds?
        letters << 'CD' + (self-400).to_roman
      elsif ninehundreds?
        letters << 'CM' + (self-900).to_roman
      end
    else
      if thousand_or_greater?
        letters << 'M' + (self-1000).to_roman
      elsif fivehundred_or_greater?
        letters << 'D' + (self-500).to_roman
      elsif onehundred_or_greater?
        letters << 'C' + (self-100).to_roman
      elsif fifty_or_greater?
        letters << 'L' + (self-50).to_roman
      elsif ten_or_greater?
        letters << 'X' + (self-10).to_roman
      elsif five_or_greater?
        letters << 'V' + (self-5).to_roman
      else
        letters << 'I' * self
      end
    end
    letters.join
  end

  def edge_case
    four? || nine? || forties? || nineties? || fourhundreds? || ninehundreds?
  end

  private

  def thousand_or_greater?
    self >= 1000
  end

  def fivehundred_or_greater?
    self >= 500
  end

  def onehundred_or_greater?
    self >= 100
  end

  def fifty_or_greater?
    self >= 50
  end

  def ten_or_greater?
    self >= 10
  end

  def five_or_greater?
    self >= 5
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

  def nineties?
    self >= 90 && self < 100
  end

  def fourhundreds?
    self >= 400 && self < 500
  end

  def ninehundreds?
    self >= 900 && self < 1000
  end

end
