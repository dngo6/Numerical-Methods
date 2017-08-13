function c = Ralph()
clear
c = [];
time_max = 100; %number of timesteps
del_t = 5; %days
C_0 = 0; %initial cond
C_in = 1;

Q = 100; % flow m^3/d
V = 1000; %reactor volume m^3 -> t

t(1) = 0;
c(1) = C_0;

%Ralston's Method
i = 1;
while t(i) < time_max
    t(i+1) = t(i) + del_t;
    if t(i+1) > time_max
        t(i+1) = time_max;
        del_t = time_max - t(i);
    end
    
    k1 = derivs_lec(t(i), c(i), C_in, Q,V);
    k2 = derivs_lec(t(i)+3/4*del_t, c(i)+3/4*k1*del_t, C_in, Q,V);
    
    c(i+1) = c(i) + (1/3*k1+2/3*k2)*del_t;
    i=i+1;
end

plot(t,c, 'o');
xlabel('Time(d)')
ylabel('Concentration (g/m^3)')

%Analytical Solution
i = 1;
for i=1:length(t)
    c_exact(i) = (C_0-C_in)*exp(-Q/V*t(i))+C_in;
    i = i+1;
end

hold on
plot(t,c_exact)
grid
title('Comparison of Ralstons Solution with Theory')
legend('Ralston', 'Theory', 'location', 'best')
hold off
end

