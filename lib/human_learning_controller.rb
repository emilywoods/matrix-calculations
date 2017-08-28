class HumanLearningController

  attr_reader :user_comms_helper, :matrix_parser, :calculator

  def initialize(user_comms_helper, matrix_parser, calculator)
    @user_comms_helper = user_comms_helper
    @matrix_parser = matrix_parser
    @calculator = calculator
  end

  def run_program
    user_comms_helper.request_matrix_size
    matrix_size = user_comms_helper.get_matrix_size

    user_comms_helper.request_matrix_values(matrix_size)
    string_number_matrix = user_comms_helper.get_matrix_values(matrix_size)

    float_matrix = matrix_parser.parse(string_number_matrix)
    diagonal_sum = calculator.calculate_sum(float_matrix)

    user_comms_helper.output_result(diagonal_sum)
    user_comms_helper.say_thank_you
  end

end


