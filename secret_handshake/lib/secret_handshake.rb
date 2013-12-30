class SecretHandshake

  def initialize(code)
    begin
      @code = code.to_s(2).split('').reverse.collect(&:to_i)
    rescue
      @code = 0
    end
  end

  def commands
    reverse_if_needed(create_handshake)
  end

  private

  def create_handshake
    (0..3).each_with_object([]) do |i, handshake|
      handshake << signs[i] if @code[i] == 1
    end
  end

  def reverse_if_needed(handshake)
    @code[4] == 1 ? handshake.reverse : handshake
  end

  def signs
    ['wink', 'double blink', 'close your eyes', 'jump']
  end

end
