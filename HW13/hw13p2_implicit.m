%Homework 13 Part 2
%Problem 30.13
clear
clc

k = 2;
L = 1;
num_cells = 5;
del_t = 0.0038;
end_time = 0.0038;
num_time_steps = 100;
c_in = 1;
c_0 = 0;
c_out = 0;

<<<<<<< HEAD:HW13/hw13p2_implicit.m
implicit = 0; %1 is switch for implicit; 0 is explicit
=======
implicit = 0;
>>>>>>> origin/master:HW13/hw13p2.m

del_x = 0.02;

if implicit == 1
    sub = -1+1/del_x^2*del_t;
    dia = 2/del_x^2*del_t;
    sup = -1/del_x^2*del_t;
else
    sub = 1/del_x^2 * del_t;
    dia = 1 - 2/del_x^2 * del_t;
    sup = 1/del_x^2 * del_t;
end


col_data = [sub dia sup];

for i=2:num_cells-1
    for j = 1: 3
        A(i,i-2+j) = col_data(j);
    end
end

A(1,1:2) = [dia sup];
A(num_cells, num_cells-1:num_cells) = [sub dia];

W = zeros(num_cells,1);
W(1) = -sub*c_in;
W(num_cells) = -sup*c_out;

c = ones(num_cells,1)*c_0;

x_plot = [del_x/2:del_x:L-del_x/2];

for i=1:num_time_steps
    
    if implicit == 1
        c_new =(c+W)\A;
    else
        c_new =A\(c+W);
    end
    
    plot(x_plot, c_new);
    figure (1)
    hold on
    c=c_new;
end
hold off








