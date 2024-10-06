#ifndef _CALC_H
#define _CALC_H

#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <float.h>


// Used in Netwon's method for approximating the square root.
#define CALC_HALF 0.5f

// Maximum length of math expression can be 1024 chars.
// This is not a tested or best what ever value.
// This has been chosen arbitrarily.
#define CALC_MAX_EXPRESSION_LENGTH  0x400
// Maximum size of stacks should be no more then twice the 
// expression size itself. The expression inflix is
// converted to a postfix and padded with spaces.
// Any shunting yard postfix stack should thus never be
// able to exceed the maximum expression size limit * 2.
#define CALC_MAX_STACK_SIZE         (2 * CALC_MAX_EXPRESSION_LENGTH)

#define CALC_ERR_SUCCESS          0
#define CALC_ERR_DIVIDE_BY_ZERO   1
#define CALC_ERR_SQRT_NEGATIVE    2
#define CALC_ERR_UNKOWN_OPERATOR  3

#define CALC_ERR_MSG_SUCCESS          "None"
#define CALC_ERR_MSG_DIVIDE_BY_ZERO   "Cannot divide by zero"
#define CALC_ERR_MSG_SQRT_NEGATIVE    "Square root of negative number is not supported"
#define CALC_ERR_MSG_UNKOWN_OPERATOR  "Unkown or unsupported operator token"


// ============================================================================
//  Stack for arithmetic operator.
// ============================================================================

typedef struct {
  char data[CALC_MAX_STACK_SIZE];
  int top;
} char_stack_t;


void char_stack_push(char_stack_t *stack, char c);

char char_stack_pop(char_stack_t *stack);
char char_stack_peek(char_stack_t *stack);

int char_stack_is_empty(char_stack_t *stack);


// ============================================================================
//  Stack for floating points.
//  Required for processing inputs.
// ============================================================================

typedef struct {
  float data[CALC_MAX_STACK_SIZE];
  int top;
} float_stack_t;

void float_stack_push(float_stack_t *stack, float f);

float float_stack_pop(float_stack_t *stack);
float float_stack_peek(float_stack_t *stack);

int float_stack_is_empty(float_stack_t *stack);


// ============================================================================
//  Input validation and normalization.
// ============================================================================

size_t normalize_calc_input(const char *input, char tokens_out[CALC_MAX_EXPRESSION_LENGTH]);

void infix_to_postfix(const char *infix, char *postfix);
void evaluate_input(const char* input);

float evaluate_postfix(const char *postfix);


typedef enum {
  TOKEN_NONE          = 0x00,
  TOKEN_PLUS          = 0x2b,
  TOKEN_MINUS         = 0x2d,
  TOKEN_DOT           = 0x2e,
  TOKEN_MULTIPLY      = 0x2a,
  TOKEN_DIVIDE_1      = 0x2f,
  TOKEN_DIVIDE_2      = 0x5c,
  TOKEN_MODULO        = 0x25,
  TOKEN_POWER         = 0x5e,
  TOKEN_ROOT          = 0x7c,
  TOKEN_BRACKET_OPEN  = 0x28,
  TOKEN_BRACKET_CLOSE = 0x29,
  TOKEN_NUM_0         = 0x30,
  TOKEN_NUM_1         = 0x31,
  TOKEN_NUM_2         = 0x32,
  TOKEN_NUM_3         = 0x33,
  TOKEN_NUM_4         = 0x34,
  TOKEN_NUM_5         = 0x35,
  TOKEN_NUM_6         = 0x36,
  TOKEN_NUM_7         = 0x37,
  TOKEN_NUM_8         = 0x38,
  TOKEN_NUM_9         = 0x39,  
} MATH_TOKEN;


static inline int 
is_operator_right_associative(char op) 
{
  return (op == TOKEN_POWER);
}


static inline int 
is_operator_token(const char c) 
{
  switch (c) {
    case TOKEN_PLUS:
    case TOKEN_MINUS:
    case TOKEN_MULTIPLY:
    case TOKEN_DIVIDE_1:
    case TOKEN_DIVIDE_2:
    case TOKEN_MODULO:
    case TOKEN_ROOT:
    case TOKEN_POWER:
      return 1;
    default: 
      return 0; 
  }  
}


