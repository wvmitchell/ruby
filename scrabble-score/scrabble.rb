class Scrabble

  attr_reader :letters

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @letters = parse(word)
  end

  def score
    letters.inject(0) do |sum, letter|
      sum + value(letter)
    end
  end

  def value(letter)
    key = LETTER_VALUES.keys.find do |k|
      k.include? letter
    end
    LETTER_VALUES[key]
  end

  def parse(word)
    word.to_s.gsub(/\W+/, '').downcase.chars
  end

  LETTER_VALUES = {
    ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'] => 1,
    ['d', 'g'] => 2,
    ['b', 'c', 'm', 'p'] => 3,
    ['f', 'h', 'v', 'w', 'y'] => 4,
    ['k'] => 5,
    ['j', 'x'] => 8,
    ['q', 'z'] => 10
  }

end
