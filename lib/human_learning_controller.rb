
class HumanLearningController

  attr_reader :user_comms, :user_comms_helper, :parser, :calculator

  def initialize(user_comms, user_comms_helper, parser, calculator)
    @user_comms = user_comms
    @user_comms_helper = user_comms_helper
    @parser = parser
    @calculator = calculator
  end

  def run_program
    matrix_size = user_comms.get_matrix_size
    matrix_string = user_comms.get_matrix_values(matrix_size)

    matrix = parser.parse(matrix_string)
    diagnonal_sum = calculator.calculate(matrix)

    user_comms_helper.output(diagnonal_sum)
  end
end
