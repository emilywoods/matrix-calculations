require 'rspec'
require './lib/human_learning'

describe 'human_learning' do
  subject(human_learning) {HumanLearning}

  it 'should display an error message when matrix size is not a valid input' do
    true.should == false
  end

  it 'should display an error message when matrix size is too large' do
    true.should == false
  end

  it 'should display an error message when matrix value is not a number' do
    true.should == false
  end

  it 'should display an error message when row is blank' do
    true.should == false
  end

  it 'should display an error message when row is incomplete' do
    true.should == false
  end

  it 'should display an error message when row has too many values' do
    true.should == false
  end

  it 'should calculate the sum of the diagonals when the input is valid' do
    true.should == false
  end
end
