#include <stdlib.h>

#include "calc.h"


const size_t FLOAT_BUFFER_SIZE  = 32;
const char CHAR_SPACE           = 0x20;

const char * 
get_calc_err_msg(int err)
{
  switch (err) 
  {
    case CALC_ERR_SUCCESS:
      return CALC_ERR_MSG_SUCCESS;
    case CALC_ERR_DIVIDE_BY_ZERO:
      return CALC_ERR_MSG_DIVIDE_BY_ZERO;
    case CALC_ERR_SQRT_NEGATIVE:
      return CALC_ERR_MSG_SQRT_NEGATIVE;
    default:
      return CALC_ERR_MSG_SUCCESS;
  }
}


size_t
normalize_calc_input(
  const char *token_string, 
  char tokens_out[CALC_MAX_EXPRESSION_LENGTH])
{
  if ( !token_string ) {
    return 0;
  }
  
  size_t n = 0;
  for (size_t i = 0; (i < CALC_MAX_EXPRESSION_LENGTH - 1) 
    && (token_string[i] != '\0'); ++i) 
  {
    if (is_math_token(token_string[i])) {
      tokens_out[n++] = token_string[i];
    }
  }
  tokens_out[n] = '\0';
  return n;
}


void 
char_stack_push(char_stack_t *stack, char c)
{
  if (stack->top < CALC_MAX_STACK_SIZE - 1) {
    stack->data[++stack->top] = c;
  }
}


char
char_stack_pop(char_stack_t *stack)
{
  if (stack->top >= 0) {
    return stack->data[stack->top--];
  }
  else {
    return '\0';
  }
}


char 
char_stack_peek(char_stack_t *stack) 
{
  if (stack->top >= 0) {
      return stack->data[stack->top];
  }
  else {
    return '\0';
  }
}


int 
char_stack_is_empty(char_stack_t *stack)
{
  return stack->top == -1;
}


void 
float_stack_push(float_stack_t *stack, float c)
{
  if (stack->top < CALC_MAX_STACK_SIZE - 1) {
    stack->data[++stack->top] = c;
  }
}


float
float_stack_pop(float_stack_t *stack)
{
  if (stack->top >= 0) {
    return stack->data[stack->top--];
  }
  else {
    return '\0';
  }
}


float
float_stack_peek(float_stack_t *stack) 
{
  if (stack->top >= 0) {
      return stack->data[stack->top];
  }
  else {
    return '\0';
  }
}


int 
float_stack_is_empty(float_stack_t *stack)
{
  return stack->top == -1;
}


void 
infix_to_postfix(const char *infix, char *postfix) 
{
  char_stack_t operators = { .top = -1 }  ;
  int i = 0;
  int n = 0;  

  while (infix[i] != '\0') {
    // Extract possible floating point number.
    if (is_digit_or_floating_point(infix[i])) {
      char num_buffer[FLOAT_BUFFER_SIZE];
      size_t num_index = 0;
      while ( (num_index < FLOAT_BUFFER_SIZE)
        && is_digit_or_floating_point(infix[i])) 
      {
        num_buffer[num_index++] = infix[i++];        
      }
      num_buffer[num_index] = '\0';
      // Write number to output.
      for (size_t j = 0; j < num_index; j++) {
        if (n < CALC_MAX_EXPRESSION_LENGTH - 1) {
          postfix[n++] = num_buffer[j];  
        }        
      }
      postfix[n++] = CHAR_SPACE;
    }
    else if (infix[i] == '(') {
      char_stack_push(&operators, infix[i]);
      i++;
    }
    else if (infix[i] == ')') {
      while (!char_stack_is_empty(&operators) 
        && (char_stack_peek(&operators) != '(')
        && (n <= CALC_MAX_EXPRESSION_LENGTH - 2)) 
      {
        postfix[n++] = char_stack_pop(&operators);
        postfix[n++] = CHAR_SPACE;
      }
      char_stack_pop(&operators);
      i++;
    }
    else if (is_operator_token(infix[i])) 
    {
      while ( !char_stack_is_empty(&operators) ) 
      {
        char top_operator = char_stack_peek(&operators);

        int top_precedence = precedence(top_operator);
        int cur_precedence = precedence(infix[i]);
        
        int is_cur_right_assoc    = is_operator_right_associative(infix[i]);
        int is_higher_precedence  = top_precedence > cur_precedence;
        int equal_not_right_prec  = (top_precedence == cur_precedence 
                                    && !is_cur_right_assoc);

        if ((is_higher_precedence || equal_not_right_prec) 
          && (n <= CALC_MAX_EXPRESSION_LENGTH - 2)) 
        {
          postfix[n++] = char_stack_pop(&operators);
          postfix[n++] = CHAR_SPACE;
        }
        else {
          break;
        }
      }
      char_stack_push(&operators, infix[i]);
      i++;
    }
  }

  while (!char_stack_is_empty(&operators) 
    && (n <= CALC_MAX_EXPRESSION_LENGTH - 2)) 
  {
    postfix[n++] = char_stack_pop(&operators);
    postfix[n++] = CHAR_SPACE;
  }
  postfix[n] = '\0';
}


