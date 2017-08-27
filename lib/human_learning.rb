
class HumanLearning

  controller = HumanLearningController.new(UserComms.new, UserCommsHelper.new, Parser.new, Calculator.new)
  controller.run_program

end
