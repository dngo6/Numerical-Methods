function [ T_B, x_plot ] = hw12b_func( num_cells, del_t, end_time )
%HW12B Runge Kutta
k = 2;
L = 10;
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

T_B = ones(num_cells,1)*T_0;

x_plot = [del_x:del_x:L];

%RK4 Implementation
for i=1:num_time_steps
        k1 = B*T_B+W;

        k2 = B*(T_B+k1*del_t/2) + W;

        k3 = B*(T_B+k2*del_t/2) + W;

        k4 = B*(T_B+k3*del_t) + W;

        T_new = T_B + (k1+2*k2+2*k3+k4)*del_t/6;

        T_B=T_new;
end

end

