class Matrix

  attr_reader :rows, :columns

  def initialize matrix
    @rows = parse matrix
    @columns = rows.transpose
  end

  def saddle_points
    positions.select do |position|
      is_saddle_point? position
    end
  end

  private

  def is_saddle_point?(position)
    value = rows[position[0]][position[1]]
    rows[position[0]].all? {|test| value >= test} &&
    columns[position[1]].all? {|test| value <= test}
  end

  def parse matrix
    matrix.lines.collect do |row|
      row.split.collect &:to_i
    end
  end

  def positions
    positions = []
    (0...(rows.count)).each do |row|
      (0...(columns.count)).each do |col|
        positions << [row,col]
      end
    end
    positions
  end

end
