class PigLatin

  def self.translate(phrase)
    words = phrase.split(" ")
    words.collect {|word| interpret(word)}.join(" ")
  end

  private

  def self.interpret(word)
    if word[0..1] == "ye"
      rotation(1, word)
    elsif word[0].vowel? || (word[0] == 'x' && !word[1].vowel?)
      word + "ay"
    elsif %w(squ thr sch).include? word[0..2]
      rotation(3, word)
    elsif %w(ch qu th).include? word[0..1]
      rotation(2, word)
    else
      rotation(1, word)
    end
  end

  def self.rotation(num, word)
    word.split("").rotate(num).join + "ay"
  end

end

class String

  def vowel?
    %w(a e i o u y A E I O U Y).include? self
  end

end
