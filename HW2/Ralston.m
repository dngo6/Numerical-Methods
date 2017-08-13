function c = Ralph()
clear
c = [];
time_max = 100; %number of timesteps
del_t = 5; %days

t(1) = 0;

%Euler's Method
i = 1;
while t(i) < time_max
    t(i+1) = t(i) + del_t;
    y(i+1) = y(i) + ((y(i)*t(i)^2) - 1.1*y(i)) *del_t;
	i = i+1;
end
plot(t,y, 'x');

%Ralston's Method
i = 1;
while t(i) < time_max
    t(i+1) = t(i) + del_t;
    if t(i+1) > time_max
        t(i+1) = time_max;
        del_t = time_max - t(i);
    end
    k1 = (C_in - c(i))*Q/V;
    C_eval = c(i) + k1*del_t*3/4;
    k2 = (C_in - C_eval)*Q/V;
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
title('Comparison of Eulers Solution with Theory')
legend('Euler', 'Ralston', 'Theory', 'location', 'best')
hold off
end

