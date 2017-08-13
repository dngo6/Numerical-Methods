%Initial conditions
%H = 2.75m
%C = 0.55
%A = .03m
%D = 3m
%V=pi(rH2-H3/3) 
%Q=dV/dt=dV/dH*dH/dt
clear
clc

del_t = 50;
H = 2.75; %height
C = 0.55; %coefficient
D = 3; %diameter
R = D/2;
A = pi*(.03/2)^2; %orifice

t(1) = 0;
y(1) = H; %y is H in the model.

i = 1;
while y(i) > 0 %run into Volume is empty
    t(i+1) = t(i) + del_t;
  
    input_m = [C A y(i)];
    y(i+1) = rk4_step(t(i), y(i), del_t, input_m);
    
    i = i+1;
end

disp(t(i));

plot (t, y, '*');
xlabel('Time ');
ylabel('Height (m)');
title('Homework 4 - Height of the Tank Over Time');
print('HW4','-dpng');


