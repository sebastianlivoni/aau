import numpy as np
import matplotlib.pyplot as plt

# load and plot data file
data = np.loadtxt('data.txt')

# the first column contains measurement times
t = data[:,0]

# the second column contains measured signal values
f = data[:,1]

# plot the data
plt.plot(t,f,'xm')
plt.xlabel('t')
plt.ylabel('f(t)')
plt.grid(True)
plt.show()
