%Lec12_Explicit
%lecture example backward difference in space, forward in time.
clear
clf

U= 100;
E= 2000;
A_c = 10;
k = 2;
L = 10;
num_cells = 100;
del_t = 0.000005;
end_time = 0.05;
num_time_steps = end_time/del_t;
T_in = 200;
T_0 = 20;

del_x = L/num_cells;

sub = del_t/del_x^2;
dia = (1-k*del_t - (2/del_x^2)*del_t);
sup = del_t/del_x^2;

col_data = [sub dia sup];

for i=2:num_cells-1
    for j = 1: 3
        B(i,i-2+j) = col_data(j);
    end
end

B(1,1:2) = [dia sup];
B(num_cells, num_cells-1:num_cells) = [sub dia];
B(num_cells, num_cells-1) = sup+sub;

frc = k*del_t*T_0;

W(1:num_cells,1) = frc;
W(1) = sub*T_in+frc;
W(num_cells,1) = frc + (0);

T = ones(num_cells,1)*T_0;

x_plot = [del_x:del_x:L];

figure(1)
for i=1:num_time_steps
    k1 = B*T+W;
    
    k2 = B*(T+k1*del_t/2) + W;
    
    k3 = B*(T+k2*del_t/2) + W;
    
    k4 = B*(T+k3*del_t) + W;
    
    T_new = T + ((k1+2*k2+2*k3+k4)*del_t)/6
    
    plot(x_plot, T_new, 'r--');
    hold on
    %pause
    T=T_new;
end
title(['Homework 12b: Transient Heat Transfer Problem at \Deltat =' num2str(del_t) ' and to t =' num2str(end_time)]);
figure(1)
hold off

