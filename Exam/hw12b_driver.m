%HW12b driver to draw the 4 curves
clear
clc

[T_A, xplot_A] = hw12_func(10, 0.05, 0.05);
[T_A1, xplot_A1] = hw12_func(10, 0.05, 50);

[T_B, xplot_B] = hw12b_func(10, 0.05, 0.05);
[T_B1, xplot_B1] = hw12b_func(10, 0.05, 50);

plot(xplot_A, T_A, xplot_B, T_B, xplot_A1, T_A1, xplot_B1, T_B1);
xlabel('x');
ylabel('T(x)');