function [ vector ] = nh3fcn( t,y )
    global mu_a mu_n k_da k_dn k_a k_n K_a K_n Y_a Y_n
    
    
%     mu_a=mu_a*theta_n^(temp-20);   %1/d  max AOB growth rate     0.20-0.90
%     mu_n=mu_n*theta_n^(temp-20);   %1/d max NOB growth rate
%     k_da=k_da*theta_d^(temp-20);      %1/d    AOB death rate     0.05-0.15
%     k_dn=k_dn*theta_d^(temp-20);      %1/d   NOB death rate
%     k_a=mu_a/Y_a;       % max NH3 utilization rate
%     k_n=mu_n/Y_n;       % max NO2 utilization rate
%     K_a=K_a*theta_K^(temp-20);         % half saturation const mg/L  0.5-1.0 
%     K_n=K_n*theta_K^(temp-20);     
%     AOB_int=AOB_int*1000/cpg_aob;    % initial AOB VSS g/m^3: mg/L
%     NOB_int=NOB_int*1000/cpg_nob;     % initial NOB VSS g/m^3: mg/L
    
%     t_start = t(1);
%     t_end = t(2);
    
    x_aob = y(1);
    x_nob = y(2);
    c_nh3 = y(3);
    c_no2 = y(4);
    c_no3 = y(5);

    dx_aob = (mu_a*c_nh3*x_aob)/(k_a+c_nh3)-k_da*x_aob;
    dx_nob = (mu_n*c_no2*x_nob)/(k_n+c_no2)-k_dn*x_nob;
    dc_nh3 = (-(mu_a*c_nh3*x_aob)/Y_a*(k_a+c_nh3));
    dc_no2 = ((mu_a*c_nh3*x_aob)/Y_a*(k_a+c_nh3))-(mu_n*c_no2*x_nob)/(Y_n*(k_n+c_no2));
    dc_no3 = (mu_n*c_no2*x_nob)/(Y_n*(k_n+c_no2));
    
    vector = [dx_aob; dx_nob; dc_nh3; dc_no2; dc_no3];
    
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
end

