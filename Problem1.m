dbstop if error
clc;
close all;
clear all;
patchlowx = [-1, -1, 1, 1, 2, 2, 5, 5];
patchlowy = [-1.5, -1, -1, 1, 1, -1, -1, -1.5];
patchhighx = [-1, -1, 3, 3, 3.5, 3.5, 5, 5];
patchhighy = [3, 2, 2, 0.5, 0.5, 2, 2, 3];
figure
hold on
axis equal
patch(patchlowx,patchlowy,'red')
patch(patchhighx,patchhighy,'red')
grid on
grid minor

%Defina las variables:
ts = [0,34,68,78,87.8,100,120];
inter_speed = 0.07071;
x_d_list = [0,1,3,3,3.5,4,4];
vx_d_list = [0,inter_speed,0,0,inter_speed,0,0];
y_d_list = [0,1.15,0,0,0.35,1,1];
vy_d_list = [0,inter_speed,0,0,inter_speed,0,0];

max_speed = 0.1;
N = 1000;

x = [];
y = [];
speeds = [];
time = [];

for i = 1:size(ts,2)-1
    t0 = ts(i);
    tf = ts(i+1);
    x_d = x_d_list(i:i+1);
    vx_d = vx_d_list(i:i+1);
    y_d = y_d_list(i:i+1);
    vy_d = vy_d_list(i:i+1);
    coefsx = mypolcoefs(t0,tf,x_d, vx_d);
    coefsy = mypolcoefs(t0,tf,y_d, vy_d);
    times = linspace(t0, tf, N);
    [x_tmp,xdot] = mypol(t0,tf,coefsx, N);
    [y_tmp,ydot] = mypol(t0,tf,coefsy, N);
    [speeds_tmp, speed_ok]=speed_valid(xdot,ydot, max_speed);
    disp(speed_ok);
    x = [x,x_tmp];
    y = [y,y_tmp];
    speeds = [speeds,speeds_tmp];
    time = [time, linspace(ts(i),ts(i+1),N)];
end

plot(x,y,color='blue')
hold on
for i=1:(size(ts,2)-1)*N
    rectangle('Position',[x(i)-0.1,y(i)-0.1,0.2,0.2],'Curvature',[1 1])
    hold on
end

figure(2)
subplot(3,1,1)
plot(time,speeds,color='black')
subplot(3,1,2)
plot(time,x,color='black')
subplot(3,1,3)
plot(time,y,color='black')
