%Homework 13 Part 2
%Problem 30.13
clear
clc

k = 2;
L = 1;
num_cells = 50;
del_t = 0.000038;
end_time = 0.0038;
num_time_steps = 1;
c_in = 1;
c_0 = 0;
c_out = 0;

del_x = 0.02;

sub = -1+1/del_x^2*del_t;
dia = 2/del_x^2*del_t;
sup = -1/del_x^2*del_t;


col_data = [sub dia sup];

for i=2:num_cells-1
    for j = 1: 3
        A(i,i-2+j) = col_data(j);
    end
end

A(1,1:2) = [dia sup];
A(num_cells, num_cells-1:num_cells) = [sub dia];

W = zeros(num_cells,1);
W(1) = 0;
W(num_cells) = 1;
u = ones(num_cells,1);

x_plot = [del_x/2:del_x:L-del_x/2];

figure(1);
for i=1:num_time_steps   
    u_new =A\(u+W);
    
    u=u_new;
end
plot(x_plot, u);
hold off









