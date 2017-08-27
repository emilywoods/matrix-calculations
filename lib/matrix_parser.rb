class MatrixParser

  def parse(size, matrix)
    validate_matrix_values(size, matrix)
  end

  private

  def validate_matrix_values(size, matrix)
    raise InvalidMatrixValue if matrix.first == nil || matrix.first == " "

    flat_matrix = matrix.flat_map do |row|
      row.split(" ")
      raise InvalidMatrixValue unless row.size == matrix.size
    end

    flat_matrix.each do |value|
      raise InvalidMatrixValue unless value.match(/\d+/)
    end
  end
end

class InvalidMatrixValue < StandardError
  INVALID_MATRIX_VALUE = "Error: invalid matrix value. Input must be a number"
  def initialize(msg=INVALID_MATRIX_VALUE)
    super
  end
end
