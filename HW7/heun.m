%Non-self starting Heun's Method, Lecture 6 Example using while statement
clear
clc
% **** Define input variables ******
del_t = 0.5;
t_end = 5;

% **** Initialize parameters *****
t(1) = 2.5;
t(2) = 3;
t(3) = 3.5;
t(4) = 4;
y(1) = 0.48;
y(2) = 0.333333;
y(3) = 0.244898;
y(4) = 0.1875;

% **** start the time steps ******
i = 4;
while t(i) < t_end
    t(i+1) = t(i)+del_t;
    
    if t(i+1) > t_end
        t(i+1) = t_end;
        del_t = t_end - t(i);
    end
    
    dydt = -2*y(i)/t(i);
    
    if i == 1
        y_pred = y(i) + dydt*del_t;
    else
        y_pred = y(i-1) + 2*dydt*del_t;
    end
    
    dydt_new = -2*y_pred/t(i);
    y(i+1) = y(i) +(dydt+dydt_new)/2*del_t;
    i = i + 1; 
end

% ***** plot Heun's solution *****

plot(t,y,'o');
xlabel('Time(d)');
ylabel('Concentration (g/m^3)');

ye(1) = 0.48;
ye(2) = 0.333333;
ye(3) = 0.244898;
ye(4) = 0.1875;
ye(5) = 0.148148;
ye(6) = 0.12;

% *****calculate and plot the theoretical (exact) solution ********
for i = 1:length(t)
    rel_err(i) = abs(ye(i) - y(i))/ye(i) * 100;
end

hold on
plot(t, ye);
grid
title('Homework 7: Problem 26.6a - Heun');
legend('Heun', 'Theory', 'location', 'best');
print('figure1', '-dpng');
hold off

plot(t, rel_err, 'o')
title('Homework 7: Plot of true percent of relative error P26.1b');
xlabel('x');
ylabel('% of relative error');
print('relative_err', '-dpng');