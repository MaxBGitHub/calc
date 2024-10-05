#include "calc.h"
#include <string.h>
#include <ctype.h>
#include <stdlib.h>


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
get_token_string_length(const char *token_string) 
{
  size_t max_parse_len    = 1024;
  size_t token_string_len = 0;
  while ((token_string_len < max_parse_len) 
  && (token_string[token_string_len] != '\0'))
  {
    ++token_string_len;
  }
  return token_string_len;
}


size_t
get_token_count(const char *token_string, size_t token_string_len) 
{
  size_t token_count = 0;
  for (size_t i = 0; i < token_string_len; i++) {
    if (is_math_token(token_string[i])) {
      ++token_count;
    }
  }  
  return token_count;
}


size_t
normalize_calc_input(const char *token_string, char **tokens_out)
{
  if ( !token_string ) {
    fprintf(stderr, "invalid tokens array\r\n");
    return 0;
  }

  size_t token_string_len = get_token_string_length(token_string);
  size_t token_count = get_token_count(token_string, token_string_len);

  int token_positions[token_count];
  int n = 0;
  for (size_t i = 0; i < token_string_len; i++) {
    if (is_math_token(token_string[i])) {
      token_positions[n++] = i;
    }
  }

  size_t token_out_len = 1 + token_count;
  *tokens_out = (char *)calloc(token_out_len, sizeof(char));
  if (!(*tokens_out)) {
    return 0;
  }
  
  for (size_t i = 0; i < token_count; i++) {
    (*tokens_out)[i] = token_string[token_positions[i]];
  }  
  (*tokens_out)[token_out_len] = '\0';
  
  return token_out_len;
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

  const int float_buffer_size = 32;
  const char space = 0x20;

  while (infix[i] != '\0') {
    // Extract possible floating point number.
    if (is_digit_or_floating_point(infix[i])) {
      char num_buffer[float_buffer_size];
      int num_index = 0;
      while ( (num_index < float_buffer_size)
        && is_digit_or_floating_point(infix[i])) 
      {
        num_buffer[num_index++] = infix[i++];        
      }
      num_buffer[num_index] = '\0';
      // Write number to output.
      for (int j = 0; j < num_index; j++) {
        postfix[n++] = num_buffer[j];
      }
      postfix[n++] = space;
    }
    else if (infix[i] == '(') {
      char_stack_push(&operators, infix[i]);
      i++;
    }
    else if (infix[i] == ')') {
      while (!char_stack_is_empty(&operators) && char_stack_peek(&operators) != '(') {
        postfix[n++] = char_stack_pop(&operators);
        postfix[n++] = space;
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

        if (is_higher_precedence || equal_not_right_prec) {
          postfix[n++] = char_stack_pop(&operators);
          postfix[n++] = space;
        }
        else {
          break;
        }        
      }
      char_stack_push(&operators, infix[i]);
      i++;
    }
  }

  while (!char_stack_is_empty(&operators)) {
    postfix[n++] = char_stack_pop(&operators);
    postfix[n++] = space;
  }
  postfix[n++] = '\0';
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
    if (postfix[i] == 0x20) {
      i++;
      continue;
    }

    if (is_digit_or_floating_point(postfix[i])) {
      char num_str[32];
      int n = 0;
      while (n < 32 && is_digit_or_floating_point(postfix[i])) {
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
evaluate_expression(const char *input)
{
  char *result;
  normalize_calc_input(input, &result);
  fprintf(stdout, "input: %s\r\n", result);
  
  char postfix[CALC_MAX_EXPRESSION_LENGTH];
  infix_to_postfix(result, postfix);

  size_t postfix_len = strlen(postfix);
  if (postfix_len == 0) {
    fprintf(stdout, "failed to get postfix from shunting yard\r\n");
    free(result);
    return;
  }
  fprintf(stdout, "postfix shunting yard (%d): %s\r\n", (int)postfix_len, postfix);
  
  float calc_result = evaluate_postfix(postfix);

  fprintf(stdout, "result: %f\r\n", calc_result);
  fprintf(stdout, "\r\n");
  
  free(result);
}


void 
print_help(void)
{
  char *out_buffer = (char *)malloc(80 * sizeof(char));
  memset(out_buffer, '=', 80 * sizeof(char));
  fprintf(stdout, "%s\r\n", out_buffer);
  fprintf(stdout, "\t\tSimple calculator by Max Bader (services.bader@gmail.com)\r\n");
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
  fprintf(stdout, "%s\r\n", out_buffer);
}


int 
main(void) 
{
  //evaluate_expression("|((((3^3) * 9.0) - 10 + 2) / 3.2493)");
  //evaluate_expression("3^2 * 4");
  //evaluate_expression("10 + 5 - 8 / 2");
  //evaluate_expression("|25 + 18 % 4");
  //evaluate_expression("6*(9 % 5)");
  //evaluate_expression("(4^3) / 8 - 5");
  //evaluate_expression("|(2^4) * 5");
  //evaluate_expression("(3^2 + 5) * |16/4 - 2");

  print_help();

  char input[CALC_MAX_EXPRESSION_LENGTH];
  fprintf(stdout, "Enter equation: ");

  fgets(input, sizeof(input), stdin);

  size_t input_len = strlen(input);
  if (input[0] == '\0' || input[0] == '\n') {
    fprintf(stdout, "no valid input...\r\n");
    exit(0);
  }
  
  if (input_len > 0 && input[input_len - 1] == '\n') {
    input[input_len - 1] = '\0';
  }  
  evaluate_expression(input);
   
  return 0;
}
