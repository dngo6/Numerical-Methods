clear
clc

%Time steps when I start seeing stability issues
del_t_5 = 6;
del_t_100 = 0.006;

[T_A, xplot_A] = hw12p5(5, del_t_5, 6);
[T_B, xplot_B] = hw12p5(100, del_t_100,0.05);

plot(xplot_A, T_A, xplot_B, T_B);
title(['Homework 12: Compare 5 Cells at del_t = ' num2str(del_t_5) ' and 100 Cells at del_t = ' num2str(del_t_100)]);
xlabel('x');
ylabel('T(x)');
print('hw12p5','-dpng');