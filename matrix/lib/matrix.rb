class Matrix

  def initialize(matrix_string)
    @rows = convert(matrix_string)
  end

  def rows
    @rows
  end

  private

  def convert(matrix_string)
    string_rows = matrix_string.split("\n")
    string_rows.collect do |row|
      row.split.collect {|cell| cell.to_i}
    end
  end

end
