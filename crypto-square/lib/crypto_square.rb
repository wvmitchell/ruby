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

  def ciphertext
    plaintext_matrix.transpose.flatten.join
  end

  def plaintext_matrix
    segments = plaintext_segments.collect {|seg| seg.split('')}
    while segments.last.length < segments.first.length
      segments.last << ''
    end
    segments
  end

  def normalize_ciphertext
    length = plaintext_matrix.length
    ciphertext.scan(/.{1,#{length}}/).join(' ')
  end

end
