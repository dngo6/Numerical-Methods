% put "Laplace_plot" in the line after you calculate temperature at each node, e.g.,: temp=A\rhs
% this works only with a square grid 
% needed variables that must be defined in your solver code:  del_y and
% del_x, n_nodes=number of nodes, and temp

T_north=100;
T_south=0;
T_west=75;
T_east=50;

 z_p=reshape(temp,x_nodes,y_nodes);  % this replaces all the commented code above!
 % ********now add the boundary conditions to complete the plot
 d_size=length(z_p)  % number of nodes in x or y dir
 z_p_bc(2:d_size+1,2:d_size+1)=z_p;
 
 %  ***** now fill in the boundary conditionsclc and corners (temp ave)
 z_p_bc(1,1)=mean([T_south T_west]);
 z_p_bc(1,d_size+2)=mean([T_south T_east]);
 z_p_bc(d_size+2,1)=mean([T_north T_west]);
 z_p_bc(d_size+2,d_size+2)=mean([T_north T_east]);
 z_p_bc(d_size+2,2:d_size+1)=T_north;
 z_p_bc(1,2:d_size+1)=T_south;
 z_p_bc(2:d_size+1,1)=T_west;
 z_p_bc(2:d_size+1,d_size+2)=T_east;

side_nodes=n_nodes^0.5;
        Lx=(side_nodes+1)*del_x
        Ly=(side_nodes+1)*del_y
        [x,y] = meshgrid(0:del_x:Lx,0:del_y:Ly);
% and now:  Voila!  (that's French)
figure(1)
    [c, h] = contourf(x,y,z_p_bc); clabel(c, h); colorbar;  
figure(1)

 figure(2)
    surf(x,y,z_p_bc)
 figure(2)

 figure(3)
       [px,py] = gradient(z_p_bc,del_x,del_y);
       contour(x,y,z_p_bc), hold on
       quiver(x,y,-px,-py), hold off, axis image 
figure(3)