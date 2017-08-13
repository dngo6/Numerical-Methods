%Lec12_Explicit
%lecture example backward difference in space, forward in time.
clear
clf

U= 100;
E= 2000;
A_c = 10;
k = 2;
L = 100;
num_cells = 5;
del_t = 0.05;
num_time_steps = 30;
c_in = 1;
c_0 = 0;
c_out = 0;

del_x = L/num_cells;

sub = -(U/del_x + E/del_x^2) *del_t;
dia = 1 + (U/del_x + 2*E/del_x^2 + k)*del_t;
sup = -E/del_x^2 * del_t;

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
    
    c_new =A\(c+W);
    
    plot(x_plot, c_new);
    figure (1)
    hold on
    pause
    c=c_new;
end
hold off









