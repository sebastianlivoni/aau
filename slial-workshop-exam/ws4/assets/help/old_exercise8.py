import numpy as np
import scipy.optimize as opt
import matplotlib.pyplot as plt

data = np.loadtxt('data.txt')

n = 60
m = 20 #20

t = data[:,0]
f = data[:,1]

# form the array of basis functions
def g(j, t):
  if (0 <= j <= 19):
    print('hej', (j-1)*np.cos(t))
    if (-1 <= (j-1)*np.cos(t) <= 1):
      return np.arccos((j-1)*np.cos(t))
    else:
      return 0
  elif (20 <= j <= 39):
    return np.cos(np.pi * (j - 20) * t)
  elif (40 <= j <= 59):
    return np.sin(np.pi * (j - 40) * t)
  else:
    print('Out of range')

def sum(end, i):
  sum = 0;
  j = 0
  while (j < end):
    sum += g(j, t[i])
    j += 1
  return sum

def A():
  # Allocate space
  A = [[0 for i in range(n)] for j in range(m)] 
  
  i = 0
  while (i < m):
    j = 0
    while (j < n):
      A[i][j] = sum(j, i)
      j += 1
    i += 1
  
  return np.array(A, dtype=np.double)

a = A()

def b():
  return np.array(f, dtype=np.double)
  
b = b()

def c():
  c = []
  j = 0
  while (j < n):
    c.append(g(j, t[19]))
    j += 1
  return np.array(c, dtype=np.double)
 
c = c()

lb = 0
ub = None

result = opt.linprog(c,A_eq=a,b_eq=b,bounds=(lb,ub),method='revised simplex')
x = result.x

print(np.arccos((2-1)*np.cos(-9.4522481e-01)))

# n_plot = 1000
# t_plot = np.linspace(-1,1,n_plot)
# f_plot = np.zeros_like(t_plot)
# for j in range(n):
#   f_plot += x[j] * g(j,t_plot)


# # plot the signal
# plt.plot(t,f,'xm')
# plt.plot(t_plot,f_plot,'b-')
# plt.xlabel('t')
# plt.ylabel('f(t)')
# plt.grid(True)
# plt.show()