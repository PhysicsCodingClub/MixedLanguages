from duffing_fort import duffing
from matplotlib import pyplot as plt
from numpy import loadtxt

# Set up default variables
duffing.init()

# If we want to do something less dull here need to push
# variables into the fortran module!

duffing.iterate(10000)

# Need to pull the filename from module variables
# N.B. Because Fortran strings are arrays of characters,
# we need to use .tostring() method to convert to a Python string!
ToOpen = None 

data = loadtxt(ToOpen)

# Plot oscillator
plt.plot(data[:,2],data[:,0])
plt.xlabel('Time')
plt.ylabel('Position')
plt.show()

# Plot phase space
plt.plot(data[:,0],data[:,1],'r.')
plt.xlabel('Position')
plt.ylabel('Velocity')
plt.show()
