"""
Module of more things
"""

import numpy as np   # For the Python interface
cimport numpy as np  # For the C interface

cdef extern from "arrays.h":
    bint timesTwo(bint, double* inputarray, double* outputarray)

def times_two(value):
    "Multiplies value by 2"
    size = len(value)
    inputvalues = value.astype(np.float64) # double precision
    outputvalues = np.empty(size, dtype=np.float64) # Create array
    status = timesTwo(size,
                      <double*> np.PyArray_DATA(inputvalues),
                      <double*> np.PyArray_DATA(outputvalues))

    assert status == 0
    return outputvalues


