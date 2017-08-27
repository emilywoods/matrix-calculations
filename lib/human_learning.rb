
class HumanLearning

  controller = HumanLearningController.new(UserCommsHelper, Parser.new, Calculator.new)
  controller.run_program

end