static inline int
is_digit_or_floating_point(const char c)
{
  switch (c) {
    case TOKEN_DOT:
    case TOKEN_NUM_0:
    case TOKEN_NUM_1:
    case TOKEN_NUM_2:
    case TOKEN_NUM_3:
    case TOKEN_NUM_4:
    case TOKEN_NUM_5:
    case TOKEN_NUM_6:
    case TOKEN_NUM_7:
    case TOKEN_NUM_8:
    case TOKEN_NUM_9:
      return 1;
    default:
      return 0;
  }
}


static inline int 
is_math_token(const char c) 
{
  switch (c) {
    case TOKEN_BRACKET_OPEN:
    case TOKEN_BRACKET_CLOSE:
    case TOKEN_PLUS:
    case TOKEN_MINUS:
    case TOKEN_MULTIPLY:
    case TOKEN_DIVIDE_1:
    case TOKEN_DIVIDE_2:
    case TOKEN_MODULO:
    case TOKEN_ROOT:
    case TOKEN_POWER:
    case TOKEN_DOT:
    case TOKEN_NUM_0:
    case TOKEN_NUM_1:
    case TOKEN_NUM_2:
    case TOKEN_NUM_3:
    case TOKEN_NUM_4:
    case TOKEN_NUM_5:
    case TOKEN_NUM_6:
    case TOKEN_NUM_7:
    case TOKEN_NUM_8:
    case TOKEN_NUM_9:
      return 1;
    default: 
      return 0;
  } 
}


static inline int
precedence(char token)
{
  switch (token) {
    case TOKEN_PLUS:
    case TOKEN_MINUS:
      return 1;
    case TOKEN_MULTIPLY:
    case TOKEN_DIVIDE_1:
    case TOKEN_DIVIDE_2:
    case TOKEN_MODULO:
      return 2;
    case TOKEN_POWER:
      return 3;
    case TOKEN_ROOT:
      return 4;
    default: 
      return 0;      
  }
}


static inline int 
add_f(float x, float y, float *result) 
{
  *result = x + y;
  return CALC_ERR_SUCCESS;
}


static inline int 
subtract_f(float x, float y, float *result) 
{
  *result = x - y;
  return CALC_ERR_SUCCESS;
}


static inline int 
multiply_f(float x, float y, float *result) 
{
  *result = x * y;
  return CALC_ERR_SUCCESS;
}


static inline int 
divide_f(float x, float y, float *result) 
{
  if (y == 0) {
    return CALC_ERR_DIVIDE_BY_ZERO;
  }
  *result = x / y;
  return CALC_ERR_SUCCESS;
}


static inline int 
modulo_f(float x, float y, float *result) 
{
  if (y == 0) {
    return CALC_ERR_DIVIDE_BY_ZERO;
  }
  *result = x - y * ((int)(x / y));
  return CALC_ERR_SUCCESS;
}


static inline int 
powerof_f(float base, float exponent, float *result) 
{
  if (base == 0.0f && exponent < 0.0f) {
    return CALC_ERR_DIVIDE_BY_ZERO;
  }

  if (exponent == 0) {
    *result = 1.0f;
    return CALC_ERR_SUCCESS;
  }

  float res       = 1.0f;
  int   exp       = exponent < 0 ? -exponent : exponent;
  float cur_base  = base;

  // Exponentiation by squaring
  while (exp > 0) {
    if (exp % 2 == 1) {
      res *= cur_base;
    } /* If exp is odd, multiply by current base */
    cur_base *= cur_base; // Square the base.
    exp /= 2;
  }

  if (exponent < 0) {
    *result = 1.0f / res;
  } /* Negative exponent -> take reciprocal */
  else {
    *result = res;
  }
  return CALC_ERR_SUCCESS;
}


//
// Newton's method for root-finding.
//
static inline int
sqrtof_f(float x, float *result) 
{
  if (x < 0.0f) {
    return CALC_ERR_SQRT_NEGATIVE;
  }

  if (x == 0.0f) {
    *result = 0;
    return CALC_ERR_SUCCESS;
  }

  float epsilon;
  powerof_f(10.0f, -FLT_DIG, &epsilon); // Dynamic precision threshold
  
  float cx        = x;  
  int   max_iter  = 16;
  int   iter      = 0;  

  while (iter++ < max_iter) {
    float next = CALC_HALF * (cx + x / cx);
    if (cx - next < epsilon && next - cx < epsilon) {
      break;
    }
    cx = next;
  }
  
  *result = cx;
  return CALC_ERR_SUCCESS;
}


#endif
