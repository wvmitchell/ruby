class OCR

  NUMBERS = {
    :" _ \n| |\n|_|\n   " => "0",
    :"   \n  |\n  |\n   " => "1",
    :" _ \n _|\n|_ \n   " => "2",
    :" _ \n _|\n _|\n   " => "3",
    :"   \n|_|\n  |\n   " => "4",
    :" _ \n|_ \n _|\n   " => "5",
    :" _ \n|_ \n|_|\n   " => "6",
    :" _ \n  |\n  |\n   " => "7",
    :" _ \n|_|\n|_|\n   " => "8",
    :" _ \n|_|\n _|\n   " => "9",
    :"   \n , \n   \n   " => ","
  }

  NUMBERS.default = "?"

  attr_reader :text

  def initialize(text)
    @text = clean(text)
  end

  def convert
    digits.collect do |digit|
      NUMBERS[digit.to_sym]
    end.join
  end

  private

  def digits
    text.split("\n").collect do |line|
      line.scan(/.../)
    end.transpose.collect do |arr|
      arr.join("\n")
    end
  end

  def clean(text)
    if text.length > 15
      text.split(/\n         \n/).join("   \n , \n   \n   ")
    else
      text
    end
  end

end