void 
execute_operation(const char operator, float_stack_t *values) 
{
  float retVal;
  float a, b;
  int err;
  switch (operator)
  {
    case TOKEN_PLUS:
      b = float_stack_pop(values);
      a = float_stack_pop(values);
      err = add_f(a, b, &retVal);
      fprintf(stdout, "add_f(a, b) -> add_f(%f, %f) -> %f\r\n", a, b, retVal);
      break;
    case TOKEN_MINUS:
      b = float_stack_pop(values);
      a = float_stack_pop(values);
      err = subtract_f(a, b, &retVal);
      fprintf(stdout, "subtract_f(a, b) -> subtract_f(%f, %f) -> %f\r\n", a, b, retVal);
      break;
    case TOKEN_MULTIPLY:
      b = float_stack_pop(values);
      a = float_stack_pop(values);
      err = multiply_f(a, b, &retVal);
      fprintf(stdout, "multiply_f(a, b) -> multiply_f(%f, %f) -> %f\r\n", a, b, retVal);
      break;
    case TOKEN_DIVIDE_1:
    case TOKEN_DIVIDE_2:
      b = float_stack_pop(values);
      a = float_stack_pop(values);
      err = divide_f(a, b, &retVal);
      fprintf(stdout, "divide_f(a, b) -> divide_f(%f, %f) -> %f\r\n", a, b, retVal);
      break;
    case TOKEN_MODULO:
      b = float_stack_pop(values);
      a = float_stack_pop(values);
      err = modulo_f(a, b, &retVal);
      fprintf(stdout, "modulo_f(a, b) -> modulo_f(%f, %f) -> %f\r\n", a, b, retVal);
      break;
    case TOKEN_ROOT:
      b = float_stack_pop(values);
      // square root ignore the second
      err = sqrtof_f(b, &retVal);
      fprintf(stdout, "sqrtof_f(b) -> sqrtof_f(%f) -> %f\r\n",  b, retVal);
      break;
    case TOKEN_POWER:
      b = float_stack_pop(values);
      a = float_stack_pop(values);
      err = powerof_f(a, b, &retVal);
      fprintf(stdout, "powerof_f(a, b) -> powerof_f(%f, %f) -> %f\r\n", a, b, retVal);
      break;
    default:
      err = CALC_ERR_UNKOWN_OPERATOR;
  }

  if (CALC_ERR_SUCCESS == err) {
    float_stack_push(values, retVal);
  }
  else {
    fprintf(
      stdout, 
      "%f %c %f resulted in error (%d): %s\r\n", 
      a, operator, b, err, get_calc_err_msg(err));
  }
}


float
evaluate_postfix(const char *postfix) 
{
  float_stack_t values = { .top = -1 };
  int i = 0;

  while (postfix[i] != '\0') {
    if (postfix[i] == CHAR_SPACE) {
      i++;
      continue;
    }

    if (is_digit_or_floating_point(postfix[i])) {
      char num_str[FLOAT_BUFFER_SIZE];
      size_t n = 0;
      while (n < FLOAT_BUFFER_SIZE && is_digit_or_floating_point(postfix[i])) {
        num_str[n++] = postfix[i++];
      }
      num_str[n] = '\0';
      float_stack_push(&values, strtof(num_str, NULL));
    }
    else if (is_operator_token(postfix[i])) {      
      execute_operation(postfix[i], &values);
      i++;
    }
  }
  return float_stack_pop(&values);
}


