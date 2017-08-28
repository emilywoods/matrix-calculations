require 'rspec'
require './lib/controller/human_learning_controller'

RSpec.describe 'human_learning_controller' do
  let(:user_comms_helper) { spy('user_comms_helper') }
  let(:calculator) {spy('calculator')}

  subject(:human_learning_controller) {HumanLearningController.new(user_comms_helper, calculator)}

  before(:each) do
    allow(user_comms_helper).to receive(:request_matrix_size)
    allow(user_comms_helper).to receive(:request_matrix_values)
  end

  it 'should request matrix size from user' do
    human_learning_controller.run_program

    expect(user_comms_helper).to have_received(:request_matrix_size)
  end

  it 'should get matrix size from user' do
    human_learning_controller.run_program

    expect(user_comms_helper).to have_received(:get_matrix_size)
  end

  it 'should request matrix values from user' do
    human_learning_controller.run_program

    expect(user_comms_helper).to have_received(:request_matrix_values)
  end

  it 'should get matrix size from user' do
    human_learning_controller.run_program

    expect(user_comms_helper).to have_received(:get_matrix_values)
  end

  it 'should calculate the sum of diagonals' do
    allow(user_comms_helper).to receive(:get_matrix_size).and_return(2)
    allow(user_comms_helper).to receive(:get_matrix_values).and_return([["2", "1"], ["2", "2"]])

    human_learning_controller.run_program

    expect(calculator).to have_received(:calculate_sum).with([["2", "1"], ["2", "2"]])
  end

  it 'should output the result and say thank you to user' do
    allow(user_comms_helper).to receive(:get_matrix_size).and_return(2)
    allow(user_comms_helper).to receive(:get_matrix_values).and_return([["2", "1"], ["2", "2"]])
    allow(calculator).to receive(:calculate_sum).and_return(7)

    human_learning_controller.run_program

    expect(user_comms_helper).to have_received(:output_result).with(7)
    expect(user_comms_helper).to have_received(:say_thank_you)
  end
end
