class MatrixParser

  def parse(size, input_matrix)
    validate_matrix_values(size, input_matrix)
    matrix = split_strings_into_values(input_matrix)
    convert_strings_to_ints(matrix)
  end

  private

  def validate_matrix_values(size, matrix)
    raise InvalidMatrixValue if matrix.first == nil || matrix.first == " "

    flat_matrix = validate_number_of_values_per_row(matrix, size)

    validate_each_value_is_an_integer(flat_matrix)
  end

  def split_strings_into_values(matrix)
    matrix.map do |row|
      row.split(/ /)
    end
  end

  def convert_strings_to_ints(matrix)
    matrix.map do |row|
     row.map(&:to_i)
    end
  end

  def validate_each_value_is_an_integer(flat_matrix)
    flat_matrix.each do |value|
      raise InvalidMatrixValue unless value.match(/\d+/)
    end
  end

  def validate_number_of_values_per_row(matrix, size)
    matrix.flat_map do |row|
      row_values = row.split(/ /)
      raise InvalidMatrixValue unless row_values.size == size
      row_values
    end
  end

end

class InvalidMatrixValue < StandardError
  INVALID_MATRIX_VALUE = "Error: invalid input for matrix value."
  def initialize(msg=INVALID_MATRIX_VALUE)
    super
  end
end
