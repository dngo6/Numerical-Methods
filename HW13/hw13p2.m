clear
clc

global x_plot

u_implicit = hw13p2_implicit(0.0038, 1);
u_explicit = hw13p2_explicit(0.000038, 100);

plot(x_plot, u_implicit)
hold on
%plot(x_plot, u_explicit)
%legend('implicit', 'explicit');