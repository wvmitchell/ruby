class Atbash

  def self.encode(str)
    base_encoding = base_encode(str)
    space_delimit(base_encoding)
  end

  private

  def self.normalize(str)
    str.downcase.tr("^a-z0-9", "")
  end

  def self.base_encode(str)
    normalize(str).chars.inject('') do |cipher, char|
      cipher + cipher_legend[char]
    end
  end

  def self.space_delimit(str)
    str.scan(/.{1,5}/).join(" ")
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
