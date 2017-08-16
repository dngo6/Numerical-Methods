function [ u ] = hw13p1_implicit( b )
global x_plot

k = 2;
L = 100;
num_cells = 5;
del_t = 0.05;
num_time_steps = 30;

del_x = L/num_cells; 

sub = 1/del_x^2 * del_t;
dia = 1 - 2/del_x^2 - b/del_x * del_t;
sup = 1/del_x^2 + b/del_x * del_t;

col_data = [sub dia sup];

for i=2:num_cells-1
    for j = 1: 3
        A(i,i-2+j) = col_data(j);
    end
end

A(1,1:2) = [dia sup];
A(num_cells, num_cells-1:num_cells) = [sub dia];

%*************** Set Boundary Conditions *************%
W = zeros(num_cells,1);
u = zeros(num_cells,1);

W(1) = 1;
W(num_cells) = 0;

x_plot = [del_x/2:del_x:L-del_x/2];

for i=1:num_time_steps
    u_new =A\(u+W);
   
    u=u_new;
end

end

