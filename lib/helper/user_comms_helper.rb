class UserCommsHelper
  SIZE_RETRY = 'Error: invalid size. Please retry entering a size, in the range 1 - 10'.freeze
  VALUE_RETRY = 'Error: invalid value. Please retry'.freeze

  def initialize
  end

  def self.request_matrix_size
    STDOUT.puts 'Please input the size of N x N matrix:'
  end

  def self.get_matrix_size
    user_input = STDIN.gets.strip
    validated_user_input = validate_size(user_input)
    validated_user_input ? user_input.to_i : retry_get_size
  end

  def self.request_matrix_values(size)
    STDOUT.puts "Please input a series of values for the #{size} x #{size} matrix"
  end

  def self.get_matrix_values(matrix_size)
    matrix_string_array = []

    (0..matrix_size - 1).each do |i|
      output_current_row(i)
      user_input = STDIN.gets.strip
      validated_user_input = validate_values(user_input, matrix_size)
      row = validated_user_input ? validated_user_input : retry_get_input(matrix_size)
      matrix_string_array.push(row)
    end
    matrix_string_array
  end

  def self.output_result(output)
    STDOUT.puts "Result is: #{output}"
  end

  def self.say_thank_you
    STDOUT.puts 'Thank you!'
  end

  private

  def self.validate_size(size)
    if !size.match(/^(\d+)$/)
      false
    elsif size.to_i > 10 || size.to_i < 1
      false
    else
      true
    end
  end

  def self.retry_get_size
    STDOUT.puts SIZE_RETRY
    user_input = STDIN.gets.strip
    validated_user_input = validate_size(user_input)
    raise InvalidMatrixSize unless validated_user_input
    return validated_user_input
  end

  def self.output_current_row(row)
    STDOUT.puts "Row: #{row}"
  end

  def self.retry_get_input(matrix_size)
    STDOUT.puts VALUE_RETRY
    user_input = STDIN.gets.strip
    validated_user_input = validate_values(user_input, matrix_size)
    raise InvalidMatrixValue unless validated_user_input
    return validated_user_input
  end

  def self.validate_values(row, size)
    row_values = row.split(/ /)
    if row_values.size != size
      false
    elsif row_values.any? { |value| !value.match(/\d+/) }
      false
    else
      row_values
    end
  end
end

class InvalidMatrixSize < StandardError
  INVALID_MATRIX_SIZE = 'Error: invalid matrix size. Require integer in range 1 - 10'.freeze

  def initialize(msg = INVALID_MATRIX_SIZE)
    super
  end
end

class InvalidMatrixValue < StandardError
  INVALID_MATRIX_SIZE = "Error: invalid value has been received\
  \nPlease provide numbers only".freeze

  def initialize(msg = INVALID_MATRIX_SIZE)
    super
  end
end
