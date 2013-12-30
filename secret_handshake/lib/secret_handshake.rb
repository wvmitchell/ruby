class SecretHandshake

  def initialize(code)
    code = 0 if code.class != Fixnum
    @code = code.to_s(2).split('').reverse.collect(&:to_i)
  end

  def commands
    reverse_if_needed(create_handshake)
  end

  def signs
    ['wink', 'double blink', 'close your eyes', 'jump']
  end

  def reverse_if_needed(handshake)
    @code[4] == 1 ? handshake.reverse : handshake
  end

  def create_handshake
    (0..3).each_with_object([]) do |i, handshake|
      handshake << signs[i] if @code[i] == 1
    end
  end

end
