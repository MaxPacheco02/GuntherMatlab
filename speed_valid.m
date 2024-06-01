function [speeds, is_valid]=speed_valid(xdot,ydot,maxsp)
    speeds = zeros(1, size(xdot,2));
    is_valid = true;
    for i = 1:size(xdot,2)
        speeds(i) = sqrt(xdot(i)^2 + ydot(i)^2);
        if speeds(i) > maxsp
            is_valid = false;
        end
    end