%Homework 9 Part 1 Problem 28.17a and 28.17d
%Code from Lecture 9
clear
clc

global a b c d x_int y_int

% *** Input Data ************************************************
del_time_max=.1; %1/d  % maximum time step allowed
t_end = 20;         % days
a = 1.2;
b = 0.6;
c = 0.8;
d = 0.3;

x_int = 2;
y_int = 1;

options=odeset('MaxStep',del_time_max);  % this limits the maximum time step to frac of tspan

% In all cases use singleprecision
% variables, a step size of 0.1, and simulate from t= 0 to 20.
% Develop phase-plane plots for all cases.

% *** Do the computation ODE45****************************************
[t,y]=ode45(@hw9_func,[0 t_end],[x_int y_int],options);   

figure(1);

plot(t,y(:,1),'g--','LineWidth',2) 
 hold on
 plot(t,y(:,2),'r-.','LineWidth',2)
xlabel('Residence time (d)')
ylabel('Prey and Predator Concentration')
title('Homework 9: Predator vs Prey Model (ODE45)');
legend('Prey (x)','Predator (y)')
print('hw9ode45','-dpng');
hold off

figure(2)
plot(y(:,1),y(:,2),'k--','LineWidth',2)
title('Homework 9: Phase-Plane Plot (ODE45)');
xlabel('Prey (x)')
ylabel('Predator (y)')
print('hw9phaseplaneode45','-dpng');
grid
