import numpy as np
import matplotlib.pyplot as plt

# form the array of basis functions
n1 = 20
n  = 3*n1
g = [None] * n
for i in range(n1):
  g[i]      = lambda t: np.cos(i*np.arccos(t))
  g[n1+i]   = lambda t: np.cos(np.pi*(i+1)*t)
  g[2*n1+i] = lambda t: np.sin(np.pi*(i+1)*t)


# let us assume that the weights are given by a random vector
rng = np.random.default_rng(seed=1)
x   = rng.random(n)

print(x)

# let us choose to plot the signal on the interval [-1,1]
n_plot = 1000 # use 1000 equispaced plotting points
t_plot = np.linspace(-1,1,n_plot)
f_plot = np.zeros_like(t_plot)
# form the linear combination
for j in range(n):
  f_plot += x[j] * g[j](t_plot)


# plot the signal
plt.plot(t_plot,f_plot,'b-')
plt.xlabel('t')
plt.ylabel('f(t)')
plt.grid(True)
plt.show()
