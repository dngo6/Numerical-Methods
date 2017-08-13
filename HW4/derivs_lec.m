function [ dydx ] = derivs_lec( x, y, input_m )
%Flow Rate is C*A*sqrt(2*g*H) = Qout
C = input_m(1);
A = input_m(2);
H = y;
g = 9.81;


dydx = -(C*A*sqrt(2*g*H)/(2*pi*1.5*H-pi*H^2));

end

