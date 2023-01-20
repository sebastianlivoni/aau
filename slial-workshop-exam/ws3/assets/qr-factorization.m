% Construct a 3x2 example matrix A
%A = [[1,2];[3,4];[5,6]];
A = [[1,1,0,0];[0,0,1,1];[1,0,1,0];[0,1,0,1];[0,1,0,0];[1,0,0,1];[0,0,1,0];[1,0,0,0];[0,1,1,0];[0,0,0,1]]
b = [0;1;2;3;4;5;6;7;8;9] % in R10

disp('A='); disp(A);

% Compute the QR factorization
[Q,R] = qr(A,0);

% Print the results
disp('Q='); disp(Q);
disp('R='); disp(R);
% Note that Q^T Q ~ I, up to some small round-offs
% i.e. Q is an orthogonal matrix
disp('Q^T Q ='); disp(Q.' * Q);
disp('QR = '); disp(Q*R);

% Part 1: Exercise 6
bhat = Q * (transpose(Q) * b)

% Part 1: Exercise 7

% Method 1
xhat_method1 = linsolve(A, b)

% Method 2
xhat_method2 = linsolve(R, transpose(Q) * b)