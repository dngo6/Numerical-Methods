%Lec12_Explicit
%lecture example backward difference in space, forward in time.
clear
clf

U= 100;
E= 2000;
A_c = 10;
k = 2;
b = 4;
L = 100;
num_cells = 5;
del_t = 0.05;
num_time_steps = 30;
%c_in = 1;
%c_0 = 0;
%c_out = 0;

implicit = 0;

del_x = L/num_cells;

if implicit == 1
    sub = (-b/del_x + 1/del_x^2) *del_t;
    dia = 1 + (b/del_x - 2/del_x^2)*del_t;
    sup = -1/del_x^2 * del_t;
else
    sub = 1/del_x^2 * del_t;
    dia = 1 - 2/del_x^2 - b/del_x * del_t;
    sup = 1/del_x^2 + b/del_x * del_t;
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


%W(1) = -sub*c_in;
%W(num_cells) = -sup*c_out;

c = ones(num_cells,1);

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









