
class HumanLearningController

  attr_reader :user_comms_helper, :parser, :calculator

  def initialize(user_comms_helper, parser, calculator)
    @user_comms_helper = user_comms_helper
    @parser = parser
    @calculator = calculator
  end

  def run_program
    user_comms_helper.request_matrix_size
    matrix_size_string = user_comms_helper.get_user_input
    matrix_size = validate_matrix_size(matrix_size_string)

    user_comms_helper.request_matrix_values
    matrix_string = user_comms_helper.get_matrix_values(matrix_size)
    validate_matrix_values(matrix_string)


    matrix = parser.parse(matrix_string)
    diagnonal_sum = calculator.calculate(matrix)

    user_comms_helper.output_result(diagnonal_sum)
  end

  private
  def validate_matrix_size(matrix_size_string)
    raise InvalidMatrixSize unless matrix_size_string.match(/^(\d+)$/)
    matrix_size = matrix_size_string.to_i
    raise InvalidMatrixSize unless matrix_size < 11 && matrix_size > 0
    matrix_size
  end

  def validate_matrix_values(matrix_values)
    raise InvalidMatrixValue if matrix_values == nil || matrix_values == " "

    matrix_values.flat_map do |row|
      row.split(" ")
    end

    matrix_values.each do |value|
      raise InvalidMatrixValue unless value.match(/\d+/)
    end
  end
end

class InvalidMatrixSize < StandardError
  INVALID_MATRIX_SIZE = "Error: invalid matrix size. Require integer valid from 1 - 10"
  def initialize(msg=INVALID_MATRIX_SIZE)
    super
  end
end

class InvalidMatrixValue < StandardError
  INVALID_MATRIX_VALUE = "Error: invalid matrix value. Input must be a number"
  def initialize(msg=INVALID_MATRIX_VALUE)
    super
  end
end
