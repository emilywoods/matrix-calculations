**Scenario: input matrix size is not a positive integer**   
When the user inputs the NxN matrix size    
And the value is not a positive integer 
Then an error message is displayed  
And the user can retry  

**Scenario: input matrix size is too large**    
When the user inputs the NxN matrix size    
And the value is greater than 10  
Then an error message is displayed  
And the user can retry  

**Scenario: user inputs a blank row**   
Given the user inputs a valid NxN matrix size   
When the user inputs values for each row    
And a row is blank  
Then an error message is displayed  
And the user can retry  

**Scenario: input row contains value which is not a (positive/negative) number**    
Given the user inputs a valid NxN matrix size   
When the user inputs values for each row    
And a value is not a positive/negative integer  
Then an error message is displayed  
And the user can retry  

**Scenario: user inputs an incomplete row** 
Given the user inputs a valid NxN matrix size   
When the user inputs values for each row    
And a row is incomplete 
Then an error message is displayed  
And the user can retry  

**Scenario: user inputs too many x values in row**  
Given the user inputs a valid NxN matrix size   
When the user inputs values for each row    
And a row has too many values   
Then an error message is displayed  
And the user can retry  

**Scenario: user inputs valid matrix size, and matrix values**  
Given the user inputs a valid NxN matrix size   
When the user inputs valid values for each row  
Then the sum of the diagonals is calculated 
And the sum is output to the console    
