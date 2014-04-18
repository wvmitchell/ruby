require 'forwardable'

class Matrix

  extend Forwardable

  attr_reader :matrix
  alias :rows :matrix
  def_delegator :rows, :transpose, :columns

  def initialize(matrix_string)
    @matrix = parse(matrix_string)
  end

  def saddle_points
    points = []
    rows.each_index do |r|
      columns.each_index do |c|
        points << [r, c] if saddle_point?(r, c)
      end
    end
    points
  end

  private

  def parse(matrix_string)
    matrix_string.split("\n").collect do |row|
      row.split.collect(&:to_i)
    end
  end

  def saddle_point?(x, y)
    row = rows[x]
    column = columns[y]
    point = matrix[x][y]
    row.max == point && column.min == point
  end

end
