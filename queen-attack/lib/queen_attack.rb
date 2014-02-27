class Queens

  attr_reader :white, :black, :board

  def initialize(args={})
    @white = args[:white] || [0,3]
    @black = args[:black] || [7,3]
    @board = draw_board
    raise ArgumentError, 'Queens cannot occupy same space' if white == black
  end

  def to_s
    board.collect do |row|
      row.join(' ')
    end.join("\n")
  end

  def draw_board
    board = 8.times.collect {Array.new(8, 'O')}
    board[white[0]][white[1]] = 'W'
    board[black[0]][black[1]] = 'B'
    board
  end

  def attack?
    white[0] == black[0]
  end

end
