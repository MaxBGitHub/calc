# Simple calculator in written C (GNU99) - without math.h

- Does not use math.h
- Implements shunting yard algorithm to convert infix math expression to postfix notation (Reverse Polish notation)
- Supports floating point inputs (only dot [0x2E] no comma [0x2C])
  - 3.14 OK
  - 3,14 NOT OK
 
**Uses Newton's method for square root approximation so precision is off when using suqare roots.**


## Supports the following symbols / operators:
| Operator | Operation |
| -------- | --------- |
| + | Add |
| - | Subtract |
| * | Multiply |
| / | Divide |
| \| | Square root of |
| ^ | Power of |
| ( | Start group |
| ) | End group |


## Example
(3^2 + 5) * |16 / 4 - 2

### Example Output
Input normalized to: (3^2+5)*|16/4-2  
Postfix shunting yard: 3 2 ^ 5 + 16 | * 4 / 2 -  
powerof_f(a, b) -> powerof_f(3.000000, 2.000000) -> 9.000000  
add_f(a, b) -> add_f(9.000000, 5.000000) -> 14.000000  
sqrtof_f(b) -> sqrtof_f(16.000000) -> 4.000000  
multiply_f(a, b) -> multiply_f(14.000000, 4.000000) -> 56.000008  
divide_f(a, b) -> divide_f(56.000008, 4.000000) -> 14.000002  
subtract_f(a, b) -> subtract_f(14.000002, 2.000000) -> 12.000002  
  
Result: 12.000002  


### Compiled with: 
"gcc calc.c -o calc -std=gnu99 -Wall -pedantic -Wextra -Wundef -Wshadow -Wpointer-arith -Wcast-align -Wstrict-prototypes -Wstrict-overflow=5 -Wwrite-strings -Waggregate-return -Wswitch-default -Wunreachable-code -Winit-self -save-temps"
