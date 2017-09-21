
#include "arrays.h"

/*
 * A function which doubles the input values
 * 
 * length   Length of both in and out arrays
 * in       Input array, assumed to be allocated
 * out      Output array, assumed to be allocated
 */
int timesTwo(int length, double* in, double* out) {
  int i;
  for (i = 0; i < length; i++) {
    out[i] = 2.*in[i];
  }
  return 0;
}

