[y_euler, euler_error] = Euler();
[y_mid, mid_error] = Midpoint();
[y_heun, heun_error] = Heun();

x(1) = 0;
del_x = 0.25;

for i=1 : length(euler_error)-1
    x(i+1) = x(i) + del_x; 
end

plot(x, euler_error, '--', x, mid_error, 'x', x, heun_error, 'o');
xlabel('x-step')
ylabel('error (%)')
grid
title('Problem 25.2 - Comparison of Relative Errors');
legend('Euler', 'Midpoint', 'Heun');