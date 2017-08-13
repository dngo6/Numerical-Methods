function [ dydx1, dydx2, dydx3 ] = derivs_lec5( x, y1, y2, y3, h )
global Q V1 V2 V3 k_d1 k_d2 k_d3

dydx1 = (-(1.5*Q+k_d1*V1)*y1 + .5*Q*y3)/V1;

dydx2 = (1.5*Q*y1 - (1.5*Q+k_d2*V2)*y2)/V2;

dydx3 = (.5*Q*y2 - (.5*Q+k_d3*V3)*y3)/V3;

end

