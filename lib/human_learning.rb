
class HumanLearning

  controller = HumanLearningController.new(UserCommsHelper, MatrixParser.new, Calculator.new)
  controller.run_program

end
