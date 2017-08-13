%MATLAB code to solve HW8 problem 27.3
clear
clc

del_x = 1;
L = 10;

T_0 = 240;
T_10 = 150;

sub = -1;
diag = (0.15+(2/del_x^2));
sup = -1;

rhs = zeros(9,1);
A = zeros(9,9);

sizeA = size(A);

for j = 1: length(rhs)
    rhs(j, 1) = 0;
    if j == 1
        rhs(j,1) = T_0;
    end
    
    if j == length(rhs)
        rhs(j,1) = -sup*T_10;
    end
end

for i = 1: sizeA(1)
    for j = 1:sizeA(2)
        if i == j+1
            A(i,j) = sub;
        end
        
        if i == j
            A(i,j) = diag;
        end
        
        if i == j-1
            A(i,j) = sup;
        end
    end
end

inverseA = inv(A);
temp = inverseA*rhs
x = [1:del_x:9];

for i=1:9
    T(i) = temp(i);
end

syms c1 c2

[sc1, sc2] = solve(c1*exp(sqrt(0.15)*0)+c2*exp(-sqrt(0.15)*0) == 240, c1*exp(sqrt(0.15)*10)+c2*exp(-sqrt(0.15)*10) == 150);

x_plot = [0:del_x:10];
for i = 1: 11
    T_exact(i) = double(sc1*exp(sqrt(0.15)*x_plot(i))+sc2*exp(-sqrt(0.15)*x_plot(i)));  
end

for i = 1:9
    error(i) = abs((T(i)-T_exact(i+1))/T_exact(i+1))*100;
end

figure(1)
plot(x, T, 'o', x_plot, T_exact, '-');

legend('Finite Different Solution', 'Analytic Solution');
title('Comparison of Analytic with Numeric Solution (27.3)');
print('compare', '-dpng');

figure(2)
plot(x, error, 'x-');
title('True Percent Relative Error (27.3)');
print('error', '-dpng');