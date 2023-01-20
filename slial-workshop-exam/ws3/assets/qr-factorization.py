import numpy as np

# Construct a 3x2 example matrix A
A = np.array([[1,1,0,0],[0,0,1,1],[1,0,1,0],[0,1,0,1],[0,1,0,0],[1,0,0,1],[0,0,1,0],[1,0,0,0],[0,1,1,0],[0,0,0,1]],dtype=np.double)
print("A=", A)

b=[0,1,2,3,4,5,6,7,8,9]

# Compute the QR factorization
Q,R = np.linalg.qr(A)

# Print the results
print("Q=", Q)
print("R=", R)
# Note that Q^T Q ~ I, up to some small round-offs
# i.e. Q is an orthogonal matrix
print("Q^T Q = ", Q.T @ Q)
print("Q R = ", Q @ R)

# Question 1.7 

print(np.linalg.solve(A.T @ A,A.T @ b))
print(np.linalg.solve(R, Q.T @ b))