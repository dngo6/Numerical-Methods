clear
clc

del_t_5 = 0.00005;
del_t_100 = 0.005;

[T_A, xplot_A] = hw12p5(5, del_t_5);
[T_B, xplot_B] = hw12p5(100, del_t_100);

plot(xplot_A, T_A, xplot_B, T_B);
title(['Homework 12: Compare 5 Cells at del_t = ' num2str(del_t_5) ' and 100 Cells at del_t = ' num2str(del_t_100)]);
xlabel('x');
ylabel('T(x)');
print('hw12p5','-dpng');