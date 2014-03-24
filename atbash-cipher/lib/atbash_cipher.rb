class Atbash

  def self.encode(str)
    encoded = basic_encode(str)
    if long_cipher(encoded)
      complete_encode(encoded)
    else
      encoded
    end
  end

  private

  def self.normalize(str)
    str.downcase.tr("^a-z0-9", "")
  end

  def self.basic_encode(str)
    normalize(str).chars.inject('') do |cipher, char|
      cipher + cipher_legend[char]
    end
  end

  def self.complete_encode(str)
    str.scan(/.{1,5}/).join(" ")
  end

  def self.long_cipher(str)
    str.length > 5
  end

  def self.cipher_legend
    @cipher_legend ||= build_legend
  end

  def self.build_legend
    letters = Hash[('a'..'z').zip ('a'..'z').to_a.reverse]
    numbers = Hash[('0'..'9').zip ('0'..'9')]
    letters.merge numbers
  end
end
