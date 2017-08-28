class Calculator

  def initialize
  end

  def calculate_sum(matrix)
    matrix.length
    left_to_right_diagonal = matrix.map.with_index {|row, i| row[i]} .inject :+
    right_to_left_diagonal = matrix.map.with_index {|row, i| row[-i-1]} .inject :+

    midpoint = (!matrix.length.even? ? find_midpoint(matrix) : 0)

    left_to_right_diagonal + right_to_left_diagonal - midpoint
  end

  def find_midpoint(matrix)
    midpoint = (matrix.length/2).ceil
    matrix[midpoint][midpoint]
  end
end
