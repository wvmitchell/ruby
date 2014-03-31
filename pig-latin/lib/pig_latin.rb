class PigLatin

  def self.translate(phrase)
    words = phrase.split(" ")
    words.collect {|word| interpret(word)}.join(" ")
  end

  private

  def self.interpret(word)
    #if word[0..1] == "ye"
    #  rotation(1, word)
    #elsif word[0].vowel? || (word[0] == 'x' && !word[1].vowel?)
    #  rotation(0, word)
    #elsif %w(squ thr sch).include? word[0..2]
    #  rotation(3, word)
    #elsif %w(ch qu th).include? word[0..1]
    #  rotation(2, word)
    #else
    #  rotation(1, word)
    #end
    special_vowel_translate(word) ||
    basic_vowel_sound_translate(word) ||
    special_three_letter_translate(word) ||
    special_two_letter_translate(word) ||
    simple_translate(word)
  end

  def self.rotation(num, word)
    word.split("").rotate(num).join + "ay"
  end

  def self.special_vowel_translate(word)
    if word[0..1] == "ye"
      rotation(1, word)
    end
  end

  def self.basic_vowel_sound_translate(word)
    if word[0].vowel? || (word[0] == 'x' && !word[1].vowel?)
      rotation(0, word)
    end
  end

  def self.special_three_letter_translate(word)
    if %w(squ thr sch).include? word[0..2]
      rotation(3, word)
    end
  end

  def self.special_two_letter_translate(word)
    if %w(ch qu th).include? word[0..1]
      rotation(2, word)
    end
  end

  def self.simple_translate(word)
    rotation(1, word)
  end

end

class String

  def vowel?
    %w(a e i o u y A E I O U Y).include? self
  end

end
