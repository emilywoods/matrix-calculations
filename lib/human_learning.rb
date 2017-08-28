require_relative 'controller/human_learning_controller'
require_relative 'helper/user_comms_helper'
require_relative 'calculator/calculator'

class HumanLearning

  controller = HumanLearningController.new(UserCommsHelper, Calculator.new)
  controller.run_program

end
