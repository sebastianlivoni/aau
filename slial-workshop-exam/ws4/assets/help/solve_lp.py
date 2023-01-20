import numpy as np
import scipy.optimize as opt
import matplotlib.pyplot as plt

data = np.loadtxt('data.txt')

t = data[:,0]
f = data[:,1]

# solve a linear programing problem

# number of variables
nvar = 20
# number of equality constraints
ncon = 1

#objective function
c = np.array(f, dtype=np.double)

def g(i,t):
  return np.cos(i*np.arccos(t))

i = 0
A = []
for k in t:
  A.append(g(i, k))
  i = i + 1

A =  np.array([A], dtype=np.double)
b = np.array([4.0700304e+00], dtype=np.double)

# upper and lower bounds on the variables
lb = 0
ub = None

# solve the linear programming problem
result = opt.linprog(c,A_eq=A,b_eq=b,bounds=(lb,ub),method='revised simplex')
x = result.x

# print the solution
print('x=')
print(x)

n_plot = 1000
t_plot = np.linspace(-1,1,n_plot)
f_plot = np.zeros_like(t_plot)
for j in range(20):
  f_plot += x[j] * g(j,t_plot)

# plot the signal
plt.plot(t_plot,f_plot,'b-')
plt.xlabel('t')
plt.ylabel('f(t)')
plt.grid(True)
plt.show()