function [ y_output ] = rk4_step( x, y, h, input_m )
%RK4_STEP Summary of this function goes here
%   Detailed explanation goes here
k1 = derivs_lec(x, y, input_m);
k2 = derivs_lec(x+h/2, y+k1*h/2, input_m);
k3 = derivs_lec(x+h/2, y+k2*h/2, input_m);
k4 = derivs_lec(x+h, y+k3*h, input_m);

y_output = y + (k1 + 2*k2 +2*k3 + k4)/6 * h;

end

