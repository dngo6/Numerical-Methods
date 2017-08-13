%Laplace Solver Code
del_y = 1;
del_x = 1;

n_nodes = 3;

x_nodes = 10;
y_nodes = 10;

diagonal = zeros(n_nodes,n_nodes);

sub_x = -1/del_x^2;
sub_y = -1/del_y^2;
dia = (2/del_x^2+2/del_y^2);
sup_x = -1/del_x^2;
sup_y = -1/del_y^2;

RHS(1) = 0;

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

temp = zeros(n_nodes^2, n_nodes^2);

% for i=1:n_nodes
%     for j = :n_nodes
%         temp(i,j) = (temp(i-1,j)/del_x^2 + temp(i+1,j)/del_x^2 + temp(i,j-1)/del_y^2 + temp(i,j+2)/del_y^2)/(2/del_x^2 + 2/del_y^2);
%     end
% end

%Laplace_plot_2017;
