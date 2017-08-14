%Homework 9 Part 1 Problem 28.17a and 28.17d
%Code from Lecture 9
clc
clear

% *** Input Data ************************************************
del_time_max= .1; %1/d  % maximum time step allowed
t_end = 20;         % days
a = 1.2;
b = 0.6;
c = 0.8;
d = 0.3;

x_int = 2;
y_int = 1;

%****************** Do the computation Euler**************************
i = 1;
time = 0;
%initial values
y(1,1) = x_int; 
y(1,2) = y_int;

while time < t_end
    if (time > t_end)
        del_time_max = time - t_end;
        time = time+del_time_max;
    end
    
    dxdt = a*y(i,1)-b*y(i,1)*y(i,2);
    dydt = -c*y(i,2)+d*y(i,1)*y(i,2);
    
    y(i+1,1) = y(i,1) + dxdt*del_time_max;
    y(i+1,2) = y(i,2) + dydt*del_time_max;
    
    time = time+del_time_max;
    i = i+1;
end

% In all cases use singleprecision
% variables, a step size of 0.1, and simulate from t= 0 to 20.
% Develop phase-plane plots for all cases.
t = [0:del_time_max:t_end];

figure(1)
plot(t,y(:,1),'g--','LineWidth',2) 
 hold on
 plot(t,y(:,2),'r-.','LineWidth',2)
xlabel('Residence time (d)')
ylabel('Prey and Predator Concentration')
title('Homework 9: Predator vs Prey Model (Euler)');
legend('Prey (x)','Predator (y)')
print('hw9euler','-dpng');
hold off

figure(2)
plot(y(:,1),y(:,2),'k--','LineWidth',2)
title('Homework 9: Phase-Plane Plot (Euler)');
xlabel('Prey (x)')
ylabel('Predator (y)')
print('hw9phaseplaneeuler','-dpng');
grid
