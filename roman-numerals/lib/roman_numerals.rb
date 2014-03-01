class Fixnum

  ONE = "I"

  FIVE = "V"

  def to_roman
    self.times.collect do
      ONE
    end.join
  end

end
