class Matrix

  attr_reader :rows

  def initialize(matrix_string)
    @rows = convert(matrix_string)
  end

  def columns
    rows.transpose
  end

  private

  def convert(matrix_string)
    matrix_string.lines.collect do |row|
      row.split.collect(&:to_i)
    end
  end

end
