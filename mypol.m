function [x,x_dot] = mypol(t0,tf,a, N)
    x = zeros(1,N);
    x_dot = zeros(1,N);
    t = linspace(t0, tf, N);
    for i=1:N
        t_diff = t(i) - t0;
        x(i) = a(1) + a(2)*t_diff + a(3)*t_diff^2 + a(4)*t_diff^3;
        x_dot(i) = a(2) + 2*a(3)*t_diff + 3*a(4)*t_diff^2;
    end