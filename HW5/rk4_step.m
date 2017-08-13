function [ y_output1, y_output2, y_output3 ] = rk4_step( x, y1,y2,y3, h)
%RK4_STEP Summary of this function goes here
%   Detailed explanation goes here
[k11, k12, k13] = derivs_lec5(x, y1,y2,y3,h);
[k21, k22, k23] = derivs_lec5(x+h/2, y1+k11*h/2, y2+k12*h/2, y3+k13*h/2, h);
[k31, k32, k33] = derivs_lec5(x+h/2, y1+k21*h/2, y2+k22*h/2, y3+k23*h/2, h);
[k41, k42, k43] = derivs_lec5(x+h, y1+k31*h, y2+k32*h, y3+k33*h, h);

y_output1 = y1 + (k11 + 2*k21 +2*k31 + k41)/6 * h;
y_output2 = y2 + (k12 + 2*k22 +2*k32 + k42)/6 * h;
y_output3 = y3 + (k13 + 2*k23 +2*k33 + k43)/6 * h;
end

