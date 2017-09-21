"""
Module of things
"""

cdef extern from "scalars.h":
    double timesTwo(double value)

def times_two(value):
    "Multiplies value by 2"
    return timesTwo(value)
