function dydt = algaefcn_grazing(t,y)
    global eps k_dz C_gz k_g 
    dydt = [k_g*y(1)-C_gz*y(1)*y(2); eps*y(1)*y(2)-k_dz*y(2)];
end