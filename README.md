# Matrix Diagonal Sum Calculator

The calculator requires two inputs from the user:
1. Matrix size: positive integer in the range 1 - 10
2. A series values for each row and column as floating point numbers

# Prerequisites
This program makes use of ruby gems, such as RSpec and Rubocop (for testing and formatting, respectively).
[Bundler](http://bundler.io/) is used to install and manage these gems.

To install bundler:     
`gem install bundler`

To install the required gems:   
`bundle install`

# Acceptance Criteria
Acceptance Criteria can be found in `ACs.md`

# Running
**Executing the program:**      
`>ruby lib/matrix_calculator.rb`

User will receive a prompt:
```
Please input the size of N x N matrix:
```
At which point they must input a value e.g. 3   
Then the user will receive a series of prompts (equal in number to the size of the matrix), requesting
values for the matrix for each row:
```
Please input a series of values for the 3 x 3 matrix
Row: 0
```
Each of the input values must be separated by a single space. The number of values input for a row should be 
equal to the size of the matrix. 

**To run the tests:**       
`rspec spec/`

**To run the formatter**
Run Rubocop to view inconsistencies without making changes:     
`rubocop`

Run Rubocop with formatting:      
`bundle exec rubocop --autocorrect`

# Areas for improvement
 
 - Tests should include error messages
 
 - Add CI with unit tests and formatting checks to verify successful builds each time a commit
 is pushed to the remote repo
 



