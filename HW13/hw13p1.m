%Homework 13 Part 1 both implicit and explicit
global x_plot

figure(1);
%Implicit
for i=4:-2:-4
    u = hw13p1_implicit(i);
    plot(x_plot, u);
    hold on
end

title('Homework 13 Part 1: Problem 30.15 (Implicit)');
xlabel('x');
ylabel('u');
legend('b = 4', 'b = 2', 'b = 0', 'b = -2', 'b = -4');
print('hw13p1_implicit','-dpng');
hold off

figure(2);
%Explicit
for i=4:-2:-4
    u = hw13p1_explicit(i);
    plot(x_plot, u);
    hold on
end

title('Homework 13 Part 1: Problem 30.15 (Explicit)');
legend('b = 4', 'b = 2', 'b = 0', 'b = -2', 'b = -4');
xlabel('x');
ylabel('u');
print('hw13p1_explicit','-dpng');
hold off