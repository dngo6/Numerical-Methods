function [ T, x_plot ] = hw12p5( num_cells, del_t, end_time )
k = .01;
L = 10;
num_time_steps = end_time/del_t;
T_in = 200;
T_0 = 20;
T_a = 20;

del_x = L/num_cells;

sub = del_t/del_x^2;
dia = (1 - (2/del_x^2+k)*del_t);
sup = del_t/del_x^2;

col_data = [sub dia sup];

for i=2:num_cells-1
    for j = 1: 3
        A(i,i-2+j) = col_data(j);
    end
end

A(1,1:2) = [dia sup];
A(num_cells, num_cells-1:num_cells) = [sub dia];
A(num_cells, num_cells-1) = sup+sub;

frc = k*del_t*T_a;

W(1:num_cells,1) = frc;
W(1,1) = frc+sub*T_in;
W(num_cells,1) = frc;

T = ones(num_cells,1)*T_0;

x_plot = [0:del_x:L];
for i=1:num_time_steps
    
    T_new = A*T+W;
    
    T=T_new;
end

T = [T_in;T];

end

