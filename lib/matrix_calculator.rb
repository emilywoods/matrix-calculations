require_relative 'controller/calculator_controller'
require_relative 'helper/user_comms_helper'
require_relative 'calculator/calculator'

class MatrixCalculator
  controller = CalculatorController.new(UserCommsHelper, Calculator.new)
  controller.run_program
end
