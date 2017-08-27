require 'rspec'
require './lib/user_comms_helper'

RSpec.describe 'user_comms_helper' do

  subject(:user_comms_helper) {UserCommsHelper}

  it 'should get the matrix values as a string' do
    MATRIX_SIZE = 1

    allow(STDIN).to receive(:gets).and_return("1")

    expect(STDOUT).to receive(:puts)
    expect(user_comms_helper.get_matrix_values(MATRIX_SIZE)).to eq(["1"])
  end

  it 'should get the matrix values as a string with each row separated' do
    MATRIX_SIZE_AS_INT = 2
    allow(STDIN).to receive(:gets).and_return("2 1")

    expect(STDOUT).to receive(:puts).exactly(MATRIX_SIZE_AS_INT).times
    expect(user_comms_helper.get_matrix_values(MATRIX_SIZE_AS_INT)).to eq(["2 1", "2 1"])
  end
end
