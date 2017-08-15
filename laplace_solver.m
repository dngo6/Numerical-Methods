clc
clear
%Laplace Solver Code
del_y = 1;
del_x = 1;

n = 3;
n_nodes = n^2;

x_nodes = n;
y_nodes = n;

diagonal = zeros(n_nodes^0.5,n_nodes^0.5);

sub_x = -1/del_x^2;
sub_y = -1/del_y^2;
dia = (2/del_x^2+2/del_y^2);
sup_x = -1/del_x^2;
sup_y = -1/del_y^2;

%Sub Blocks
for i=1:x_nodes
    for j = 1:y_nodes
        if i == j 
            sub(i,j) = sub_y;
        end        
    end
end

%Diagonal Blocks
for i=1:x_nodes
    for j = 1:y_nodes
        if j == i-1
            diagonal(i,j) = sub_x;
        end
        if i == j 
            diagonal(i,j) = dia;
        end
        if j == i+1
            diagonal(i,j) = sup_x;
        end        
    end
end

%Sup Blocks
for i=1:x_nodes
    for j = 1:y_nodes
        if i == j 
            sup(i,j) = sup_y;
        end        
    end
end

A = [];

%Time to put it all together!
for i=1:x_nodes
    A = blkdiag(A, diagonal);
end

for i=0:x_nodes-1
    for j=0:y_nodes-1
        offset_i = 1+i*y_nodes;
        offset_j = 1+j*x_nodes;
        if i == j+1
           A(offset_i:offset_i+y_nodes-1,offset_j:offset_j+x_nodes-1)=sub; 
        end
        
        if i == j-1
            A(offset_i:offset_i+y_nodes-1,offset_j:offset_j+x_nodes-1)=sup;
        end
    end
end

T_north=100;
T_south=0;
T_west=75;
T_east=50;

%rhs = [75;0;50;75;0;50;175;100;150];

rhs = zeros(n, n);

rhs(:,1) = T_west;
rhs(1,:) = T_south;
rhs(:,n) = T_east;
rhs(n,:) = T_north;

rhs(1,1) = T_west+T_south;
rhs(n,n) = T_north+T_east;
rhs(n,1) = T_west+T_north;
rhs(1,n) = T_east+T_south;

rhs = reshape(rhs',n_nodes,1);

temp=A\rhs;

Laplace_plot_2017;
