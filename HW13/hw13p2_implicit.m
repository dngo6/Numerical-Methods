function [ u ] = hw13p2_implicit( del_t, num_time_steps )
global x_plot
%Homework 13 Part 2
%Problem 30.13
L = 1;
num_cells = 50;
end_time = 0.0038;

del_x = 0.02;

sub = -1/del_x^2*del_t;
dia = 1+2/del_x^2*del_t;
sup = -del_t/del_x^2;

col_data = [sub dia sup];

for i=2:num_cells-1
    for j = 1: 3
        A(i,i-2+j) = col_data(j);
    end
end

A(1,1:2) = [dia sup];
A(num_cells, num_cells-1:num_cells) = [sub dia];

W = zeros(num_cells,1);
u = zeros(num_cells,1);

W(1,1) = 0;
W(num_cells,1) = -sup;

x_plot = [del_x/2:del_x:L-del_x/2];

for i=1:num_time_steps   
    u_new =A\(u+W);
    
    u=u_new;
end
end

