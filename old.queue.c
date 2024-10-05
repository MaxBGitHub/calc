#include <stdio.h>
#include <stdlib.h>
#include "queue.h"
#include "calc.h"

void
init_queue(priority_queue_t *pq)
{
  pq->head = NULL;
}

void 
enqueue(
  priority_queue_t *pq, 
  func_ptr_t func, 
  int priority,
  float param1, 
  float param2,
  int param1_from_prev,
  int param2_from_prev)
{
  pq_node_t *child = (pq_node_t *)malloc(sizeof(pq_node_t));
  
  child->function         = func;
  child->priority         = priority;
  child->param1           = param1;
  child->param2           = param2;
  child->param1_from_prev = param1_from_prev;
  child->param2_from_prev = param2_from_prev;
  child->next             = NULL;

  if (NULL == pq->head || pq->head->priority < priority) {
    child->next = pq->head;
    pq->head = child;
  }
  else {
    pq_node_t *temp = pq->head;
    while (NULL != temp->next && temp->next->priority >= priority) {
      temp = temp->next;
    }
    child->next = temp->next;
    temp->next = child;
  }
}


float 
process_queue(priority_queue_t *pq, float param1, float param2)
{
  pq_node_t *temp;
  float retVal = 0.0f;

  // Flag to indicate the first initial function.
  int is_first = 1;

  while (NULL != pq->head) {
    temp = pq->head;
    pq->head = pq->head->next;

    float p1, p2;
    if (is_first) {
      p1 = param1;
      p2 = param2;
      is_first = 0;
    } /* If this is the first function, use the initial params. */
    else {
      p1 = temp->param1_from_prev ? retVal : temp->param1;
      p2 = temp->param2_from_prev ? retVal : temp->param2;  
    } /* Subsequent function, choose which parameter to use. */

    // Execute function and store result.
    int err = temp->function(p1, p2, &retVal);
    // Free dequeued node.
    free(temp);

    if (CALC_ERR_SUCCESS != err) {
      fprintf(stderr, "function %p resulted in error %s\r\n", (void *)temp->function, get_calc_err_msg(err));
      break;
    }
  }
  // Return final result of calculation.
  return retVal;
}
