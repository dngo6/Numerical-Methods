clear
C_0 = 0;
C_in = 1;
del_t = 5;
time_end = 60;
V = 1000;
Q = 100;
input_m = [C_in Q V];

t(1) = 0;
c(1) = C_0;

i = 1;
while t(i) < time_end;
    t(i+1) = t(i) + del_t;
    if t(i+1) > time_end
        del_t = time_end-t(i);
        t(i+1) = time_end;
    end
   
    c(i+1) = rk4_step(t(i), c(i), del_t, input_m);
    
    i = i+1;
end

plot (t, c, '*');
xlabel('Time (d)');
ylabel('Concentration (g/m^3)');

for i = 1: length (t)
    c_exact(i) = (C_0-C_in)*exp(-Q/V*t(i))+C_in;
end

hold on
plot(t,c_exact);

