function [ vector ] = nh3fcn( t,y )
    global mu_a mu_n k_da k_dn K_a K_n Y_a Y_n
    
    x_aob = y(1);
    x_nob = y(2);
    c_nh3 = y(3);
    c_no2 = y(4);
    c_no3 = y(5);

    dx_aob = (mu_a*c_nh3*x_aob)/(K_a+c_nh3)-k_da*x_aob;
    dx_nob = (mu_n*c_no2*x_nob)/(K_n+c_no2)-k_dn*x_nob;
    dc_nh3 = (-(mu_a*c_nh3*x_aob)/(Y_a*(K_a+c_nh3)));
    dc_no2 = (mu_a*c_nh3*x_aob)/(Y_a*(K_a+c_nh3))-(mu_n*c_no2*x_nob)/(Y_n*(K_n+c_no2));
    dc_no3 = (mu_n*c_no2*x_nob)/(Y_n*(K_n+c_no2));
    
    vector = [dx_aob; dx_nob; dc_nh3; dc_no2; dc_no3];
    
end

