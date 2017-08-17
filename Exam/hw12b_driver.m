%HW12b driver to draw the 4 curves
clear
clc

figure(1);
%These are Euler Methods
[T_A, xplot_A] = hw12_func(10, 0.05, 0.05);
[T_A1, xplot_A1] = hw12_func(10, 0.05, 50);

%These are RK4 Methods
[T_B, xplot_B] = hw12b_func(10, 0.05, 0.05);
[T_B1, xplot_B1] = hw12b_func(10, 0.05, 50);


plot(xplot_A, T_A, xplot_B, T_B, xplot_A1, T_A1, xplot_B1, T_B1);
legend('Euler at t = 0.05', 'RK4 at t = 0.05', 'Euler at t = 50', 'RK4 at t = 50');
xlabel('x');
ylabel('T(x)');

figure(2);
%Calculate Relative Error
relative_error = [];
for i=1:size(T_B)
    relative_error(i) =  100*abs(T_A(i)-T_B(i))/T_A(i);
end
plot(xplot_B,relative_error);
hold on

%Calculate Relative Error for t = 50
relative_error = [];
for i=1:size(T_B1)
    relative_error(i) =  100*abs(T_A1(i)-T_B1(i))/T_A1(i);
end
plot(xplot_B1,relative_error);

title('True Percent Relative Error between Euler and RK4 Methods');
legend('t= 0.05', 't = 50');
ylabel('Percentage Error (%)');
xlabel('x');
print('hw12brelativeerror', '-dpng');
hold off