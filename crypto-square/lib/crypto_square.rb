class Crypto

  attr_reader :plaintext

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def normalize_plaintext
    plaintext.tr('^a-zA-Z0-9', '').downcase
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

end
