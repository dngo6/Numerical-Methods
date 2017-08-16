%Lecture9 parameter fitting homework.m
global mu_a mu_n k_da k_dn k_a k_n K_a K_n Y_a Y_n
% this solver uses nh3fcn function file for input
% also see pages 772-776 in Chapra and Canale, 4th ed Numerical methods for
% engineers

% *** Input Data ************************************************
temp=15;      %C
t_start=0;  %d
t_end=20;   %d
% initial conditions (SET THESE TO INITIAL VALUES TO REDUCE ERROR)
% NH3_int=1.8 % mg/L
% NO2_int=0.1 % mg/L
% NO3_int=2.8 % mg/L
AOB_int=0.3e6;               % initial AOB pop cells/L
NOB_int=0.4e6;               % initial NOB pop cells/L
% conversion factors: 
% parameter ranges found in Metcalf & Eddy page 705 Table 8-11
%   ******   ONLY ADJUST THESE 4 CONSTANTS FOR THE HW PROBLEM ******
% mu_a= 0.45;      %1/d  max AOB growth rate     0.20-0.90
% mu_n= 1.2;     %1/d max NOB growth rate
% k_da=0.05;      %1/d    AOB death rate          0.05-0.15
% k_dn=0.05;      %1/d   NOB death rate

NH3_int= 1.82 % mg/L
NO2_int= 0.085 % mg/L
NO3_int= 2.85 % mg/L

mu_a= 0.45      %1/d  max AOB growth rate     0.20-0.90
mu_n= 1.2  %1/d max NOB growth rate
k_da= 0.05     %1/d    AOB death rate          0.05-0.15
k_dn= 0.05     %1/d   NOB death rate

%   ********** LEAVE THESE VALUES FIXED *****************************
Y_a=1;       %      yield of AOB cell/mg of NH3 0.1-0.15
Y_n=1;       %  yield of NOB cell/mg of NO2
K_a=0.5;         % half saturation const mg/L  0.5-1.0 
K_n=0.5;         % mg/L
theta_n=1.07;       % 1.06-1.123  these theta values are for temp adjustment
theta_K=1.053;       %1.03-1.123
theta_d=1.04;        %1.03-1.08
cpg_aob=5e9;            % AOB cells per gram (4x10^12 Grant, 1994)
cpg_nob=5e9;            % NOB 
% *** start the computation *****************************************
figure(1)
mu_a=mu_a*theta_n^(temp-20);   %1/d  max AOB growth rate     0.20-0.90
mu_n=mu_n*theta_n^(temp-20);   %1/d max NOB growth rate
k_da=k_da*theta_d^(temp-20);      %1/d    AOB death rate     0.05-0.15
k_dn=k_dn*theta_d^(temp-20);      %1/d   NOB death rate
k_a=mu_a/Y_a;       % max NH3 utilization rate
k_n=mu_n/Y_n;       % max NO2 utilization rate
K_a=K_a*theta_K^(temp-20);         % half saturation const mg/L  0.5-1.0 
K_n=K_n*theta_K^(temp-20);     
AOB_int=AOB_int*1000/cpg_aob;    % initial AOB VSS g/m^3: mg/L
NOB_int=NOB_int*1000/cpg_nob;     % initial NOB VSS g/m^3: mg/L

[t,y]=ode45(@nh3fcn,[t_start t_end],[AOB_int NOB_int NH3_int NO2_int NO3_int]);   


 figure(1)
 plot(t,y(:,3),t,y(:,4),t,y(:,5)); 
 title('NH3,NO2,NO3 concentrations OF (3-10-2004)');
 
 ylabel('Nitrogen Concentration as N (mg/L)')
 xlabel('Time (d)')
 grid
 figure(1)
 
%d      nh3     no2     no3
data=[
0       1.82	0.085	2.85
3.00	1.65	0.08	3.00
7.00	1.56	0.16	2.99
11.00	1.37	0.11	3.48
18.00	0.034	0.02	4.54];

hold on
plot(data(:,1),data(:,2),'*',data(:,1),data(:,3),'x',data(:,1),data(:,4),'o')
legend('NH_3','NO_2','NO_3','location','best')

label0=sprintf('AOB = %g cells/L, NOB = %g cells/L', AOB_int*cpg_aob/1000,NOB_int*cpg_nob/1000)
text(0.5,4.2,label0)  

hold off

figure(2)
%calculate relative error between the two data sets
days = [0,3,7,11,18];
y_interpolated = interp1(t,y,days);
err_ammonia = [];
err_nitrite = [];
err_nitrate = [];
%NH3 is ammonia
%NO2 is nitrite
%NO3 is nitrate
for i=1:length(days)
    err_ammonia(i) = 100*abs(data(i,2)-y_interpolated(i,3))/data(i,2);
    err_nitrite(i) = 100*abs(data(i,3)-y_interpolated(i,4))/data(i,3);
    err_nitrate(i) = 100*abs(data(i,4)-y_interpolated(i,5))/data(i,4);
end

plot(days, err_ammonia, days, err_nitrite, days, err_nitrate);
title('Relative Error of calculated NH3, NO2, and NO3');
legend('Ammonia (NH3)', 'Nitrite (NO2)', 'Nitrate (NO3)');
xlabel('Day');
ylabel('Percentage Error (%)');

%  HOMEWORK INSTRUCTIONS:

% Develop a function file to simulate the observed measurements, you'll
% need 5 equations.  Run the file get my plot first.  If you can't get my
% plot, don't move on to the coefficient fitting, fix your code first
% before changing coefficients.

% *** save the AOB, NOB, ammonia, nitrite, and nitrate concentrations at times that data were collected
% That is at 0, 3, 7, 11, and 18 days.  Note that the MATLAB ODE45 won't have these values at the exact times so
% we will use simple linear interpolation (good enough), 
% Use MATLAB command:  interp1  (use >> help interp1)

% ****  Add code to calculate the absolute relative error for the ammonia,
% nitrite, and nitrate concentrations at each time  

% Modify coefficients on lines 12-14 and 20-23 above to reduce your 
% absolute error to 0.2 mg-N/L or lower. Spend no more than 1 hour trying
% to do this. 

% Produce a plot of your final output and report your final coefficients on
% lines 12-14 and 20-23.  Report your maximum error for each concentration.