void 
evaluate_input(const char *input)
{
  if ( !input ) {
    fprintf(stderr, "Input cannot be null.\r\n");
    return;
  }

  size_t input_length = 0;
  while (input[input_length] != '\0') {
    if (input_length + 1 > CALC_MAX_EXPRESSION_LENGTH) {
      fprintf(stderr, "Input is larger then CALC_MAX_EXPRESSION_LENGTH.\r\n");
      return;
    }
    ++input_length;
  }

  char expression[CALC_MAX_EXPRESSION_LENGTH];
  size_t expression_len = normalize_calc_input(input, expression);
  if (expression_len == 0 || expression_len > CALC_MAX_EXPRESSION_LENGTH) {
    fprintf(stderr, "Unable to validate input or input too large.\r\n");
    return;
  }
  fprintf(stdout, "Input normalized to: %s\r\n", expression);
  
  char postfix[CALC_MAX_EXPRESSION_LENGTH] = {0};
  infix_to_postfix(expression, postfix);

  size_t postfix_len = 0;
  while (postfix_len < CALC_MAX_EXPRESSION_LENGTH
    && postfix[postfix_len] != '\0') 
  {
    ++postfix_len;
  }
  
  if (postfix_len == 0) {  
    fprintf(stderr, "Failed to get postfix from shunting yard\r\n");
    return;
  }
  fprintf(stdout, "Postfix shunting yard: %s\r\n", postfix);
  
  float calc_result = evaluate_postfix(postfix);
  fprintf(stdout, "\r\n");
  fprintf(stdout, "Result: %f\r\n", calc_result);
  fprintf(stdout, "\r\n");
}


void 
print_help(void)
{
  const size_t MAX_LINE_LENGTH = 80;
  char out_buffer[MAX_LINE_LENGTH];
  for (size_t i = 0; i < MAX_LINE_LENGTH - 1; i++) {
    out_buffer[i] = '=';
  }
  out_buffer[MAX_LINE_LENGTH - 1] = '\0';
  
  fprintf(stdout, "%s\r\n", out_buffer);
  fprintf(stdout, "\tSimple calculator @MaxBGitHub\r\n");
  fprintf(stdout, "\t\t Available operators are:\r\n");
  fprintf(stdout, "\t\t\t%c        - Add (a + b)\r\n", TOKEN_PLUS);
  fprintf(stdout, "\t\t\t%c        - Subtract (a - b)\r\n", TOKEN_MINUS);
  fprintf(stdout, "\t\t\t%c        - Multiply (a * b)\r\n", TOKEN_MULTIPLY);
  fprintf(stdout, "\t\t\t%c        - Divide (a / b)\r\n", TOKEN_DIVIDE_1);
  fprintf(stdout, "\t\t\t%c        - Divide (a \\ b)\r\n", TOKEN_DIVIDE_2);
  fprintf(stdout, "\t\t\t%c        - Modulo (a %% b)\r\n", TOKEN_MODULO);
  fprintf(stdout, "\t\t\t%c        - Power of (a ^ b)\r\n", TOKEN_POWER);
  fprintf(stdout, "\t\t\t%c        - Square root of (|a)\r\n", TOKEN_ROOT);
  fprintf(stdout, "\t\t\t%c        - Start group\r\n", TOKEN_BRACKET_OPEN);
  fprintf(stdout, "\t\t\t%c        - End group\r\n", TOKEN_BRACKET_CLOSE);
  fprintf(stdout, "\t\tExample:\r\n");
  fprintf(stdout, "\t\t\t(3^2 + 5) * |16/4 - 2\r\n");
  fprintf(stdout, "\r\n");
  fprintf(stdout, "%s\r\n", out_buffer);  
}


int 
main(void) 
{
  print_help();

  char input[CALC_MAX_EXPRESSION_LENGTH];
  fprintf(stdout, "Enter equation: ");

  fgets(input, sizeof(input), stdin);
  fprintf(stdout, "\r\n");

  size_t input_len = 0;
  while (input_len < CALC_MAX_EXPRESSION_LENGTH
    && input[input_len] != '\0'
    && input[input_len] != '\n')
  {
    ++input_len;
  }
  if (input_len == 0) {
    fprintf(stderr, "no valid input...\r\n");
    exit(1);
  }
  
  if (input_len > 0 && input[input_len - 1] == '\n') {
    input[input_len - 1] = '\0';
  }  

  evaluate_input(input);
  
  return 0;
}
