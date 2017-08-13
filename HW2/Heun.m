function [y, rel_error] = Heun()
%Problem: dy/dx = (1+4x)y^1/2
%Analytical Solution: y = [(2x^2+x+2)/2]^2
%rel_error = (abs(y(i) - y_exact(i))/y_exact(i))*100;

y = [];
x_max = 1; %number of timesteps
del_x = 0.25; %days

x(1) = 0;
y(1) = 1;

i = 1;
while x < x_max
    x(i+1) = x(i) + del_x;
    
    if x(i+1) > x_max
        x(i+1) = x_max;
        del_x = x_max - x(i);
    end
    
    slope1 = (1+4*x(i))*sqrt(y(i));
    y_pred = y(i) + slope1*del_x;
    slope2 = (1+4*(x(i)+del_x))*sqrt(y_pred);
    
    slope_avg = (slope1+slope2)/2;
 
    y(i+1) = y(i) + slope_avg *del_x;
    
    i = i+1;
end

plot(x,y, 'o');
xlabel('x')
ylabel('y')

for i=1:length(x)
    y_exact(i) = ((2*x(i)^2+x(i)+2)/2)^2;
    rel_error(i) = (abs(y(i) - y_exact(i))/y_exact(i))*100;
end

hold on
plot(x,y_exact)
grid
title('Problem 25.2(b) - Heun')
legend('Heun', 'Theory')
hold off
end

