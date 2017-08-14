function dydt = hw9_func(t,y)
    global a b c d   
    dydt = [a*y(1)-b*y(1)*y(2); -c*y(2)+d*y(1)*y(2)];
end