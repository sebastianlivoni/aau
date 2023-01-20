% form the array of basis functions
n1 = 20;
n  = 3*n1;
g = cell(3*n1,1);
for i=1:n1,
  g{i}      = @(t) cos((i-1)*acos(t));
  g{n1+i}   = @(t) cos(pi*i*t);
  g{2*n1+i} = @(t) sin(pi*i*t);
end

% let us assume that the weights are given by a random vector
rng (1);
x = rand(n,1);

% let us choose to plot the signal on the interval [-1,1]
n_plot = 1000; % use 1000 equispaced plotting points
t_plot = linspace(-1,1,n_plot);
f_plot = zeros(size(t_plot));
% form the linear combination
for j=1:n,
  f_plot = f_plot + x(j) * g{j}(t_plot);
end

% plot the signal
plot(t_plot,f_plot,'b-');
xlabel('t'); ylabel('f(t)'); grid on;
