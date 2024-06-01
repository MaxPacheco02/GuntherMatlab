function [x] = mypolcoefs(t0,tf,xd,vx_d)
    t_diff = tf - t0;
    A = [   1, 0, 0, 0;
            0, 1, 0, 0;
            1, t_diff, t_diff^2, t_diff^3;
            0, 1, 2*t_diff, 3*t_diff^2];
    b = [xd(1),vx_d(1),xd(2),vx_d(2)];
    x = A\b';
end