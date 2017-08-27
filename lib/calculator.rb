
class Calculator

  def initialize
  end

  def calculate_sum(matrix)
    matrix.length
    first_diagonal = matrix.map.with_index {|row, i| row[i]} .inject :+
    inverted_diagonal = matrix.map.with_index {|row, i| row[-i-1]} .inject :+

    midpoint = (!matrix.length.even? ? find_midpoint(matrix) : 0)

    first_diagonal + inverted_diagonal - midpoint
  end

  def find_midpoint(matrix)
    midpoint = (matrix.length/2).ceil
    matrix[midpoint][midpoint]
  end
end
