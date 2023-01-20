% load and plot data file
data = load('data.txt', '-ascii');

% the first column contains measurement times
t = data(:,1);
% the second column contains measured signal values
f = data(:,2);

% plot the data
plot(t,f,'xm');
xlabel('t'); ylabel('f(t)'); grid on;
