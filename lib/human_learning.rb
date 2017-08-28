require_relative 'human_learning_controller'
require_relative 'user_comms_helper'
require_relative 'matrix_parser'
require_relative 'calculator'

class HumanLearning

  controller = HumanLearningController.new(UserCommsHelper, Calculator.new)
  controller.run_program

end
