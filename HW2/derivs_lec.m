function [dydx] = derivs_lec( x, y, input_m )
%DERIVS_LEC Summary of this function goes here
%   Detailed explanation goes here
C_in = input_m(1);
Q = input_m(2);
V = input_m(3);

dydx = (C_in - y) *Q/V;

end

