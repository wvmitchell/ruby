class Matrix

  attr_reader :rows

  def initialize(matrix)
    @rows = parse(matrix)
  end

  private

  def parse(matrix)
    matrix.lines.collect do |row|
      row.split.collect(&:to_i)
    end
  end

end
