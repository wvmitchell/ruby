class Queens

  attr_reader :white, :black, :board

  def initialize(args={})
    @white = args[:white] || [0,3]
    @black = args[:black] || [7,3]
    @board = draw_board
    raise ArgumentError, 'Queens cannot occupy same space' if white == black
  end

  def to_s
    board
  end

  def draw_board
  end

end
