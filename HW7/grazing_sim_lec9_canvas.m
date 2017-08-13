% grazing_sim_lec9.m 
% Developed by Litton and Moon, 2013 (a simplified code for the class, see
% Phaophypin

global eps k_dz C_gz k_g

% also see pages 772-776 in Chapra and Canale, 4th ed Numerical methods for
% engineers

% *** Input Data ************************************************
del_time_max=.1; %1/d  % maximum time step allowed
t_end=20;         % days
Algae_int=0.1675;       % g algae/m^3 as carbon Algae 
zoo_int=0.1;       %53.5   % g zooplankton/m^3 as carbon 
eps=0.6  ;          % grazing efficiency
k_dz=0.1;           % 1/d  (death rate of zooplankton)
C_gz=1.0 ;          % 1.5 m^3 /gC /d
k_g=0.10 ;


%0.3 1/d  net growth rate in DWSC

options=odeset('MaxStep',del_time_max);  % this limits the maximum time step to frac of tspan

%****************** Do the computation Euler**************************
% i = 1;
% time = 0;
% while time < t_end
%     if (time > t_end)
%         del_time_max = time - t_end;
%         time = time+del_time_max;
%     end
%     
%     dydt1;
%     dydt2;
%     
%     y(i+1,1) = y(i,1) + dydt1*del_time_max;
%     y(i+2,1) = y(i,2) + dydt2*del_time_max;
%     
%     time = time+del_time_max;
%     i = i+1;
% end

% In all cases use singleprecision
% variables, a step size of 0.1, and simulate from t= 0 to 20.
% Develop phase-plane plots for all cases.

% *** Do the computation ODE45****************************************
[t,y]=ode45(@algaefcn_grazing,[0 t_end],[Algae_int zoo_int],options);   

%chla=y(:,1)./a_ca;    % convert back to gC/m^3
zoo=y(:,2)*1000*1.58;  % convert back to gC/m^3
 
%  ***  Plot the algae and zooplankton ****

figure(1)

% plot the chla and zoo as carbon
plot(t,y(:,1),'g--','LineWidth',2)  %*A_ca removed ploting ug/L
 hold on
 plot(t,y(:,2),'r-.','LineWidth',2)  % A_ca removed ploting ug/L
xlabel('Residence time (d)')
ylabel('Chl a, and Zooplankton concentration (mg C/L)')
hold off


figure(2)
% plot the algae and zoo as carbon to identify the "attractor"
plot(y(:,1),y(:,2),'k--','LineWidth',2)  %*A_ca removed ploting ug/L
 
xlabel('Algae (mg C/L)')
ylabel('Zooplankton(mg C/L)')
legend('Chl a','Zoo','location','best')
grid

%*************** Critical Point *************************

x_c=k_dz/eps/C_gz
y_c=k_g*C_gz
% 
% % ****** plot concentration of chla and zooplankton mass *******8
% figure(1)
% plot(t,chla,'g--','LineWidth',2)  %*A_ca removed ploting ug/L
%  hold on
%  plot(t,zoo,'r-.','LineWidth',2)  % A_ca removed ploting ug/L
%  grid
%  title('Calculation of Chl a, Zooplankton concentrations from Vernalis to the DWSC')
%  legend('Chl a','Zoo','location','best')
 
%label0=sprintf('Depth= %g ft, Chl a = %g ug/L, Ph a = %g ug/L, Zoo = %g ugC/L', H, Chla_int,Pha_int, zoo_int)
%tex(0.t5,8.2,label0)  
