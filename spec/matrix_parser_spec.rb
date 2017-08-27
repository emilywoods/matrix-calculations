require 'rspec'
require './lib/matrix_parser'

RSpec.describe 'parser' do

  subject(:parser) {MatrixParser.new}

  it 'should display an error message when matrix value is not a number' do
    source = ["2 1", "B 1"]

    expect{parser.parse(2, source)}.to raise_error(InvalidMatrixValue)
    expect{parser.parse(2, source)}.to raise_error.with_message(InvalidMatrixValue::INVALID_MATRIX_VALUE)
  end

  it 'should display an error message when row is blank' do
    source = [" "]

    expect{parser.parse(2, source)}.to raise_error(InvalidMatrixValue)
    expect{parser.parse(2, source)}.to raise_error.with_message(InvalidMatrixValue::INVALID_MATRIX_VALUE)
  end

  it 'should display an error message when row is incomplete' do
    source = ["2 1", "2"]

    expect{parser.parse(2, source)}.to raise_error(InvalidMatrixValue)
    expect{parser.parse(2, source)}.to raise_error.with_message(InvalidMatrixValue::INVALID_MATRIX_VALUE)
  end

  it 'should display an error message when row has too many values' do
    source = ["2 1", "2 1 2"]

    expect{parser.parse(2, source)}.to raise_error(InvalidMatrixValue)
    expect{parser.parse(2, source)}.to raise_error.with_message(InvalidMatrixValue::INVALID_MATRIX_VALUE)
  end
end
