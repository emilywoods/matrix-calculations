class HumanLearningController
  attr_reader :user_comms_helper, :calculator

  def initialize(user_comms_helper, calculator)
    @user_comms_helper = user_comms_helper
    @calculator = calculator
  end

  def run_program
    user_comms_helper.request_matrix_size
    matrix_size = user_comms_helper.get_matrix_size

    user_comms_helper.request_matrix_values(matrix_size)
    string_matrix = user_comms_helper.get_matrix_values(matrix_size)

    diagonal_sum = calculator.calculate_sum(string_matrix)

    user_comms_helper.output_result(diagonal_sum)
    user_comms_helper.say_thank_you
  end
end
