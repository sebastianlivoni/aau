import numpy as np
import matplotlib.pyplot as plt
import scipy.optimize as opt

n=60
m=20

# load and plot data file
data = np.loadtxt('data.txt')

# the first column contains measurement times
t = data[:,0]

# the second column contains measured signal values
f = data[:,1]

def g(j, t):
  if (0 <= j <= 19):
    return np.cos((j)*np.arccos(t))
  elif (20 <= j <= 39):
    return np.cos(np.pi*(j-19)*t)
  elif (40 <= j <= 59):
    return np.sin(np.pi*(j-39)*t)
  else:
    print('Out of range')

A = [[0 for i in range(2 * n)] for j in range(m)]
for i in range(m):
  for (j) in range(n):
    A[i][j] = g(j, t[i])
    A[i][j+n] = -(g(j, t[i]))

print(A)

b = []

for i in f:
  b.append([i])

c = [1 for i in range(2 * n)]

lb = 0
ub = None

result = opt.linprog(c,A_eq=A,b_eq=b,bounds=(lb,ub),
                     method='revised simplex')
x = result.x

n_plot = 1000
t_plot = np.linspace(-1,1,n_plot)
f_plot = np.zeros_like(t_plot)
for j in range(n):
  f_plot += x[j] * g(j,t_plot)
  f_plot += x[j+n] * -g(j,t_plot)

print('Solutions are:')
print(x)

# plot the signal
plt.plot(t,f,'xm')
plt.plot(t_plot,f_plot,'b-')
plt.xlabel('t')
plt.ylabel('f(t)')
plt.grid(True)
plt.show()