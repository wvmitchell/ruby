class Fixnum

  def to_roman
    self.times.collect do
      'I'
    end.join
  end

end
