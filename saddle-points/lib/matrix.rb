class Matrix

  attr_reader :rows, :columns

  def initialize(matrix)
    @rows = parse(matrix)
    @columns = rows.transpose
  end

  private

  def parse(matrix)
    matrix.lines.collect do |row|
      row.split.collect(&:to_i)
    end
  end

end
