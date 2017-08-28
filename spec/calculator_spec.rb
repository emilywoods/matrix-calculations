require 'rspec'
require './lib/calculator/calculator'

RSpec.describe 'calculator' do
  subject(:calculator) {Calculator.new}

  it 'should calculate the sum of a 2 x 2 matrix diagonal' do
    input = [["2", "1"], ["2", "4"]]

    result = calculator.calculate_sum(input)

    expect(result).to eq(9)
  end

  it 'should calculate the sum of a 2 x 2 matrix diagonal with decimal values' do
    input = [["0.6", "1"], ["2", "0.4"]]

    result = calculator.calculate_sum(input)

    expect(result).to eq(4)
  end

  it 'not calculate the midpoint twice for a matrix of odd size' do
    input = [["1", "2", "3", "4", "5"], ["6", "7", "8", "9", "0"],
             ["1", "2", "3", "4", "5"], ["6", "7", "8", "9", "0"],
             ["1", "2", "3", "4", "5"]]

    result = calculator.calculate_sum(input)

    expect(result).to eq(47)
  end

  it 'should calculate the sum of a 6 x 6 matrix diagonal' do
    input = [["10", "2", "3", "4", "5", "10"], ["1", "20", "3", "4", "20", "6"],
["1", "2", "30", "30", "5", "6"], ["1", "2", "40", "40", "5", "6"],
["1", "50", "3", "4", "50", "6"], ["60", "2", "3", "4", "5", "60"]]

    result = calculator.calculate_sum(input)

    expect(result).to eq(420)
  end
end
