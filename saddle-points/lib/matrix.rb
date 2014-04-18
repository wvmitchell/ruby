class Matrix

  def initialize(matrix_string)
    @matrix = parse(matrix_string)
  end

  def rows
    @matrix
  end

  private

  def parse(matrix_string)
    matrix_string.split("\n").collect do |row|
      row.split.collect(&:to_i)
    end
  end

end
