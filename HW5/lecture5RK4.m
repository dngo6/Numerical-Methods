function [c, rel_error] = lecture5RK4()
clear
clc
global n Q Q23 V1 V2 V3 R C_in C1_0 C2_0 C3_0 k_d1 k_d2 k_d3

n = 3;
Q = 2000;
V1 = 100000;
V2 = 20000;
V3 = 30000;

C_in = 1000000;
C1_0 = C_in/V1;
C2_0 = 0;
C3_0 = 0;

del_t = 0.5;
end_time = 100;
i = 1;

t(1) = 0;

%Chemical decay
k_d1 = log(2)/(20);
k_d2 = k_d1;
k_d3 = k_d1;

%concentration of the three reactors
c1(1) = C1_0;
c2(1) = C2_0;
c3(1) = C3_0;

react2_hit = 0;
react3_hit = 0;
detected = 0;

while t(i) < end_time %c1(i) > 1 || c2(i) > 1 || c2(i) > 1 %while the concentration of each pond is not 1
    t(i+1) = t(i) + del_t;
    
    [c1(i+1), c2(i+1), c3(i+1)] = rk4_step(t(i), c1(i), c2(i), c3(i), del_t);
    
   if (detected == 0)
        if c2(i) > 1
            react2_hit = 1;
        end

        if c3(i) > 1
            react3_hit = 1;
        end

        if (react2_hit == 1 && react3_hit == 1)
            if c1(i) < 1
                disp('System 1');
                disp(t(i));
                react2_hit = 0;
                react3_hit = 0;
                detected = 1;
            end
            if c2(i) < 1
                disp('System 2');
                disp(t(i));
                react2_hit = 0;
                react3_hit = 0;
                detected = 1;
            end
            if c3(i) < 1
                disp('System 3');
                disp(t(i));
                react2_hit = 0;
                react3_hit = 0;
                detected = 1;
            end
        end
    end
    
        
    i = i+1;
end

plot(t,c1, 'bo', t, c2, 'rx', t,c3, '--');
xlabel('Time(d)')
ylabel('Concentration(g/m^3)')

grid
title('HW 5: Comparison of RK4 solution for three reactors with recirculation.')
legend('Reactor 1', 'Reactor 2', 'Reactor 3')
print('HW5RK4', '-dpng');
end

