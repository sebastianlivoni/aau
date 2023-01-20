% solve a linear programing problem

% number of variables
nvar = 5;
% number of equality constraints
ncon = 1;

% vector defining the objective
c = [1,-2,3,-4,5];

% system defining the equality constraints
A = [[5,4,3,2,1]];
b = [6];

% upper and lower bounds on the variables
lb =     zeros(nvar,1);
ub = inf*ones (nvar,1);

% solve the linear programming problem
x = linprog(c,[],[],A,b,lb,ub);

% print the solution
disp('x=');
disp(x');
