require 'rspec'
require './lib/human_learning_controller'

RSpec.describe 'human_learning_controller' do
  let(:user_comms_helper) { spy('user_comms_helper') }
  let(:parser) {spy('parser')}
  let(:calculator) {spy('calculator')}

  subject(:human_learning_controller) {HumanLearningController.new(user_comms_helper, parser, calculator)}

  before(:each) do
    allow(user_comms_helper).to receive(:request_matrix_size)
    allow(user_comms_helper).to receive(:request_matrix_values)
  end

  it 'should display an error message when matrix size is not a number' do
    allow(user_comms_helper).to receive(:get_user_input).and_return("Hello")

    expect{human_learning_controller.run_program}.to raise_error(InvalidMatrixSize)
    expect{human_learning_controller.run_program}.to raise_error.with_message(InvalidMatrixSize::INVALID_MATRIX_SIZE)
  end

  it 'should display an error message when matrix size is not an integer' do
    allow(user_comms_helper).to receive(:get_user_input).and_return("6.6")

    expect{human_learning_controller.run_program}.to raise_error(InvalidMatrixSize)
    expect{human_learning_controller.run_program}.to raise_error.with_message(InvalidMatrixSize::INVALID_MATRIX_SIZE)
  end

  it 'should display an error message when matrix size is too large' do
    allow(user_comms_helper).to receive(:get_user_input).and_return("11")

    expect{human_learning_controller.run_program}.to raise_error(InvalidMatrixSize)
    expect{human_learning_controller.run_program}.to raise_error.with_message(InvalidMatrixSize::INVALID_MATRIX_SIZE)
  end

  it 'should display an error message when matrix size is zero' do
    allow(user_comms_helper).to receive(:get_user_input).and_return("0")

    expect{human_learning_controller.run_program}.to raise_error(InvalidMatrixSize)
    expect{human_learning_controller.run_program}.to raise_error.with_message(InvalidMatrixSize::INVALID_MATRIX_SIZE)
  end

  it 'should display an error message when matrix value is not a number' do
    allow(user_comms_helper).to receive(:get_user_input).and_return("2")
    allow(user_comms_helper).to receive(:get_matrix_values).with(2).and_return(["2 1", "B 1"])

    expect{human_learning_controller.run_program}.to raise_error(InvalidMatrixValue)
    expect{human_learning_controller.run_program}.to raise_error.with_message(InvalidMatrixValue::INVALID_MATRIX_VALUE)
  end

  it 'should display an error message when row is blank' do
    allow(user_comms_helper).to receive(:get_user_input).and_return("5")
    allow(user_comms_helper).to receive(:get_matrix_values).with(5).and_return([" "])

    expect{human_learning_controller.run_program}.to raise_error(InvalidMatrixValue)
    expect{human_learning_controller.run_program}.to raise_error.with_message(InvalidMatrixValue::INVALID_MATRIX_VALUE)
  end

  it 'should display an error message when row is incomplete' do
    allow(user_comms_helper).to receive(:get_user_input).and_return("2")
    allow(user_comms_helper).to receive(:get_matrix_values).with(2).and_return(["2 1", "2"])

    expect{human_learning_controller.run_program}.to raise_error(InvalidMatrixValue)
    expect{human_learning_controller.run_program}.to raise_error.with_message(InvalidMatrixValue::INVALID_MATRIX_VALUE)
  end

  it 'should display an error message when row has too many values' do
    allow(user_comms_helper).to receive(:get_user_input).and_return("2")
    allow(user_comms_helper).to receive(:get_matrix_values).with(2).and_return(["2 1", "2 1 2"])

    expect{human_learning_controller.run_program}.to raise_error(InvalidMatrixValue)
    expect{human_learning_controller.run_program}.to raise_error.with_message(InvalidMatrixValue::INVALID_MATRIX_VALUE)
  end

  it 'should calculate the sum of the diagonals when the input is valid' do
    allow(user_comms_helper).to receive(:get_user_input).and_return("2")
    allow(user_comms_helper).to receive(:get_matrix_values).with(2).and_return(["2 1", "2 1"])

    result = human_learning_controller.run_program
    expect(result).to eq('5')

  end
end
