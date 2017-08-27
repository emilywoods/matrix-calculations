
class UserCommsHelper

  def self.request_matrix_size
    @stdout.puts "Please in the size of N x N matrix:"
  end

  def self.user_input
    @stdin.gets.chomp()
  end

  def self.request_matrix_values(size)
    @stdout.puts "Please input a series of values for the #{size} x #{size} matrix"
  end

  def self.get_matrix_values(matrix_size_string)
    matrix_size = matrix_size_string.to_i
    matrix_string_array = []

    i = 0

    while i < matrix_size
      current_row(i)
      user_input = STDIN.gets.chomp
      matrix_string_array.push(user_input)
      i += 1
    end

    matrix_string_array
  end

  def self.output_result(output)
    STDOUT.puts "Result is: #{output}"
  end

  def self.say_thank_you
    @stdout.puts "Thank you!"
  end

end

private

def current_row(row)
  STDOUT.puts "Row: #{row}"
end
