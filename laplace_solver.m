clc
clear
%Laplace Solver Code
del_y = 1;
del_x = 1;

n_nodes = 3;

x_nodes = n_nodes^2;
y_nodes = n_nodes^2;

diagonal = zeros(n_nodes,n_nodes);

sub_x = -1/del_x^2;
sub_y = -1/del_y^2;
dia = (2/del_x^2+2/del_y^2);
sup_x = -1/del_x^2;
sup_y = -1/del_y^2;

RHS = [75;0;50;75;0;50;175;100;150];

%Sub Blocks
for i=1:n_nodes
    for j = 1:n_nodes
        if i == j 
            sub(i,j) = sub_y;
        end        
    end
end

%Diagonal Blocks
for i=1:n_nodes
    for j = 1:n_nodes
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
for i=1:n_nodes
    for j = 1:n_nodes
        if i == j 
            sup(i,j) = sup_y;
        end        
    end
end

A = [];

%Time to put it all together!
for i=1:n_nodes
    A = blkdiag(A, diagonal);
end

for i=0:n_nodes-1
    for j=0:n_nodes-1
        offset_i = 1+i*n_nodes;
        offset_j = 1+j*n_nodes;
        if i == j+1
           A(offset_i:offset_i+n_nodes-1,offset_j:offset_j+n_nodes-1)=sub; 
        end
        
        if i == j-1
            A(offset_i:offset_i+n_nodes-1,offset_j:offset_j+n_nodes-1)=sup;
        end
    end
end

% for i=2:y_nodes-1
%      for j=2:x_nodes-2
%          temp(i,j) = (temp(i-1,j)/del_x^2 + temp(i+1,j)/del_x^2 + temp(i,j-1)/del_y^2 + temp(i,j+2)/del_y^2)/(2/del_x^2 + 2/del_y^2);
%      end
%  end

for i=1:y_nodes
     for j=1:x_nodes
         temp=A\RHS;
     end
 end

Laplace_plot_2017;
