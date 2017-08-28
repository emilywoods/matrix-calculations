require 'rspec'
require './lib/helper/user_comms_helper'

RSpec.describe 'user_comms_helper' do
  subject(:user_comms_helper) { UserCommsHelper }

  before(:each) do
    allow(STDOUT).to receive(:puts)
  end

  describe 'get_matrix_size' do
    it 'should get the matrix size from the console as an int' do
      allow(STDIN).to receive(:gets).and_return('2')

      result = user_comms_helper.get_matrix_size

      expect(STDIN).to have_received(:gets)
      expect(result).to eq(2)
    end

    it 'should raise error if the size input is not a number' do
      allow(STDIN).to receive(:gets).and_return('B')

      expect { user_comms_helper.get_matrix_size }.to raise_error(InvalidMatrixSize)
    end

    it 'should raise error if the size input is not an integer' do
      allow(STDIN).to receive(:gets).and_return('4.4')

      expect { user_comms_helper.get_matrix_size }.to raise_error(InvalidMatrixSize)
    end

    it 'raise an error if the size input is less than one' do
      allow(STDIN).to receive(:gets).and_return('0')

      expect { user_comms_helper.get_matrix_size }.to raise_error(InvalidMatrixSize)
    end

    it 'raise an error if the size input is greater than ten' do
      allow(STDIN).to receive(:gets).and_return('11')

      expect { user_comms_helper.get_matrix_size }.to raise_error(InvalidMatrixSize)
    end
  end

  describe 'get_matrix_values' do
    it 'should raise an error if the row is blank' do
      allow(STDIN).to receive(:gets).and_return(' ')

      expect { user_comms_helper.get_matrix_values(2) }.to raise_error(InvalidMatrixValue)
    end

    it 'should raise an error if the row is incomplete' do
      allow(STDIN).to receive(:gets).and_return('1')

      expect { user_comms_helper.get_matrix_values(2) }.to raise_error(InvalidMatrixValue)
    end

    it 'should raise an error if the row is too long' do
      allow(STDIN).to receive(:gets).and_return('1 1 1 1')

      expect { user_comms_helper.get_matrix_values(2) }.to raise_error(InvalidMatrixValue)
    end

    it 'should get input values once each row' do
      allow(STDIN).to receive(:gets).and_return('1 1 1')

      user_comms_helper.get_matrix_values(3)

      expect(STDIN).to have_received(:gets).exactly(3).times
    end

    it 'should output the current row to the user' do
      allow(STDIN).to receive(:gets).and_return('1 1 1')

      user_comms_helper.get_matrix_values(3)

      expect(STDOUT).to have_received(:puts).exactly(3).times
    end

    it 'should retry once if a value is not a digit and raise an error if incorrect input again' do
      allow(STDIN).to receive(:gets).and_return('1 B 1')

      expect { user_comms_helper.get_matrix_values(3) }.to raise_error(InvalidMatrixValue)

      expect(STDOUT).to have_received(:puts).with(user_comms_helper::VALUE_RETRY)
    end

    it 'should return a matrix of strings if input is valid' do
      allow(STDIN).to receive(:gets).and_return('1 4')

      result = user_comms_helper.get_matrix_values(2)

      expect(result).to eq([%w(1 4), %w(1 4)])
    end

    it 'should return a matrix of strings if input is valid and float numbers' do
      allow(STDIN).to receive(:gets).and_return('1.1 4')

      result = user_comms_helper.get_matrix_values(2)

      expect(result).to eq([['1.1', '4'], ['1.1', '4']])
    end
  end
end
