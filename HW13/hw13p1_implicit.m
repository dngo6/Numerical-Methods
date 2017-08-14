%Lec12_Explicit
%lecture example backward difference in space, forward in time.
clear
clc

k = 2;
b = 4;
L = 100;
num_cells = 5;
del_t = 0.05;
num_time_steps = 30;

del_x = L/num_cells; 

sub = (-b/del_x + 1/del_x^2)*del_t;
dia = 1 + (b/del_x - 2/del_x^2)*del_t;
sup = -1/del_x^2 * del_t;

col_data = [sub dia sup];

for i=2:num_cells-1
    for j = 1: 3
        A(i,i-2+j) = col_data(j);
    end
    del_t = del_t+del_t*0.1; %Increase delta t by 10%
end

A(1,1:2) = [dia sup];
A(num_cells, num_cells-1:num_cells) = [sub dia];

%*************** Set Boundary Conditions *************%
W = zeros(num_cells,1);
u = ones(num_cells,1);


x_plot = [del_x/2:del_x:L-del_x/2];

for i=1:num_time_steps
   
    u_new =A\(u+W);
    
    plot(x_plot, u_new);
    figure (1)
    hold on
    u=u_new;
end
hold off









