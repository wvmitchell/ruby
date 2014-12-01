class Scrabble

  attr_reader :letters

  def initialize(word)
    @letters = parse(word)
  end

  def score
    letters.inject(0) do |sum, letter|
      value_key = LETTER_VALUES.keys.find do |key|
        key.include? letter
      end
      sum + LETTER_VALUES[value_key]
    end
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
