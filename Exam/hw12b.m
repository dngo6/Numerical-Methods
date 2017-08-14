%HW12B Runge Kutta
%Call homework 12 first for comparison
clear
clc

k = 2;
L = 10;
num_cells = 10;
del_t = 0.05;
end_time = 0.05; %and end time = 50;
num_time_steps = end_time/del_t;
T_in = 200;
T_0 = 20;

del_x = L/num_cells;

sub = 1/del_x^2;
dia = (1-k - (2/del_x^2));
sup = 1/del_x^2;

col_data = [sub dia sup];

for i=2:num_cells-1
    for j = 1: 3
        B(i,i-2+j) = col_data(j);
    end
end

B(1,1:2) = [dia sup];
B(num_cells, num_cells-1:num_cells) = [sub dia];
B(num_cells, num_cells-1) = sup+sub;

frc = k*T_in;

W(1:num_cells,1) = frc;
W(1,1) = sub*T_in+frc;
W(num_cells,1) = frc + (0);

T = ones(num_cells,1)*T_0;
T_B = ones(num_cells,1)*T_0;

x_plot = [del_x:del_x:L];

%First time with t=0.05 and second time with t=50
for j=1:2
    %Forward Euler Implementation
    for i=1:num_time_steps
        T_new = B*T+W;
        T=T_new;
    end

    %RK4 Implementation
    for i=1:num_time_steps
        k1 = B*T_B+W;

        k2 = B*(T_B+k1*del_t/2) + W;

        k3 = B*(T_B+k2*del_t/2) + W;

        k4 = B*(T_B+k3*del_t) + W;

        T_new = T_B + (k1+2*k2+2*k3+k4)*del_t/6;

        T_B=T_new;
    end
    figure(1);
    plot(x_plot, T, x_plot, T_B);
    hold on
    
    end_time = 50; %and end time = 50;
    num_time_steps = end_time/del_t;
    T = ones(num_cells,1)*T_0;
    T_B = ones(num_cells,1)*T_0;
end

title(['Homework 12b: Transient Heat Transfer Problem at \Deltat =' num2str(del_t) ' and to t =' num2str(end_time)]);
xlabel('x');
ylabel('T(x)');
print('hw12b', '-dpng');
hold off

figure(2);
%Calculate Relative Error
relative_error = [];
for i=1:size(T_B)
    relative_error(i) =  100*abs(T(i)-T_B(i))/T(i);
end

plot(x_plot,relative_error);
title('True Percent Relative Error between Euler and RK4 Methods');
ylabel('Percentage Error (%)');
xlabel('x');
print('hw12brelativeerror', '-dpng');
