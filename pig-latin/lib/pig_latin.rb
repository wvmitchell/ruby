class PigLatin

  def self.translate(phrase)
    if phrase[0].vowel?
      phrase + "ay"
    else
      phrase.split("").rotate.join + "ay"
    end
  end

end

class String

  def vowel?
    %w(a e i o u y A E I O U Y).include? self
  end

end
