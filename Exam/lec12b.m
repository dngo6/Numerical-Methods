%Lec12_Explicit
%lecture example backward difference in space, forward in time.
clear
clf

U= 100;
E= 2000;
A_c = 10;
k = 2;
L = 100;
num_cells = 100;
del_t = 0.0005;
end_time = 0.05;
num_time_steps = end_time/del_t;
c_in = 1;
c_0 = 0;
c_out = 0;

del_x = L/num_cells;

sub = (U/del_x + E/del_x^2);
dia = -(U/del_x + 2*E/del_x^2 + k);
sup = E/del_x^2;

col_data = [sub dia sup];

for i=2:num_cells-1
    for j = 1: 3
        B(i,i-2+j) = col_data(j);
    end
end

B(1,1:2) = [dia sup];
B(num_cells, num_cells-1:num_cells) = [sub dia];

W = zeros(num_cells,1);
W(1) = sub*c_in;
W(num_cells) = -sup*c_out;

c = ones(num_cells,1)*c_0;

figure(2);

x_plot = [del_x/2:del_x:L-del_x/2];

for i=1:num_time_steps
    k1 = B*c+W;
    
    k2 = B*(c+k1*del_t/2) + W;
    
    k3 = B*(c+k2*del_t/2) + W;
    
    k4 = B*(c+k3*del_t) + W;
    
    c_new = c + (k1 + 2*k2 + 2*k3 + k4)*del_t/6;
    
    plot(x_plot, c_new, 'r--');
    figure (1)
    hold on
    pause
    c=c_new;
end
hold off

title ('RK4 time integration of the A-D Eqn');
figure (2);










